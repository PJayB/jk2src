
/*****************************************************************************
 * name:		snd_mem.c
 *
 * desc:		sound caching
 *
 * $Archive: /MissionPack/code/client/snd_mem.c $
 * $Author: Raduffy $ 
 * $Revision: 39 $
 * $Modtime: 12/04/00 10:58a $
 * $Date: 12/04/00 11:06a $
 *
 *****************************************************************************/
#include "snd_local.h"

#include "snd_mp3.h"

/*
===============================================================================

WAV loading

===============================================================================
*/

static	byte	*data_p;
static	byte 	*iff_end;
static	byte 	*last_chunk;
static	byte 	*iff_data;
static	int 	iff_chunk_len;

static short GetLittleShort(void)
{
	short val = 0;
	val = *data_p;
	val = val + (*(data_p+1)<<8);
	data_p += 2;
	return val;
}

static int GetLittleLong(void)
{
	int val = 0;
	val = *data_p;
	val = val + (*(data_p+1)<<8);
	val = val + (*(data_p+2)<<16);
	val = val + (*(data_p+3)<<24);
	data_p += 4;
	return val;
}

static void FindNextChunk(char *name)
{
	while (1)
	{
		data_p=last_chunk;

		if (data_p >= iff_end)
		{	// didn't find the chunk
			data_p = NULL;
			return;
		}
		
		data_p += 4;
		iff_chunk_len = GetLittleLong();
		if (iff_chunk_len < 0)
		{
			data_p = NULL;
			return;
		}
		data_p -= 8;
		last_chunk = data_p + 8 + ( (iff_chunk_len + 1) & ~1 );
		if (!strncmp((char *)data_p, name, 4))
			return;
	}
}

static void FindChunk(char *name)
{
	last_chunk = iff_data;
	FindNextChunk (name);
}

/*
============
GetWavinfo
============
*/
static wavinfo_t GetWavinfo (char *name, byte *wav, int wavlength)
{
	wavinfo_t	info;

	Com_Memset (&info, 0, sizeof(info));

	if (!wav)
		return info;
		
	iff_data = wav;
	iff_end = wav + wavlength;

// find "RIFF" chunk
	FindChunk("RIFF");
	if (!(data_p && !strncmp((char *)data_p+8, "WAVE", 4)))
	{
		Com_Printf("Missing RIFF/WAVE chunks\n");
		return info;
	}

// get "fmt " chunk
	iff_data = data_p + 12;
// DumpChunks ();

	FindChunk("fmt ");
	if (!data_p)
	{
		Com_Printf("Missing fmt chunk\n");
		return info;
	}
	data_p += 8;
	info.format = GetLittleShort();
	info.channels = GetLittleShort();
	info.rate = GetLittleLong();
	data_p += 4+2;
	info.width = GetLittleShort() / 8;

	if (info.format != 1)
	{
		Com_Printf("Microsoft PCM format only\n");
		return info;
	}


// find data chunk
	FindChunk("data");
	if (!data_p)
	{
		Com_Printf("Missing data chunk\n");
		return info;
	}

	data_p += 4;
	info.samples = GetLittleLong () / info.width;
	info.dataofs = data_p - wav;

	return info;
}


/*
================
ResampleSfx

resample / decimate to the current source rate
================
*/
static 
void ResampleSfx (sfx_t *sfx, int iInRate, int iInWidth, byte *pData)
{
	int		iOutCount;
	int		iSrcSample;
	float	fStepScale;
	int		i;
	int		iSample;
	unsigned int uiSampleFrac, uiFracStep;	// uiSampleFrac MUST be unsigned, or large samples (eg music tracks) crash
	
	fStepScale = (float)iInRate / dma.speed;	// this is usually 0.5, 1, or 2

	// When stepscale is > 1 (we're downsampling), we really ought to run a low pass filter on the samples

	iOutCount = (int)(sfx->iSoundLengthInSamples / fStepScale);
	sfx->iSoundLengthInSamples = iOutCount;

	sfx->pSoundData = (short *) SND_malloc( sfx->iSoundLengthInSamples*2 ,sfx );

	sfx->fVolRange	= 0;
	uiSampleFrac	= 0;
	uiFracStep		= (int)(fStepScale*256);

	for (i=0 ; i<sfx->iSoundLengthInSamples ; i++)
	{
		iSrcSample = uiSampleFrac >> 8;
		uiSampleFrac += uiFracStep;
		if (iInWidth == 2) {
			iSample = LittleShort ( ((short *)pData)[iSrcSample] );			
		} else {
			iSample = (int)( (unsigned char)(pData[iSrcSample]) - 128) << 8;			
		}

		sfx->pSoundData[i] = (short)iSample;

		// work out max vol for this sample...
		//
		if (iSample < 0)
			iSample = -iSample;
		if (sfx->fVolRange < (iSample >> 8) )
		{
			sfx->fVolRange =  iSample >> 8;
		}
	}
}

// (MP3 helper func)
//
void S_LoadSound_Finalize(wavinfo_t	*info, sfx_t *sfx, byte *data)
{				   
	float	stepscale	= (float)info->rate / dma.speed;	
	int		len			= (int)(info->samples / stepscale);

	len *= info->width;

	sfx->eSoundCompressionMethod = ct_16;
	sfx->iSoundLengthInSamples	 = info->samples;
	ResampleSfx( sfx, info->rate, info->width, data + info->dataofs );	
}



