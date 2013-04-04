// leave this as first line for PCH reasons...
//
#include "../server/exe_headers.h"



#ifndef __Q_SHARED_H
	#include "../game/q_shared.h"
#endif

#if !defined(TR_LOCAL_H)
	#include "../renderer/tr_local.h"
#endif

#if !defined(G2_H_INC)
	#include "G2.h"
#endif

#pragma warning(disable : 4512)		//assignment op could not be genereated

class CQuickOverride
{
	int mOverride[512];
	int mAt[512];
	int mCurrentTouch;
public:
	CQuickOverride()
	{
		mCurrentTouch=1;
		int i;
		for (i=0;i<512;i++)
		{
			mOverride[i]=0;
		}
	}
	void Invalidate()
	{
		mCurrentTouch++;
	}
	void Set(int index,int pos)
	{
		if (index==10000)
		{
			return;
		}
		assert(index>=0&&index<512);
		mOverride[index]=mCurrentTouch;
		mAt[index]=pos;
	}
	int Test(int index)
	{
		assert(index>=0&&index<512);
		if (mOverride[index]!=mCurrentTouch)
		{
			return -1;
		}
		else
		{
			return mAt[index];
		}
	}
};

static CQuickOverride QuickOverride;


// find a particular surface in the surface override list
const surfaceInfo_t *G2_FindOverrideSurface(int surfaceNum,const surfaceInfo_v &surfaceList)
{
	
	if (surfaceNum<0)
	{
		// starting a new lookup
		QuickOverride.Invalidate();
		int i; 
		for(i=0; i<surfaceList.size(); i++)
		{
			if (surfaceList[i].surface>=0)
			{
				QuickOverride.Set(surfaceList[i].surface,i);
			}
		}
		return NULL;
	}
	int idx=QuickOverride.Test(surfaceNum);
	if (idx<0)
	{
		int i; 
		if (surfaceNum==10000)
		{
			for(i=0; i<surfaceList.size(); i++)
			{
				if (surfaceList[i].surface == surfaceNum)
				{
					return &surfaceList[i];
				}
			}
		}
#if _DEBUG
		// look through entire list
		for(i=0; i<surfaceList.size(); i++)
		{
			if (surfaceList[i].surface == surfaceNum)
			{
				break;
			}
		}
		// didn't find it.
		assert(i==surfaceList.size()); // our quickoverride is not working right
#endif
		return NULL;
	}
	assert(idx>=0&&idx<surfaceList.size());
	assert(surfaceList[idx].surface == surfaceNum);
	return &surfaceList[idx];
}


// given a surface name, lets see if it's legal in the model
int G2_IsSurfaceLegal(const void *mod, const char *surfaceName, int *flags)
{
	// damn include file dependancies
	mdxmSurfHierarchy_t	*surf;
	const model_t *mod_m = (const model_t *)mod;
	surf = (mdxmSurfHierarchy_t *) ( (byte *)mod_m->mdxm + mod_m->mdxm->ofsSurfHierarchy );

	for ( int i = 0 ; i < mod_m->mdxm->numSurfaces ; i++) 
	{
	 	if (!stricmp(surfaceName, surf->name))
	 	{
			*flags = surf->flags;
			return i;
		}
		// find the next surface
  		surf = (mdxmSurfHierarchy_t *)( (byte *)surf + (int)( &((mdxmSurfHierarchy_t *)0)->childIndexes[ surf->numChildren ] ));
	}
	return -1;
}


/************************************************************************************************
 * G2_FindSurface
 *    find a surface in a ghoul2 surface override list based on it's name
 *
 * Input
 *    filename of model, surface list of model instance, name of surface, int to be filled in
 * with the index of this surface (defaults to NULL)
 *
 * Output
 *    pointer to surface if successful, false otherwise
 *
 ************************************************************************************************/
const mdxmSurface_t *G2_FindSurface(const char *fileName, surfaceInfo_v &slist, const char *surfaceName,
							 int *surfIndex/*NULL*/)
{
	int						i = 0;
	// find the model we want
	const model_t				*mod = R_GetModelByHandle(RE_RegisterModel(fileName));
	const mdxmHierarchyOffsets_t *surfIndexes = (mdxmHierarchyOffsets_t *)((byte *)mod->mdxm + sizeof(mdxmHeader_t));

	// did we find a ghoul 2 model or not?
	if (!mod->mdxm)
	{
		assert(0);
		if (surfIndex)
		{
			*surfIndex = -1;
		}
		return 0;
	}
   
 	// first find if we already have this surface in the list
	for (i = slist.size() - 1; i >= 0; i--)
	{
		if ((slist[i].surface != 10000) && (slist[i].surface != -1))
		{
			const mdxmSurface_t	*surf = (mdxmSurface_t *)G2_FindSurface((void *)mod, slist[i].surface, 0);
			// back track and get the surfinfo struct for this surface
			const mdxmSurfHierarchy_t	*surfInfo = (mdxmSurfHierarchy_t *)((byte *)surfIndexes + surfIndexes->offsets[surf->thisSurfaceIndex]);

  			// are these the droids we're looking for?
			if (!stricmp (surfInfo->name, surfaceName))
			{
				// yup
				if (surfIndex)
				{
					*surfIndex = i;
				}
				return surf;
			}
		}
	}
	// didn't find it
	if (surfIndex)
	{
		*surfIndex = -1;
	}
	return 0;
}

// set a named surface offFlags - if it doesn't find a surface with this name in the list then it will add one.
qboolean G2_SetSurfaceOnOff (const char *fileName, surfaceInfo_v &slist, const char *surfaceName, const int offFlags)
{
	int					surfIndex = -1;
	surfaceInfo_t		temp_slist_entry;
	// find the model we want
	const model_t		*mod = R_GetModelByHandle(RE_RegisterModel(fileName));

	// did we find a ghoul 2 model or not?
	if (!mod->mdxm)
	{
		assert(0);
		return qfalse;
	}
 
 	// first find if we already have this surface in the list
	const mdxmSurface_t *surf = G2_FindSurface(fileName, slist, surfaceName, &surfIndex);
	if (surf)
	{
		// set descendants value
		slist[surfIndex].offFlags = offFlags;
		return qtrue;
	}
	else
	{
		// ok, not in the list already - in that case, lets verify this surface exists in the model mesh
		int	flags;
		int surfaceNum = G2_IsSurfaceLegal((void*)mod, surfaceName, &flags);
		if (surfaceNum != -1)
		{
			// the only bit we really care about in the incoming flags is the off bit
			flags &= !(G2SURFACEFLAG_OFF | G2SURFACEFLAG_NODESCENDANTS);
			flags |= offFlags & (G2SURFACEFLAG_OFF | G2SURFACEFLAG_NODESCENDANTS);

			// insert here then
			temp_slist_entry.offFlags = flags;
			temp_slist_entry.surface = surfaceNum;
 
			slist.push_back(temp_slist_entry);

			return qtrue;
		}
	}
	return qfalse;
}

// return a named surfaces off flags - should tell you if this surface is on or off.
int G2_IsSurfaceOff (const char *fileName, surfaceInfo_v &slist, const char *surfaceName)
{
	const model_t		*mod = R_GetModelByHandle(RE_RegisterModel(fileName));
	int					surfIndex = -1;

	// did we find a ghoul 2 model or not?
	if (!mod->mdxm)
	{
		return 0;
	}
   
 	// first find if we already have this surface in the list
	const mdxmSurface_t *surf = surf = G2_FindSurface(fileName, slist, surfaceName, &surfIndex);
	if (surf)
	{
		// set descendants value
		return slist[surfIndex].offFlags;
	}
	// ok, we didn't find it in the surface list. Lets look at the original surface then.

	mdxmSurfHierarchy_t	*surface = (mdxmSurfHierarchy_t *) ( (byte *)mod->mdxm + mod->mdxm->ofsSurfHierarchy );

	for ( int i = 0 ; i < mod->mdxm->numSurfaces ; i++) 
	{
	 	if (!stricmp(surfaceName, surface->name))
	 	{
			return surface->flags;
		}
		// find the next surface
  		surface = (mdxmSurfHierarchy_t *)( (byte *)surface + (int)( &((mdxmSurfHierarchy_t *)0)->childIndexes[ surface->numChildren ] ));
	}

	assert(0);
	return 0;
}