//=============================================================================

/*
==============
S_LoadSound

The filename may be different than sfx->name in the case
of a forced fallback of a player specific sound
==============
*/
qboolean gbInsideLoadSound = qfalse;	// important to default to this!!!
static qboolean S_LoadSound_Actual( sfx_t *sfx )
{
	byte		*data;
	short		*samples;
	wavinfo_t	info;
	int			size;

	// player specific sounds are never directly loaded...
	//
	if ( sfx->sSoundName[0] == '*') {
		return qfalse;
	}

	// make up a local filename to try wav/mp3 substitutes...
	//
	char sRootName[MAX_QPATH];
	char sLoadName[MAX_QPATH];
	bool isMp3 = false;

	COM_StripExtension(sfx->sSoundName, sRootName);
	Com_sprintf(sLoadName, MAX_QPATH, "%s.wav", sRootName);

	//
	// 1st attempt, try whichever wav or mp3 is specified...
	//
	size = FS_ReadFile( sLoadName, (void **)&data );
	if ( !data )
	{
		// 2nd attempt, try wav instead of mp3 or vice versa...
		//		
		Com_sprintf(sLoadName, MAX_QPATH, "%s.mp3", sRootName);

		size = FS_ReadFile( sLoadName, (void **)&data );
		if ( !data )
		{
			return qfalse;
		}
		isMp3 = true;
	}

	SND_TouchSFX(sfx);
	sfx->iLastTimeUsed = Com_Milliseconds()+1;	// why +1? Hmmm, leave it for now I guess	

//=========
	if (isMp3)
	{
		// load MP3 file instead...
		//		
		if (MP3_IsValid(sfx->sSoundName,data, size))
		{
			int iRawPCMDataSize = MP3_GetUnpackedSize(sfx->sSoundName,data,size);
			
			if (MP3Stream_InitFromFile(sfx, data, size, sfx->sSoundName, iRawPCMDataSize + 2304 /* + 1 MP3 frame size, jic */)
				)
			{
//				Com_DPrintf("(Keeping file \"%s\" as MP3)\n",altname);
			}
			else
			{
				// small file, not worth keeping as MP3 since it would increase in size (with MP3 header etc)...
				//
				Com_DPrintf("S_LoadSound: Unpacking MP3 file \"%s\" to wav.\n",sfx->sSoundName);
				//
				// unpack and convert into WAV...
				//
				byte *pbUnpackBuffer = (byte *) Z_Malloc ( iRawPCMDataSize+10 +2304 /* <g> */, TAG_TEMP_WORKSPACE );	// won't return if fails

				int iResultBytes = MP3_UnpackRawPCM( sfx->sSoundName, data, size, pbUnpackBuffer );
				if (iResultBytes!= iRawPCMDataSize){
					Com_Printf("**** MP3 final unpack size %d different to previous value %d\n",iResultBytes,iRawPCMDataSize);
					//assert (iResultBytes == iRawPCMDataSize);
				}

				// fake up a WAV structure so I can use the other post-load sound code such as volume calc for lip-synching
				//
				// (this is a bit crap really, but it lets me drop through into existing code)...
				//
				MP3_FakeUpWAVInfo( sfx->sSoundName, data, size, iResultBytes,
									// these params are all references...
									info.format, info.rate, info.width, info.channels, info.samples, info.dataofs
								);

				S_LoadSound_Finalize(&info,sfx,pbUnpackBuffer);

				Z_Free(pbUnpackBuffer);
			}
		}
		else
		{
			// MP3_IsValid() will already have printed any errors via Com_Printf at this point...
			//			
			FS_FreeFile (data);
			return qfalse;
		}
	}
	else
	{
		// loading a WAV, presumably...

//=========

		info = GetWavinfo( sfx->sSoundName, data, size );
		if ( info.channels != 1 ) {
			Com_Printf ("%s is a stereo wav file\n", sfx->sSoundName);
			FS_FreeFile (data);
			return qfalse;
		}
#ifdef _DEBUG
		if ( info.width == 1 ) {
			Com_Printf(S_COLOR_YELLOW "WARNING: %s is an 8 bit wav file\n", sfx->sSoundName);
		}

		if ( info.rate != 22050 ) {
			Com_Printf(S_COLOR_YELLOW "WARNING: %s is not a 22kHz wav file\n", sfx->sSoundName);
		}
#endif

		samples = (short *)Z_Malloc(info.samples * sizeof(short) * 2, TAG_TEMP_WORKSPACE);		

		// each of these compression schemes works just fine
		// but the 16bit quality is much nicer and with a local
		// install assured we can rely upon the sound memory
		// manager to do the right thing for us and page
		// sound in as needed
		//
		sfx->eSoundCompressionMethod= ct_16;
		sfx->iSoundLengthInSamples	= info.samples;
		sfx->pSoundData = NULL;
		ResampleSfx( sfx, info.rate, info.width, data + info.dataofs );		

		Z_Free(samples);
	}
	
	FS_FreeFile( data );

	return qtrue;
}


qboolean S_LoadSound( sfx_t *sfx )
{
	gbInsideLoadSound = qtrue;	// !!!!!!!!!!!!!!
		
		qboolean bReturn = S_LoadSound_Actual( sfx );

	gbInsideLoadSound = qfalse;	// !!!!!!!!!!!!!!

	return bReturn;
}