void G2_FindRecursiveSurface(const model_t *currentModel, int surfaceNum, surfaceInfo_v &rootList, int *activeSurfaces)
{
	int							i;
 	const mdxmSurface_t			*surface = (mdxmSurface_t *)G2_FindSurface((void *)currentModel, surfaceNum, 0);
	const mdxmHierarchyOffsets_t	*surfIndexes = (mdxmHierarchyOffsets_t *)((byte *)currentModel->mdxm + sizeof(mdxmHeader_t));
	const mdxmSurfHierarchy_t		*surfInfo = (mdxmSurfHierarchy_t *)((byte *)surfIndexes + surfIndexes->offsets[surface->thisSurfaceIndex]);

	// see if we have an override surface in the surface list
	const surfaceInfo_t	*surfOverride = G2_FindOverrideSurface(surfaceNum, rootList);

	// really, we should use the default flags for this surface unless it's been overriden
	int offFlags = surfInfo->flags;

	// set the off flags if we have some
	if (surfOverride)
	{
		offFlags = surfOverride->offFlags;
	}

	// if this surface is not off, indicate as such in the active surface list
	if (!(offFlags & G2SURFACEFLAG_OFF))
	{
		activeSurfaces[surfaceNum] = 1;
	}
 	else
	// if we are turning off all descendants, then stop this recursion now
	if (offFlags & G2SURFACEFLAG_NODESCENDANTS)
	{
		return;
	}

	// now recursively call for the children
	for (i=0; i< surfInfo->numChildren; i++)
	{
		surfaceNum = surfInfo->childIndexes[i];
		G2_FindRecursiveSurface(currentModel, surfaceNum, rootList, activeSurfaces);
	}

}

void G2_RemoveRedundantGeneratedSurfaces(surfaceInfo_v &slist, int *activeSurfaces)
{
	int		i;

	// walk the surface list, removing surface overrides or generated surfaces that are pointing at surfaces that aren't active anymore
	for (i=0; i<slist.size(); i++)
	{
		if (slist[i].surface != -1)
		{
			// is this a generated surface?
			if (slist[i].offFlags & G2SURFACEFLAG_GENERATED)
			{
				// if it's not in the list, remove it
				if (!activeSurfaces[slist[i].genPolySurfaceIndex & 0xffff])
				{
					G2_RemoveSurface(slist, i);
				}
			}
			// no, so it does point back at a legal surface
			else
			{
				// if it's not in the list, remove it
				if (!activeSurfaces[slist[i].surface])
				{
					G2_RemoveSurface(slist, i);
				}
			}
		}
	}
}

qboolean G2_SetRootSurface( CGhoul2Info_v &ghoul2, const int modelIndex, const char *fileName, const char *surfaceName)
{
	model_t				*mod_m = R_GetModelByHandle(RE_RegisterModel(fileName));
	int					surf;
	int					flags;
	int					*activeSurfaces;

	// did we find a ghoul 2 model or not?
	if (!mod_m->mdxm)
	{
		return qfalse;
	}
   
 	// first find if we already have this surface in the list
	surf = G2_IsSurfaceLegal(mod_m, surfaceName, &flags);
	if (surf != -1)
	{
		// first see if this ghoul2 model already has this as a root surface
		if (ghoul2[modelIndex].mSurfaceRoot == surf)
		{
			return qtrue;
		}

		// set the root surface
		ghoul2[modelIndex].mSurfaceRoot = surf;

		// ok, now the tricky bits.
		// firstly, generate a list of active / on surfaces below the root point

		// gimme some space to put this list into
		activeSurfaces = (int *)Z_Malloc(mod_m->mdxm->numSurfaces * 4, TAG_GHOUL2,qfalse);
		memset(activeSurfaces, 0, (mod_m->mdxm->numSurfaces * 4));

		G2_FindOverrideSurface(-1,ghoul2[modelIndex].mSlist); //reset the quick surface override lookup;

		G2_FindRecursiveSurface(mod_m, surf, ghoul2[modelIndex].mSlist, activeSurfaces);

		// now remove all procedural or override surfaces that refer to surfaces that arent on this list
		G2_RemoveRedundantGeneratedSurfaces(ghoul2[modelIndex].mSlist, activeSurfaces);

		// remember to free what we used
		Z_Free(activeSurfaces);
		return (qtrue);
	}
	assert(0);
	return qfalse;
}


extern int			G2_DecideTraceLod(CGhoul2Info &ghoul2, int useLod, const model_t *mod);
int G2_AddSurface(CGhoul2Info *ghoul2, int surfaceNumber, int polyNumber, float BarycentricI, float BarycentricJ, int lod )
{

	surfaceInfo_t temp_slist_entry;

	// decide if LOD is legal
	const model_t * const currentModel = R_GetModelByHandle(RE_RegisterModel(ghoul2->mFileName));
	lod = G2_DecideTraceLod(*(CGhoul2Info *)(ghoul2), lod, currentModel);

	// first up, see if we have a free one already set up  - look only from the end of the constant surfaces onwards
	for (int i=0; i<ghoul2->mSlist.size(); i++)
	{
		// is the surface count -1? That would indicate it's free
		if (ghoul2->mSlist[i].surface == -1)
		{
			ghoul2->mSlist[i].offFlags = G2SURFACEFLAG_GENERATED;
			ghoul2->mSlist[i].surface = 10000;		// no model will ever have 10000 surfaces
			ghoul2->mSlist[i].genBarycentricI = BarycentricI;
			ghoul2->mSlist[i].genBarycentricJ = BarycentricJ;
			ghoul2->mSlist[i].genPolySurfaceIndex = ((polyNumber & 0xffff) << 16) | (surfaceNumber & 0xffff);
			ghoul2->mSlist[i].genLod = lod;
			return i;
		}
	}

	// ok, didn't find one. Better create one

	temp_slist_entry.offFlags = G2SURFACEFLAG_GENERATED;
	temp_slist_entry.surface = 10000;
	temp_slist_entry.genBarycentricI = BarycentricI;
	temp_slist_entry.genBarycentricJ = BarycentricJ;
	temp_slist_entry.genPolySurfaceIndex = ((polyNumber & 0xffff) << 16) | (surfaceNumber & 0xffff);
	temp_slist_entry.genLod = lod;

	ghoul2->mSlist.push_back(temp_slist_entry);

	return (ghoul2->mSlist.size() -1 );
}

qboolean G2_RemoveSurface(surfaceInfo_v &slist, const int index)
{
		// did we find it?
	if (index != -1)
	{
		 // set us to be the 'not active' state
		slist[index].surface = -1;

		int newSize = slist.size();
		// now look through the list from the back and see if there is a block of -1's we can resize off the end of the list
		for (int i=slist.size()-1; i>-1; i--)
		{
			if (slist[i].surface == -1)
			{
				newSize = i;
			}
			// once we hit one that isn't a -1, we are done.
			else
			{
				break;
			}
		}
		// do we need to resize?
		if (newSize != slist.size())
		{
			// yes, so lets do it
			slist.resize(newSize);
		}

		return qtrue;
	}

	assert(0);

	// no
	return qfalse;
}


int G2_GetParentSurface(const char *fileName, const int index)
{
	const model_t					*mod = R_GetModelByHandle(RE_RegisterModel(fileName));
	const mdxmHierarchyOffsets_t	*surfIndexes = (mdxmHierarchyOffsets_t *)((byte *)mod->mdxm + sizeof(mdxmHeader_t));

	// walk each surface and see if this index is listed in it's children
	const mdxmSurface_t				*surf = (mdxmSurface_t *)G2_FindSurface((void *)mod, index, 0);
	const mdxmSurfHierarchy_t		*surfInfo = (mdxmSurfHierarchy_t *)((byte *)surfIndexes + surfIndexes->offsets[surf->thisSurfaceIndex]);

	return surfInfo->parentIndex;

}

int G2_GetSurfaceIndex(const char *fileName, const char *surfaceName)
{
	const model_t	*mod = R_GetModelByHandle(RE_RegisterModel(fileName));
	int				flags;
	
	return G2_IsSurfaceLegal(mod, surfaceName, &flags);
}

int G2_IsSurfaceRendered(const char *fileName, const char *surfaceName, surfaceInfo_v &slist)
{
	const model_t			*mod = R_GetModelByHandle(RE_RegisterModel(fileName));
	int						surfIndex = -1;
	const mdxmSurface_t		*parentSurf = 0;
	int						flags = 0, surfFlags = 0;
	int						parentFlags = 0;
	int						parentSurfNum = 0;
	const mdxmHierarchyOffsets_t	*surfIndexes = (mdxmHierarchyOffsets_t *)((byte *)mod->mdxm + sizeof(mdxmHeader_t));
	const mdxmSurfHierarchy_t		*parentSurfInfo = 0;

	// did we find a ghoul 2 model or not?
	if (!mod->mdxm)
	{
		return 0;
	}
   

	// now see if we already have overriden this surface in the slist 
	const mdxmSurface_t *surf = G2_FindSurface(fileName, slist, surfaceName, &surfIndex);
	if (surf)
	{
		// set descendants value
		surfFlags = slist[surfIndex].offFlags;
	}

	// ok, at this point in flags we have what this surface is set to, and the index of the surface itself
	// now travel up the skeleton to see if any of it's ancestors have a 'no descendants' turned on

	// find the original surface in the surface list
	int surfNum = G2_IsSurfaceLegal(mod, surfaceName, &flags);
	if ( surfNum != -1 )
	{//must be legal
		const mdxmSurfHierarchy_t *surfInfo = (mdxmSurfHierarchy_t *)((byte *)surfIndexes + surfIndexes->offsets[surfNum]);
		surfNum = surfInfo->parentIndex;
		// walk the surface hierarchy up until we hit the root
		while (surfNum != -1)
		{
			parentSurfInfo = (mdxmSurfHierarchy_t *)((byte *)surfIndexes + surfIndexes->offsets[surfNum]);

			// find the original surface in the surface list
			parentSurfNum = G2_IsSurfaceLegal(mod, surfaceName, &parentFlags);

			// now see if we already have overriden this surface in the slist 
			parentSurf = G2_FindSurface(fileName, slist, parentSurfInfo->name, &surfIndex);
			if (parentSurf)
			{
				// set descendants value
				parentFlags = slist[surfIndex].offFlags;
			}
			// now we have the parent flags, lets see if any have the 'no descendants' flag set
			if (parentFlags & G2SURFACEFLAG_NODESCENDANTS)
			{
				flags = G2SURFACEFLAG_OFF;
			}
			// set up scan of next parent
			surfNum = parentSurfInfo->parentIndex;
		}
	}
	if ( flags == 0 )
	{//it's not being overridden by a parent
		flags = surfFlags;//use whatever flags it had on itself
	}
	return flags;

}
