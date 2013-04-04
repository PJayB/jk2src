data
export saberSpinSound
align 4
LABELV saberSpinSound
byte 4 0
export saberOffSound
align 4
LABELV saberOffSound
byte 4 0
export saberOnSound
align 4
LABELV saberOnSound
byte 4 0
export saberHumSound
align 4
LABELV saberHumSound
byte 4 0
export RandFloat
code
proc RandFloat 8 0
file "../w_saber.c"
line 15
;1:#include "g_local.h"
;2:#include "bg_local.h" //Only because we use PM_SetAnim here once.
;3:#include "w_saber.h"
;4:#include "ai_main.h"
;5:#include "..\ghoul2\g2.h"
;6:
;7:extern bot_state_t *botstates[MAX_CLIENTS];
;8:extern qboolean InFront( vec3_t spot, vec3_t from, vec3_t fromAngles, float threshHold );
;9:
;10:int saberSpinSound = 0;
;11:int saberOffSound = 0;
;12:int saberOnSound = 0;
;13:int saberHumSound = 0;
;14:
;15:float RandFloat(float min, float max) {
line 16
;16:	return ((rand() * (max - min)) / 32768.0F) + min;
ADDRLP4 0
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRFP4 0
INDIRF4
ASGNF4
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
MULF4
CNSTF4 1191182336
DIVF4
ADDRLP4 4
INDIRF4
ADDF4
RETF4
LABELV $83
endproc RandFloat 8 0
export SaberUpdateSelf
proc SaberUpdateSelf 20 4
line 20
;17:}
;18:
;19:void SaberUpdateSelf(gentity_t *ent)
;20:{
line 21
;21:	if (ent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $85
line 22
;22:	{
line 23
;23:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 24
;24:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 25
;25:		return;
ADDRGP4 $84
JUMPV
LABELV $85
line 28
;26:	}
;27:
;28:	if (!g_entities[ent->r.ownerNum].inuse ||
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $94
ADDRLP4 0
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $88
LABELV $94
line 31
;29:		!g_entities[ent->r.ownerNum].client ||
;30:		g_entities[ent->r.ownerNum].client->sess.sessionTeam == TEAM_SPECTATOR)
;31:	{
line 32
;32:		ent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 33
;33:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 34
;34:		return;
ADDRGP4 $84
JUMPV
LABELV $88
line 37
;35:	}
;36:
;37:	if (g_entities[ent->r.ownerNum].client->ps.saberInFlight && g_entities[ent->r.ownerNum].health > 0)
ADDRLP4 4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $96
ADDRLP4 4
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $96
line 38
;38:	{ //let The Master take care of us now (we'll get treated like a missile until we return)
line 39
;39:		ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 40
;40:		return;
ADDRGP4 $84
JUMPV
LABELV $96
line 43
;41:	}
;42:
;43:	if (g_entities[ent->r.ownerNum].client->ps.usingATST)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $101
line 44
;44:	{
line 45
;45:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 46
;46:		ent->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 47
;47:	}
ADDRGP4 $102
JUMPV
LABELV $101
line 48
;48:	else if (g_entities[ent->r.ownerNum].client->ps.weapon != WP_SABER ||
ADDRLP4 12
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $114
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $114
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $114
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $114
ADDRLP4 12
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
NEI4 $104
LABELV $114
line 54
;49:		(g_entities[ent->r.ownerNum].client->ps.pm_flags & PMF_FOLLOW) ||
;50:		g_entities[ent->r.ownerNum].health < 1 ||
;51:		g_entities[ent->r.ownerNum].client->ps.saberHolstered ||
;52:		!g_entities[ent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK]/* ||
;53:		!g_entities[ent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW]*/)
;54:	{
line 55
;55:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 56
;56:		ent->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 57
;57:	}
ADDRGP4 $105
JUMPV
LABELV $104
line 59
;58:	else
;59:	{
line 60
;60:		ent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 61
;61:		ent->clipmask = MASK_PLAYERSOLID | CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262417
ASGNI4
line 62
;62:	}
LABELV $105
LABELV $102
line 64
;63:
;64:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 66
;65:
;66:	ent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 67
;67:}
LABELV $84
endproc SaberUpdateSelf 20 4
export SaberGotHit
proc SaberGotHit 12 0
line 70
;68:
;69:void SaberGotHit( gentity_t *self, gentity_t *other, trace_t *trace )
;70:{
line 71
;71:	gentity_t *own = &g_entities[self->r.ownerNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 73
;72:
;73:	if (!own || !own->client)
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $119
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $117
LABELV $119
line 74
;74:	{
line 75
;75:		return;
LABELV $117
line 79
;76:	}
;77:
;78:	//Do something here..? Was handling projectiles here, but instead they're now handled in their own functions.
;79:}
LABELV $116
endproc SaberGotHit 12 0
export WP_SaberInitBladeData
proc WP_SaberInitBladeData 32 4
line 82
;80:
;81:void WP_SaberInitBladeData( gentity_t *ent )
;82:{
line 87
;83:	gentity_t *saberent;
;84:
;85:	//We do not want the client to have any real knowledge of the entity whatsoever. It will only
;86:	//ever be used on the server.
;87:	saberent = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 88
;88:	ent->client->ps.saberEntityNum = saberent->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 89
;89:	saberent->classname = "lightsaber";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $121
ASGNP4
line 91
;90:			
;91:	saberent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 92
;92:	saberent->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 94
;93:
;94:	saberent->clipmask = MASK_PLAYERSOLID | CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 262417
ASGNI4
line 95
;95:	saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 97
;96:
;97:	VectorSet( saberent->r.mins, -8.0f, -8.0f, -8.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 98
;98:	VectorSet( saberent->r.maxs, 8.0f, 8.0f, 8.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 100
;99:
;100:	saberent->mass = 10;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTF4 1092616192
ASGNF4
line 102
;101:
;102:	saberent->s.eFlags |= EF_NODRAW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 103
;103:	saberent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 105
;104:
;105:	saberent->touch = SaberGotHit;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 107
;106:
;107:	saberent->think = SaberUpdateSelf;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 108
;108:	saberent->nextthink = level.time + 50;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 110
;109:
;110:	saberSpinSound = G_SoundIndex("sound/weapons/saber/saberspin.wav");
ADDRGP4 $123
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberSpinSound
ADDRLP4 16
INDIRI4
ASGNI4
line 111
;111:	saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $124
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 20
INDIRI4
ASGNI4
line 112
;112:	saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $125
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 24
INDIRI4
ASGNI4
line 113
;113:	saberHumSound = G_SoundIndex("sound/weapons/saber/saberhum1.wav");
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberHumSound
ADDRLP4 28
INDIRI4
ASGNI4
line 114
;114:}
LABELV $120
endproc WP_SaberInitBladeData 32 4
export G_G2ClientSpineAngles
proc G_G2ClientSpineAngles 168 36
line 176
;115:
;116:#if 0
;117:static void G_SwingAngles( float destination, float swingTolerance, float clampTolerance,
;118:					float speed, float *angle, qboolean *swinging ) {
;119:	float	swing;
;120:	float	move;
;121:	float	scale;
;122:
;123:	if ( !*swinging ) {
;124:		// see if a swing should be started
;125:		swing = AngleSubtract( *angle, destination );
;126:		if ( swing > swingTolerance || swing < -swingTolerance ) {
;127:			*swinging = qtrue;
;128:		}
;129:	}
;130:
;131:	if ( !*swinging ) {
;132:		return;
;133:	}
;134:	
;135:	// modify the speed depending on the delta
;136:	// so it doesn't seem so linear
;137:	swing = AngleSubtract( destination, *angle );
;138:	scale = fabs( swing );
;139:	if ( scale < swingTolerance * 0.5 ) {
;140:		scale = 0.5;
;141:	} else if ( scale < swingTolerance ) {
;142:		scale = 1.0;
;143:	} else {
;144:		scale = 2.0;
;145:	}
;146:
;147:	// swing towards the destination angle
;148:	if ( swing >= 0 ) {
;149:		move = FRAMETIME * scale * speed;
;150:		if ( move >= swing ) {
;151:			move = swing;
;152:			*swinging = qfalse;
;153:		}
;154:		*angle = AngleMod( *angle + move );
;155:	} else if ( swing < 0 ) {
;156:		move = FRAMETIME * scale * -speed;
;157:		if ( move <= swing ) {
;158:			move = swing;
;159:			*swinging = qfalse;
;160:		}
;161:		*angle = AngleMod( *angle + move );
;162:	}
;163:
;164:	// clamp to no more than tolerance
;165:	swing = AngleSubtract( destination, *angle );
;166:	if ( swing > clampTolerance ) {
;167:		*angle = AngleMod( destination - (clampTolerance - 1) );
;168:	} else if ( swing < -clampTolerance ) {
;169:		*angle = AngleMod( destination + (clampTolerance - 1) );
;170:	}
;171:}
;172:#endif
;173:
;174://NOTE: If C` is modified this function should be modified as well (and vice versa)
;175:void G_G2ClientSpineAngles( gentity_t *ent, vec3_t viewAngles, const vec3_t angles, vec3_t thoracicAngles, vec3_t ulAngles, vec3_t llAngles )
;176:{
line 177
;177:	int ang = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 179
;178:
;179:	VectorClear(ulAngles);
ADDRLP4 4
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRF4
ASGNF4
line 180
;180:	VectorClear(llAngles);
ADDRLP4 12
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRF4
ASGNF4
line 182
;181:
;182:	viewAngles[YAW] = AngleDelta( ent->client->ps.viewangles[YAW], angles[YAW] );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRFP4 4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 184
;183:
;184:	if ( !BG_FlippingAnim( ent->client->ps.legsAnim ) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $128
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $128
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $128
line 193
;185:		!BG_SpinningSaberAnim( ent->client->ps.legsAnim ) &&
;186:		!BG_SpinningSaberAnim( ent->client->ps.torsoAnim ) &&
;187:		!BG_InSpecialJump( ent->client->ps.legsAnim ) &&
;188:		!BG_InSpecialJump( ent->client->ps.torsoAnim ) &&
;189:		!BG_InRoll(&ent->client->ps, ent->client->ps.legsAnim) &&
;190:		!BG_SaberInSpecial(ent->client->ps.saberMove) &&
;191:		!BG_SaberInSpecialAttack(ent->client->ps.torsoAnim) &&
;192:		!BG_SaberInSpecialAttack(ent->client->ps.legsAnim) )
;193:	{
line 198
;194:		//adjust for motion offset
;195:		mdxaBone_t	boltMatrix;
;196:		vec3_t		motionFwd, motionAngles;
;197:
;198:		trap_G2API_GetBoltMatrix_NoReconstruct( ent->client->ghoul2, 0, ent->bolt_Motion, &boltMatrix, vec3_origin, ent->client->ps.origin, level.time, /*cgs.gameModels*/0, vec3_origin);
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
ADDRLP4 148
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 148
INDIRP4
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix_NoReconstruct
CALLI4
pop
line 209
;199:		//trap_G2API_GiveMeVectorFromMatrix( &boltMatrix, POSITIVE_X, motionFwd );
;200:		//POSITIVE_X:
;201:		/*
;202:		motionFwd[0] = boltMatrix.matrix[0][0];
;203:		motionFwd[1] = boltMatrix.matrix[1][0];
;204:		motionFwd[2] = boltMatrix.matrix[2][0];
;205:		*/
;206:		
;207:
;208:		//NEGATIVE_Y:
;209:		motionFwd[0] = -boltMatrix.matrix[0][1];
ADDRLP4 128
ADDRLP4 80+4
INDIRF4
NEGF4
ASGNF4
line 210
;210:		motionFwd[1] = -boltMatrix.matrix[1][1];
ADDRLP4 128+4
ADDRLP4 80+16+4
INDIRF4
NEGF4
ASGNF4
line 211
;211:		motionFwd[2] = -boltMatrix.matrix[2][1];
ADDRLP4 128+8
ADDRLP4 80+32+4
INDIRF4
NEGF4
ASGNF4
line 213
;212:
;213:		vectoangles( motionFwd, motionAngles );
ADDRLP4 128
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 214
;214:		for ( ang = 0; ang < 3; ang++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $138
line 215
;215:		{
line 216
;216:			viewAngles[ang] = AngleNormalize180( viewAngles[ang] - AngleNormalize180( motionAngles[ang] ) );
ADDRLP4 152
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 152
INDIRI4
ADDRLP4 68
ADDP4
INDIRF4
ARGF4
ADDRLP4 156
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 152
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRLP4 164
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 160
INDIRP4
ADDRLP4 164
INDIRF4
ASGNF4
line 217
;217:		}
LABELV $139
line 214
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $138
line 219
;218:
;219:		if (viewAngles[YAW] < -90)
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 3266576384
GEF4 $142
line 220
;220:		{
line 221
;221:			viewAngles[YAW] += 360;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 222
;222:		}
LABELV $142
line 224
;223:
;224:		viewAngles[YAW] -= 90;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
CNSTF4 1119092736
SUBF4
ASGNF4
line 225
;225:	}
LABELV $128
line 228
;226:	//distribute the angles differently up the spine
;227:	//NOTE: each of these distributions must add up to 1.0f
;228:	thoracicAngles[PITCH] = 0;//viewAngles[PITCH]*0.20f;
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
line 229
;229:	llAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 20
INDIRP4
CNSTF4 0
ASGNF4
line 230
;230:	ulAngles[PITCH] = 0;//viewAngles[PITCH]*0.40f;
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
line 232
;231:
;232:	thoracicAngles[YAW] = viewAngles[YAW]*0.20f - (viewAngles[PITCH]*(viewAngles[YAW]*.020f));
ADDRLP4 68
CNSTI4 4
ASGNI4
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 72
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRLP4 76
INDIRF4
MULF4
ADDRLP4 72
INDIRP4
INDIRF4
CNSTF4 1017370378
ADDRLP4 76
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 233
;233:	ulAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 80
CNSTI4 4
ASGNI4
ADDRLP4 84
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
ADDRLP4 84
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 88
INDIRF4
MULF4
ADDRLP4 84
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 88
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 234
;234:	llAngles[YAW] = viewAngles[YAW]*0.25f - (viewAngles[PITCH]*(viewAngles[YAW]*.0005f));
ADDRLP4 92
CNSTI4 4
ASGNI4
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 96
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ASGNF4
ADDRFP4 20
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
CNSTF4 1048576000
ADDRLP4 100
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
INDIRF4
CNSTF4 973279855
ADDRLP4 100
INDIRF4
MULF4
MULF4
SUBF4
ASGNF4
line 236
;235:
;236:	if (thoracicAngles[YAW] > 20)
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $144
line 237
;237:	{
line 238
;238:		thoracicAngles[YAW] = 20;
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 239
;239:	}
LABELV $144
line 240
;240:	if (ulAngles[YAW] > 20)
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $146
line 241
;241:	{
line 242
;242:		ulAngles[YAW] = 20;
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 243
;243:	}
LABELV $146
line 244
;244:	if (llAngles[YAW] > 20)
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $148
line 245
;245:	{
line 246
;246:		llAngles[YAW] = 20;
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1101004800
ASGNF4
line 247
;247:	}
LABELV $148
line 249
;248:
;249:	thoracicAngles[ROLL] = viewAngles[ROLL]*0.20f;
ADDRLP4 104
CNSTI4 8
ASGNI4
ADDRFP4 12
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
CNSTF4 1045220557
ADDRFP4 4
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 250
;250:	ulAngles[ROLL] = viewAngles[ROLL]*0.35f;
ADDRLP4 108
CNSTI4 8
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
CNSTF4 1051931443
ADDRFP4 4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 251
;251:	llAngles[ROLL] = viewAngles[ROLL]*0.45f;
ADDRLP4 112
CNSTI4 8
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
CNSTF4 1055286886
ADDRFP4 4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRF4
MULF4
ASGNF4
line 253
;252:
;253:	for ( ang = 0; ang < 3; ang++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $150
line 254
;254:	{
line 255
;255:		if (ulAngles[ang] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $154
line 256
;256:		{
line 257
;257:			ulAngles[ang] += 360;
ADDRLP4 116
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 258
;258:		}
LABELV $154
line 259
;259:	}
LABELV $151
line 253
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $150
line 268
;260:
;261:	//thoracic is added modified again by neckAngle calculations, so don't set it until then
;262://	BG_G2SetBoneAngles( cent, cent->gent, cent->gent->upperLumbarBone, ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.model_draw); 
;263://	BG_G2SetBoneAngles( cent, cent->gent, cent->gent->lowerLumbarBone, llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.model_draw); 
;264:
;265://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;266://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;267://	trap_G2API_SetBoneAngles(cent->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, cgs.gameModels, 0, cg.time); 
;268:}
LABELV $127
endproc G_G2ClientSpineAngles 168 36
data
align 4
LABELV $157
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
lit
align 4
LABELV $158
byte 4 0
byte 4 0
byte 4 0
export G_G2PlayerAngles
code
proc G_G2PlayerAngles 232 44
line 270
;269:
;270:void G_G2PlayerAngles( gentity_t *ent, vec3_t legs[3], vec3_t legsAngles){
line 278
;271:	vec3_t		torsoAngles, headAngles;
;272:	float		dest;
;273:	static	int	movementOffsets[8] = { 0, 22, 45, -22, 0, 22, -45, -22 };
;274:	vec3_t		velocity;
;275:	float		speed;
;276:	int			dir;
;277:	vec3_t		velPos, velAng;
;278:	int			adddir = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 280
;279:	float		dif;
;280:	float		degrees_negative = 0;
ADDRLP4 132
CNSTF4 0
ASGNF4
line 281
;281:	float		degrees_positive = 0;
ADDRLP4 136
CNSTF4 0
ASGNF4
line 282
;282:	qboolean	yawing = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 283
;283:	vec3_t		ulAngles, llAngles, viewAngles, angles, thoracicAngles = {0,0,0};
ADDRLP4 72
ADDRGP4 $158
INDIRB
ASGNB 12
line 287
;284:	//float		pitchViewAng;
;285:	//float		yawViewAng;
;286:
;287:	VectorCopy( ent->client->ps.viewangles, headAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 288
;288:	headAngles[YAW] = AngleMod( headAngles[YAW] );
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 152
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 152
INDIRF4
ASGNF4
line 289
;289:	VectorClear( legsAngles );
ADDRLP4 156
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 160
CNSTF4 0
ASGNF4
ADDRLP4 156
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 156
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 156
INDIRP4
ADDRLP4 160
INDIRF4
ASGNF4
line 290
;290:	VectorClear( torsoAngles );
ADDRLP4 164
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 164
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 164
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 164
INDIRF4
ASGNF4
line 295
;291:
;292:	// --------- yaw -------------
;293:
;294:	// allow yaw to drift a bit
;295:	if ((( ent->s.legsAnim & ~ANIM_TOGGLEBIT ) != BOTH_STAND1) || 
ADDRLP4 168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 172
CNSTI4 -2049
ASGNI4
ADDRLP4 168
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
BANDI4
CNSTI4 550
NEI4 $165
ADDRLP4 168
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRLP4 172
INDIRI4
BANDI4
ADDRLP4 168
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 WeaponReadyAnim
ADDP4
INDIRI4
EQI4 $163
LABELV $165
line 297
;296:			( ent->s.torsoAnim & ~ANIM_TOGGLEBIT ) != WeaponReadyAnim[ent->s.weapon]  ) 
;297:	{
line 303
;298:		// if not standing still, always point all in the same direction
;299:		/*cent->pe.torso.yawing = qtrue;	// always center
;300:		cent->pe.torso.pitching = qtrue;	// always center
;301:		cent->pe.legs.yawing = qtrue;	// always center
;302:		*/
;303:		yawing = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 304
;304:	}
LABELV $163
line 307
;305:
;306:	// adjust legs for movement dir
;307:	dir = ent->s.angles2[YAW];
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 308
;308:	if ( dir < 0 || dir > 7 ) {
ADDRLP4 84
INDIRI4
CNSTI4 0
LTI4 $168
ADDRLP4 84
INDIRI4
CNSTI4 7
LEI4 $166
LABELV $168
line 309
;309:		return;
ADDRGP4 $156
JUMPV
LABELV $166
line 312
;310:	}
;311:
;312:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[ dir ];
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
CNSTF4 1048576000
ADDRLP4 84
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $157
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 317
;313:
;314:	// --------- pitch -------------
;315:
;316:	// only show a fraction of the pitch angle in the torso
;317:	if ( headAngles[PITCH] > 180 ) {
ADDRLP4 12
INDIRF4
CNSTF4 1127481344
LEF4 $171
line 318
;318:		dest = (-360 + headAngles[PITCH]) * 0.75;
ADDRLP4 148
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
CNSTF4 3283353600
ADDF4
MULF4
ASGNF4
line 319
;319:	} else {
ADDRGP4 $172
JUMPV
LABELV $171
line 320
;320:		dest = headAngles[PITCH] * 0.75;
ADDRLP4 148
CNSTF4 1061158912
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 321
;321:	}
LABELV $172
line 327
;322:
;323:	//G_SwingAngles call disabled, at least for now. It isn't necessary on the server.
;324://	pitchViewAng = ent->client->ps.viewangles[PITCH];
;325://	G_SwingAngles( dest, 15, 30, 0.1, &pitchViewAng, &yawing );
;326:
;327:	torsoAngles[PITCH] = ent->client->ps.viewangles[PITCH];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ASGNF4
line 333
;328:
;329:	// --------- roll -------------
;330:
;331:
;332:	// lean towards the direction of travel
;333:	VectorCopy( ent->s.pos.trDelta, velocity );
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 334
;334:	speed = VectorNormalize( velocity );
ADDRLP4 24
ARGP4
ADDRLP4 180
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 112
ADDRLP4 180
INDIRF4
ASGNF4
line 358
;335:
;336:	/*
;337:	speed_desired = ent->client->ps.speed/4;
;338:
;339:	if (!speed)
;340:	{
;341:		speed_dif = 0;
;342:	}
;343:	else
;344:	{
;345:		speed_dif = (speed/speed_desired);
;346:	}
;347:
;348:	if (speed_dif > 1)
;349:	{
;350:		speed_dif = 1;
;351:	}
;352:	else if (speed_dif < 0)
;353:	{
;354:		speed_dif = 0;
;355:	}
;356:	*/
;357:
;358:	if ( speed ) {
ADDRLP4 112
INDIRF4
CNSTF4 0
EQF4 $173
line 362
;359:		vec3_t	axis[3];
;360:		float	side;
;361:
;362:		speed *= 0.05;
ADDRLP4 112
CNSTF4 1028443341
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
line 364
;363:
;364:		AnglesToAxis( legsAngles, axis );
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 184
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 365
;365:		side = speed * DotProduct( velocity, axis[1] );
ADDRLP4 220
ADDRLP4 112
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 184+12
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 184+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 184+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 366
;366:		legsAngles[ROLL] -= side;
ADDRLP4 224
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 224
INDIRP4
ADDRLP4 224
INDIRP4
INDIRF4
ADDRLP4 220
INDIRF4
SUBF4
ASGNF4
line 368
;367:
;368:		side = speed * DotProduct( velocity, axis[0] );
ADDRLP4 220
ADDRLP4 112
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 369
;369:		legsAngles[PITCH] += side;
ADDRLP4 228
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 220
INDIRF4
ADDF4
ASGNF4
line 370
;370:	}
LABELV $173
line 373
;371:
;372:	//rww - crazy velocity-based leg angle calculation
;373:	legsAngles[YAW] = headAngles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 374
;374:	velPos[0] = ent->client->ps.origin[0] + velocity[0];
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 375
;375:	velPos[1] = ent->client->ps.origin[1] + velocity[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
line 376
;376:	velPos[2] = ent->client->ps.origin[2] + velocity[2];
ADDRLP4 36+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 378
;377:
;378:	if (ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $191
line 379
;379:	{ //off the ground, no direction-based leg angles
line 380
;380:		VectorCopy(ent->client->ps.origin, velPos);
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 381
;381:	}
LABELV $191
line 383
;382:
;383:	VectorSubtract(ent->client->ps.origin, velPos, velAng);
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+4
ADDRLP4 184
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 36+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 48+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 36+8
INDIRF4
SUBF4
ASGNF4
line 385
;384:
;385:	if (!VectorCompare(velAng, vec3_origin))
ADDRLP4 48
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 188
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
NEI4 $197
line 386
;386:	{
line 387
;387:		vectoangles(velAng, velAng);
ADDRLP4 48
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 389
;388:
;389:		if (velAng[YAW] <= legsAngles[YAW])
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
GTF4 $199
line 390
;390:		{
line 391
;391:			degrees_negative = (legsAngles[YAW] - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48+4
INDIRF4
SUBF4
ASGNF4
line 392
;392:			degrees_positive = (360 - legsAngles[YAW]) + velAng[YAW];
ADDRLP4 136
CNSTF4 1135869952
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 48+4
INDIRF4
ADDF4
ASGNF4
line 393
;393:		}
ADDRGP4 $200
JUMPV
LABELV $199
line 395
;394:		else
;395:		{
line 396
;396:			degrees_negative = legsAngles[YAW] + (360 - velAng[YAW]);
ADDRLP4 132
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1135869952
ADDRLP4 48+4
INDIRF4
SUBF4
ADDF4
ASGNF4
line 397
;397:			degrees_positive = (velAng[YAW] - legsAngles[YAW]);
ADDRLP4 136
ADDRLP4 48+4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 398
;398:		}
LABELV $200
line 400
;399:
;400:		if (degrees_negative < degrees_positive)
ADDRLP4 132
INDIRF4
ADDRLP4 136
INDIRF4
GEF4 $206
line 401
;401:		{
line 402
;402:			dif = degrees_negative;
ADDRLP4 116
ADDRLP4 132
INDIRF4
ASGNF4
line 403
;403:			adddir = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 404
;404:		}
ADDRGP4 $207
JUMPV
LABELV $206
line 406
;405:		else
;406:		{
line 407
;407:			dif = degrees_positive;
ADDRLP4 116
ADDRLP4 136
INDIRF4
ASGNF4
line 408
;408:			adddir = 1;
ADDRLP4 140
CNSTI4 1
ASGNI4
line 409
;409:		}
LABELV $207
line 411
;410:
;411:		if (dif > 90)
ADDRLP4 116
INDIRF4
CNSTF4 1119092736
LEF4 $208
line 412
;412:		{
line 413
;413:			dif = (180 - dif);
ADDRLP4 116
CNSTF4 1127481344
ADDRLP4 116
INDIRF4
SUBF4
ASGNF4
line 414
;414:		}
LABELV $208
line 416
;415:
;416:		if (dif > 60)
ADDRLP4 116
INDIRF4
CNSTF4 1114636288
LEF4 $210
line 417
;417:		{
line 418
;418:			dif = 60;
ADDRLP4 116
CNSTF4 1114636288
ASGNF4
line 419
;419:		}
LABELV $210
line 422
;420:
;421:		//Slight hack for when playing is running backward
;422:		if (dir == 3 || dir == 5)
ADDRLP4 84
INDIRI4
CNSTI4 3
EQI4 $214
ADDRLP4 84
INDIRI4
CNSTI4 5
NEI4 $212
LABELV $214
line 423
;423:		{
line 424
;424:			dif = -dif;
ADDRLP4 116
ADDRLP4 116
INDIRF4
NEGF4
ASGNF4
line 425
;425:		}
LABELV $212
line 427
;426:
;427:		if (adddir)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $215
line 428
;428:		{
line 429
;429:			legsAngles[YAW] -= dif;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 116
INDIRF4
SUBF4
ASGNF4
line 430
;430:		}
ADDRGP4 $216
JUMPV
LABELV $215
line 432
;431:		else
;432:		{
line 433
;433:			legsAngles[YAW] += dif;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
ADDRLP4 116
INDIRF4
ADDF4
ASGNF4
line 434
;434:		}
LABELV $216
line 435
;435:	}
LABELV $197
line 441
;436:
;437:	//G_SwingAngles call disabled, at least for now. It isn't necessary on the server.
;438://	yawViewAng = ent->client->ps.viewangles[YAW];
;439://	G_SwingAngles( legsAngles[YAW], 40, 90, /*cg_swingSpeed.value*/ 0.3, &yawViewAng, &yawing );
;440:
;441:	legsAngles[YAW] = ent->client->ps.viewangles[YAW];
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 443
;442:
;443:	legsAngles[ROLL] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 444
;444:	torsoAngles[ROLL] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 447
;445:
;446:	// pull the angles back out of the hierarchial chain
;447:	AnglesSubtract( headAngles, torsoAngles, headAngles );
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 448
;448:	AnglesSubtract( torsoAngles, legsAngles, torsoAngles );
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 449
;449:	AnglesToAxis( legsAngles, legs );
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 454
;450:	// we assume that model 0 is the player model.
;451:
;452://	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "upper_lumbar", torsoAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
;453:
;454:	VectorCopy( ent->client->ps.viewangles, viewAngles );
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 456
;455:
;456:	if (viewAngles[PITCH] > 290)
ADDRLP4 60
INDIRF4
CNSTF4 1133576192
LEF4 $218
line 457
;457:	{ //keep the same general range as lerpAngles on the client so we can use the same spine correction
line 458
;458:		viewAngles[PITCH] -= 360;
ADDRLP4 60
ADDRLP4 60
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 459
;459:	}
LABELV $218
line 461
;460:
;461:	viewAngles[YAW] = viewAngles[ROLL] = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
ADDRLP4 60+8
ADDRLP4 192
INDIRF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 192
INDIRF4
ASGNF4
line 462
;462:	viewAngles[PITCH] *= 0.5;
ADDRLP4 60
CNSTF4 1056964608
ADDRLP4 60
INDIRF4
MULF4
ASGNF4
line 464
;463:
;464:	VectorCopy( ent->client->ps.viewangles, angles );
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 465
;465:	angles[PITCH] = 0;
ADDRLP4 120
CNSTF4 0
ASGNF4
line 467
;466:
;467:	G_G2ClientSpineAngles(ent, viewAngles, angles, thoracicAngles, ulAngles, llAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 120
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
ARGP4
ADDRGP4 G_G2ClientSpineAngles
CALLV
pop
line 469
;468:
;469:	ulAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 88+4
ADDRLP4 88+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 470
;470:	llAngles[YAW] += torsoAngles[YAW]*0.3;
ADDRLP4 100+4
ADDRLP4 100+4
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 471
;471:	thoracicAngles[YAW] += torsoAngles[YAW]*0.4;
ADDRLP4 72+4
ADDRLP4 72+4
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 473
;472:
;473:	ulAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 88
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 474
;474:	llAngles[PITCH] = torsoAngles[PITCH]*0.3;
ADDRLP4 100
CNSTF4 1050253722
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 475
;475:	thoracicAngles[PITCH] = torsoAngles[PITCH]*0.4;
ADDRLP4 72
CNSTF4 1053609165
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 477
;476:
;477:	ulAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 88+8
ADDRLP4 88+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 478
;478:	llAngles[ROLL] += torsoAngles[ROLL]*0.3;
ADDRLP4 100+8
ADDRLP4 100+8
INDIRF4
CNSTF4 1050253722
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 479
;479:	thoracicAngles[ROLL] += torsoAngles[ROLL]*0.4;
ADDRLP4 72+8
ADDRLP4 72+8
INDIRF4
CNSTF4 1053609165
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 481
;480:
;481:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "upper_lumbar", ulAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
ADDRLP4 196
CNSTI4 0
ASGNI4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 $234
ARGP4
ADDRLP4 88
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 482
;482:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "lower_lumbar", llAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
ADDRLP4 200
CNSTI4 0
ASGNI4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 $236
ARGP4
ADDRLP4 100
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 200
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 483
;483:	trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "thoracic", thoracicAngles, BONE_ANGLES_POSTMULT, POSITIVE_X, NEGATIVE_Y, NEGATIVE_Z, NULL, 0, level.time); 
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 $238
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 2
ARGI4
CNSTI4 1
ARGI4
CNSTI4 6
ARGI4
CNSTI4 5
ARGI4
CNSTP4 0
ARGP4
ADDRLP4 204
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoneAngles
CALLI4
pop
line 486
;484:
;485:	//trap_G2API_SetBoneAngles(ent->client->ghoul2, 0, "cranium", headAngles, BONE_ANGLES_POSTMULT, POSITIVE_Z, NEGATIVE_Y, POSITIVE_X, NULL, 0, level.time); 
;486:}
LABELV $156
endproc G_G2PlayerAngles 232 44
export SaberAttacking
proc SaberAttacking 4 4
line 489
;487:
;488:qboolean SaberAttacking(gentity_t *self)
;489:{
line 496
;490:	/*
;491:	if (self->client->ps.torsoAnim == self->client->ps.saberAttackSequence)
;492:	{
;493:		return qtrue;
;494:	}
;495:	*/
;496:	if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $241
line 497
;497:	{
line 498
;498:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $240
JUMPV
LABELV $241
line 501
;499:	}
;500:
;501:	return qfalse;
CNSTI4 0
RETI4
LABELV $240
endproc SaberAttacking 4 4
export WP_SabersCheckLock2
proc WP_SabersCheckLock2 1688 28
line 524
;502:}
;503:
;504:typedef enum
;505:{
;506:	LOCK_FIRST = 0,
;507:	LOCK_TOP = LOCK_FIRST,
;508:	LOCK_DIAG_TR,
;509:	LOCK_DIAG_TL,
;510:	LOCK_DIAG_BR,
;511:	LOCK_DIAG_BL,
;512:	LOCK_R,
;513:	LOCK_L,
;514:	LOCK_RANDOM
;515:} sabersLockMode_t;
;516:
;517:#define LOCK_IDEAL_DIST_TOP 32.0f
;518:#define LOCK_IDEAL_DIST_CIRCLE 48.0f
;519:
;520:#define SABER_HITDAMAGE 35
;521:void WP_SaberBlockNonRandom( gentity_t *self, vec3_t hitloc, qboolean missileBlock );
;522:
;523:qboolean WP_SabersCheckLock2( gentity_t *attacker, gentity_t *defender, sabersLockMode_t lockMode )
;524:{
line 526
;525://	animation_t *anim;
;526:	int		attAnim, defAnim = 0;
ADDRLP4 1508
CNSTI4 0
ASGNI4
line 527
;527:	float	attStart = 0.5f;
ADDRLP4 1532
CNSTF4 1056964608
ASGNF4
line 528
;528:	float	idealDist = 48.0f;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 532
;529:	vec3_t	attAngles, defAngles, defDir;
;530:	vec3_t	newOrg;
;531:	vec3_t	attDir;
;532:	float	diff = 0;
ADDRLP4 376
CNSTF4 0
ASGNF4
line 537
;533:	trace_t trace;
;534:	pmove_t		pmv;
;535:
;536:	//MATCH ANIMS
;537:	if ( lockMode == LOCK_RANDOM )
ADDRFP4 8
INDIRI4
CNSTI4 7
NEI4 $245
line 538
;538:	{
line 539
;539:		lockMode = (sabersLockMode_t)Q_irand( (int)LOCK_FIRST, (int)(LOCK_RANDOM)-1 );
CNSTI4 0
ARGI4
CNSTI4 6
ARGI4
ADDRLP4 1536
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 8
ADDRLP4 1536
INDIRI4
ASGNI4
line 540
;540:	}
LABELV $245
line 541
;541:	switch ( lockMode )
ADDRLP4 1536
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 1536
INDIRI4
CNSTI4 0
LTI4 $247
ADDRLP4 1536
INDIRI4
CNSTI4 6
GTI4 $247
ADDRLP4 1536
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $257
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $257
address $250
address $251
address $252
address $253
address $254
address $255
address $256
code
line 542
;542:	{
LABELV $250
line 544
;543:	case LOCK_TOP:
;544:		attAnim = BOTH_BF2LOCK;
ADDRLP4 1528
CNSTI4 538
ASGNI4
line 545
;545:		defAnim = BOTH_BF1LOCK;
ADDRLP4 1508
CNSTI4 541
ASGNI4
line 546
;546:		attStart = 0.5f;
ADDRLP4 1532
CNSTF4 1056964608
ASGNF4
line 547
;547:		idealDist = LOCK_IDEAL_DIST_TOP;
ADDRLP4 1524
CNSTF4 1107296256
ASGNF4
line 548
;548:		break;
ADDRGP4 $248
JUMPV
LABELV $251
line 550
;549:	case LOCK_DIAG_TR:
;550:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1528
CNSTI4 549
ASGNI4
line 551
;551:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1508
CNSTI4 548
ASGNI4
line 552
;552:		attStart = 0.5f;
ADDRLP4 1532
CNSTF4 1056964608
ASGNF4
line 553
;553:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 554
;554:		break;
ADDRGP4 $248
JUMPV
LABELV $252
line 556
;555:	case LOCK_DIAG_TL:
;556:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1528
CNSTI4 548
ASGNI4
line 557
;557:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1508
CNSTI4 549
ASGNI4
line 558
;558:		attStart = 0.5f;
ADDRLP4 1532
CNSTF4 1056964608
ASGNF4
line 559
;559:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 560
;560:		break;
ADDRGP4 $248
JUMPV
LABELV $253
line 562
;561:	case LOCK_DIAG_BR:
;562:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1528
CNSTI4 548
ASGNI4
line 563
;563:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1508
CNSTI4 549
ASGNI4
line 564
;564:		attStart = 0.85f;
ADDRLP4 1532
CNSTF4 1062836634
ASGNF4
line 565
;565:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 566
;566:		break;
ADDRGP4 $248
JUMPV
LABELV $254
line 568
;567:	case LOCK_DIAG_BL:
;568:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1528
CNSTI4 549
ASGNI4
line 569
;569:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1508
CNSTI4 548
ASGNI4
line 570
;570:		attStart = 0.85f;
ADDRLP4 1532
CNSTF4 1062836634
ASGNF4
line 571
;571:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 572
;572:		break;
ADDRGP4 $248
JUMPV
LABELV $255
line 574
;573:	case LOCK_R:
;574:		attAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1528
CNSTI4 549
ASGNI4
line 575
;575:		defAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1508
CNSTI4 548
ASGNI4
line 576
;576:		attStart = 0.75f;
ADDRLP4 1532
CNSTF4 1061158912
ASGNF4
line 577
;577:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 578
;578:		break;
ADDRGP4 $248
JUMPV
LABELV $256
line 580
;579:	case LOCK_L:
;580:		attAnim = BOTH_CWCIRCLELOCK;
ADDRLP4 1528
CNSTI4 548
ASGNI4
line 581
;581:		defAnim = BOTH_CCWCIRCLELOCK;
ADDRLP4 1508
CNSTI4 549
ASGNI4
line 582
;582:		attStart = 0.75f;
ADDRLP4 1532
CNSTF4 1061158912
ASGNF4
line 583
;583:		idealDist = LOCK_IDEAL_DIST_CIRCLE;
ADDRLP4 1524
CNSTF4 1111490560
ASGNF4
line 584
;584:		break;
ADDRGP4 $248
JUMPV
LABELV $247
line 586
;585:	default:
;586:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
line 587
;587:		break;
LABELV $248
line 590
;588:	}
;589:
;590:	memset (&pmv, 0, sizeof(pmv));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 591
;591:	pmv.ps = &attacker->client->ps;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 592
;592:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 593
;593:	pmv.cmd = attacker->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1372
ADDP4
INDIRB
ASGNB 28
line 594
;594:	pmv.trace = trap_Trace;
ADDRLP4 0+240
ADDRGP4 trap_Trace
ASGNP4
line 595
;595:	pmv.pointcontents = trap_PointContents;
ADDRLP4 0+244
ADDRGP4 trap_PointContents
ASGNP4
line 596
;596:	pmv.gametype = g_gametype.integer;
ADDRLP4 0+220
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 599
;597:
;598:	//This is a rare exception, you should never really call PM_ utility functions from game or cgame (despite the fact that it's technically possible)
;599:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 600
;600:	PM_SetAnim(SETANIM_BOTH, attAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1544
CNSTI4 3
ASGNI4
ADDRLP4 1544
INDIRI4
ARGI4
ADDRLP4 1528
INDIRI4
ARGI4
ADDRLP4 1544
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 601
;601:	attacker->client->ps.saberLockFrame = bgGlobalAnimations[attAnim].firstFrame+(bgGlobalAnimations[attAnim].numFrames*0.5);
ADDRLP4 1548
CNSTI4 28
ADDRLP4 1528
INDIRI4
MULI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1548
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 1548
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 603
;602:
;603:	pmv.ps = &defender->client->ps;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 604
;604:	pmv.animations = bgGlobalAnimations;
ADDRLP4 0+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 605
;605:	pmv.cmd = defender->client->pers.cmd;
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1372
ADDP4
INDIRB
ASGNB 28
line 607
;606:
;607:	pm = &pmv;
ADDRGP4 pm
ADDRLP4 0
ASGNP4
line 608
;608:	PM_SetAnim(SETANIM_BOTH, defAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 0);
ADDRLP4 1552
CNSTI4 3
ASGNI4
ADDRLP4 1552
INDIRI4
ARGI4
ADDRLP4 1508
INDIRI4
ARGI4
ADDRLP4 1552
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 609
;609:	defender->client->ps.saberLockFrame = bgGlobalAnimations[defAnim].firstFrame+(bgGlobalAnimations[defAnim].numFrames*0.5);
ADDRLP4 1556
CNSTI4 28
ADDRLP4 1508
INDIRI4
MULI4
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 1556
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1056964608
ADDRLP4 1556
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 611
;610:
;611:	attacker->client->ps.saberLockHits = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 612
;612:	defender->client->ps.saberLockHits = 0;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 614
;613:
;614:	attacker->client->ps.saberLockAdvance = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 615
;615:	defender->client->ps.saberLockAdvance = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 617
;616:
;617:	VectorClear( attacker->client->ps.velocity );
ADDRLP4 1560
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1564
CNSTF4 0
ASGNF4
ADDRLP4 1560
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1564
INDIRF4
ASGNF4
ADDRLP4 1560
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1564
INDIRF4
ASGNF4
ADDRLP4 1560
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1564
INDIRF4
ASGNF4
line 618
;618:	VectorClear( defender->client->ps.velocity );
ADDRLP4 1568
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1572
CNSTF4 0
ASGNF4
ADDRLP4 1568
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 1572
INDIRF4
ASGNF4
ADDRLP4 1568
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 1572
INDIRF4
ASGNF4
ADDRLP4 1568
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 1572
INDIRF4
ASGNF4
line 619
;619:	attacker->client->ps.saberLockTime = defender->client->ps.saberLockTime = level.time + 10000;
ADDRLP4 1576
CNSTI4 408
ASGNI4
ADDRLP4 1580
CNSTI4 524
ASGNI4
ADDRLP4 1584
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 1576
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1580
INDIRI4
ADDP4
ADDRLP4 1584
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1576
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1580
INDIRI4
ADDP4
ADDRLP4 1584
INDIRI4
ASGNI4
line 620
;620:	attacker->client->ps.saberLockEnemy = defender->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 621
;621:	defender->client->ps.saberLockEnemy = attacker->s.number;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 622
;622:	attacker->client->ps.weaponTime = defender->client->ps.weaponTime = Q_irand( 1000, 3000 );//delay 1 to 3 seconds before pushing
CNSTI4 1000
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 1588
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1592
CNSTI4 408
ASGNI4
ADDRLP4 1596
CNSTI4 44
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 1592
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1596
INDIRI4
ADDP4
ADDRLP4 1588
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1592
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1596
INDIRI4
ADDP4
ADDRLP4 1588
INDIRI4
ASGNI4
line 624
;623:
;624:	VectorSubtract( defender->r.currentOrigin, attacker->r.currentOrigin, defDir );
ADDRLP4 1600
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1604
CNSTI4 368
ASGNI4
ADDRLP4 1608
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 380
ADDRLP4 1600
INDIRP4
ADDRLP4 1604
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1608
INDIRP4
ADDRLP4 1604
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1612
CNSTI4 372
ASGNI4
ADDRLP4 380+4
ADDRLP4 1600
INDIRP4
ADDRLP4 1612
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1608
INDIRP4
ADDRLP4 1612
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1616
CNSTI4 376
ASGNI4
ADDRLP4 380+8
ADDRFP4 4
INDIRP4
ADDRLP4 1616
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 1616
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 625
;625:	VectorCopy( attacker->client->ps.viewangles, attAngles );
ADDRLP4 1496
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 626
;626:	attAngles[YAW] = vectoyaw( defDir );
ADDRLP4 380
ARGP4
ADDRLP4 1620
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRLP4 1496+4
ADDRLP4 1620
INDIRF4
ASGNF4
line 627
;627:	SetClientViewAngle( attacker, attAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1496
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 628
;628:	defAngles[PITCH] = attAngles[PITCH]*-1;
ADDRLP4 1512
CNSTF4 3212836864
ADDRLP4 1496
INDIRF4
MULF4
ASGNF4
line 629
;629:	defAngles[YAW] = AngleNormalize180( attAngles[YAW] + 180);
ADDRLP4 1496+4
INDIRF4
CNSTF4 1127481344
ADDF4
ARGF4
ADDRLP4 1624
ADDRGP4 AngleNormalize180
CALLF4
ASGNF4
ADDRLP4 1512+4
ADDRLP4 1624
INDIRF4
ASGNF4
line 630
;630:	defAngles[ROLL] = 0;
ADDRLP4 1512+8
CNSTF4 0
ASGNF4
line 631
;631:	SetClientViewAngle( defender, defAngles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1512
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 634
;632:	
;633:	//MATCH POSITIONS
;634:	diff = VectorNormalize( defDir ) - idealDist;//diff will be the total error in dist
ADDRLP4 380
ARGP4
ADDRLP4 1628
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 1628
INDIRF4
ADDRLP4 1524
INDIRF4
SUBF4
ASGNF4
line 636
;635:	//try to move attacker half the diff towards the defender
;636:	VectorMA( attacker->r.currentOrigin, diff*0.5f, defDir, newOrg );
ADDRLP4 1632
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1636
CNSTF4 1056964608
ADDRLP4 376
INDIRF4
MULF4
ASGNF4
ADDRLP4 392
ADDRLP4 1632
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 380
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 392+4
ADDRLP4 1632
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 380+4
INDIRF4
ADDRLP4 1636
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 392+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 380+8
INDIRF4
CNSTF4 1056964608
ADDRLP4 376
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 638
;637:
;638:	trap_Trace( &trace, attacker->r.currentOrigin, attacker->r.mins, attacker->r.maxs, newOrg, attacker->s.number, attacker->clipmask );
ADDRLP4 416
ARGP4
ADDRLP4 1640
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1640
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1640
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1640
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 392
ARGP4
ADDRLP4 1640
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1640
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 639
;639:	if ( !trace.startsolid && !trace.allsolid )
ADDRLP4 1644
CNSTI4 0
ASGNI4
ADDRLP4 416+4
INDIRI4
ADDRLP4 1644
INDIRI4
NEI4 $279
ADDRLP4 416
INDIRI4
ADDRLP4 1644
INDIRI4
NEI4 $279
line 640
;640:	{
line 641
;641:		G_SetOrigin( attacker, trace.endpos );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 416+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 642
;642:		trap_LinkEntity( attacker );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 643
;643:	}
LABELV $279
line 645
;644:	//now get the defender's dist and do it for him too
;645:	VectorSubtract( attacker->r.currentOrigin, defender->r.currentOrigin, attDir );
ADDRLP4 1648
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1652
CNSTI4 368
ASGNI4
ADDRLP4 1656
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 404
ADDRLP4 1648
INDIRP4
ADDRLP4 1652
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1656
INDIRP4
ADDRLP4 1652
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1660
CNSTI4 372
ASGNI4
ADDRLP4 404+4
ADDRLP4 1648
INDIRP4
ADDRLP4 1660
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1656
INDIRP4
ADDRLP4 1660
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1664
CNSTI4 376
ASGNI4
ADDRLP4 404+8
ADDRFP4 0
INDIRP4
ADDRLP4 1664
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1664
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 646
;646:	diff = VectorNormalize( attDir ) - idealDist;//diff will be the total error in dist
ADDRLP4 404
ARGP4
ADDRLP4 1668
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 1668
INDIRF4
ADDRLP4 1524
INDIRF4
SUBF4
ASGNF4
line 648
;647:	//try to move defender all of the remaining diff towards the attacker
;648:	VectorMA( defender->r.currentOrigin, diff, attDir, newOrg );
ADDRLP4 1672
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 392
ADDRLP4 1672
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 404
INDIRF4
ADDRLP4 376
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 392+4
ADDRLP4 1672
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 404+4
INDIRF4
ADDRLP4 376
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 392+8
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 404+8
INDIRF4
ADDRLP4 376
INDIRF4
MULF4
ADDF4
ASGNF4
line 649
;649:	trap_Trace( &trace, defender->r.currentOrigin, defender->r.mins, defender->r.maxs, newOrg, defender->s.number, defender->clipmask );
ADDRLP4 416
ARGP4
ADDRLP4 1680
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1680
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1680
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1680
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 392
ARGP4
ADDRLP4 1680
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1680
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 650
;650:	if ( !trace.startsolid && !trace.allsolid )
ADDRLP4 1684
CNSTI4 0
ASGNI4
ADDRLP4 416+4
INDIRI4
ADDRLP4 1684
INDIRI4
NEI4 $289
ADDRLP4 416
INDIRI4
ADDRLP4 1684
INDIRI4
NEI4 $289
line 651
;651:	{
line 652
;652:		G_SetOrigin( defender, trace.endpos );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 416+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 653
;653:		trap_LinkEntity( defender );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 654
;654:	}
LABELV $289
line 657
;655:
;656:	//DONE!
;657:	return qtrue;
CNSTI4 1
RETI4
LABELV $244
endproc WP_SabersCheckLock2 1688 28
export WP_SabersCheckLock
proc WP_SabersCheckLock 240 16
line 661
;658:}
;659:
;660:qboolean WP_SabersCheckLock( gentity_t *ent1, gentity_t *ent2 )
;661:{
line 663
;662:	float dist;
;663:	qboolean	ent1BlockingPlayer = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 664
;664:	qboolean	ent2BlockingPlayer = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 666
;665:
;666:	if (!g_saberLocking.integer)
ADDRGP4 g_saberLocking+12
INDIRI4
CNSTI4 0
NEI4 $294
line 667
;667:	{
line 668
;668:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 671
;669:	}
;670:
;671:	if (!ent1->client || !ent2->client)
ADDRLP4 12
CNSTI4 408
ASGNI4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $299
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
NEU4 $297
LABELV $299
line 672
;672:	{
line 673
;673:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $297
line 676
;674:	}
;675:
;676:	if (!ent1->client->ps.duelInProgress ||
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 1292
ASGNI4
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $304
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
EQI4 $304
ADDRLP4 48
CNSTI4 1284
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
INDIRI4
NEI4 $304
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
INDIRI4
EQI4 $300
LABELV $304
line 680
;677:		!ent2->client->ps.duelInProgress ||
;678:		ent1->client->ps.duelIndex != ent2->s.number ||
;679:		ent2->client->ps.duelIndex != ent1->s.number)
;680:	{ //only allow saber locking if two players are dueling with each other directly
line 681
;681:		if (g_gametype.integer != GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $305
line 682
;682:		{
line 683
;683:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $305
line 685
;684:		}
;685:	}
LABELV $300
line 687
;686:
;687:	if ( fabs( ent1->r.currentOrigin[2]-ent2->r.currentOrigin[2] ) > 16 )
ADDRLP4 52
CNSTI4 376
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 52
INDIRI4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 56
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 1098907648
LEF4 $308
line 688
;688:	{
line 689
;689:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $308
line 691
;690:	}
;691:	if ( ent1->client->ps.groundEntityNum == ENTITYNUM_NONE ||
ADDRLP4 60
CNSTI4 408
ASGNI4
ADDRLP4 64
CNSTI4 84
ASGNI4
ADDRLP4 68
CNSTI4 1023
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $312
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRP4
ADDRLP4 64
INDIRI4
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
NEI4 $310
LABELV $312
line 693
;692:		ent2->client->ps.groundEntityNum == ENTITYNUM_NONE )
;693:	{
line 694
;694:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $310
line 696
;695:	}
;696:	dist = DistanceSquared(ent1->r.currentOrigin,ent2->r.currentOrigin);
ADDRLP4 72
CNSTI4 368
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ADDRLP4 72
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 76
INDIRF4
ASGNF4
line 697
;697:	if ( dist < 64 || dist > 6400 )//( dist < 128 || dist > 2304 )
ADDRLP4 8
INDIRF4
CNSTF4 1115684864
LTF4 $315
ADDRLP4 8
INDIRF4
CNSTF4 1170735104
LEF4 $313
LABELV $315
line 698
;698:	{//between 8 and 80 from each other//was 16 and 48
line 699
;699:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $313
line 702
;700:	}
;701:
;702:	if (BG_InSpecialJump(ent1->client->ps.legsAnim))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $316
line 703
;703:	{
line 704
;704:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $316
line 706
;705:	}
;706:	if (BG_InSpecialJump(ent2->client->ps.legsAnim))
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $318
line 707
;707:	{
line 708
;708:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $318
line 711
;709:	}
;710:
;711:	if (BG_InRoll(&ent1->client->ps, ent1->client->ps.legsAnim))
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $320
line 712
;712:	{
line 713
;713:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $320
line 715
;714:	}
;715:	if (BG_InRoll(&ent2->client->ps, ent2->client->ps.legsAnim))
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $322
line 716
;716:	{
line 717
;717:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $322
line 720
;718:	}
;719:
;720:	if (ent1->client->ps.forceHandExtend != HANDEXTEND_NONE ||
ADDRLP4 108
CNSTI4 408
ASGNI4
ADDRLP4 112
CNSTI4 1236
ASGNI4
ADDRLP4 116
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
NEI4 $326
ADDRFP4 4
INDIRP4
ADDRLP4 108
INDIRI4
ADDP4
INDIRP4
ADDRLP4 112
INDIRI4
ADDP4
INDIRI4
ADDRLP4 116
INDIRI4
EQI4 $324
LABELV $326
line 722
;721:		ent2->client->ps.forceHandExtend != HANDEXTEND_NONE)
;722:	{
line 723
;723:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $324
line 726
;724:	}
;725:
;726:	if ((ent1->client->ps.pm_flags & PMF_DUCKED) ||
ADDRLP4 120
CNSTI4 408
ASGNI4
ADDRLP4 124
CNSTI4 12
ASGNI4
ADDRLP4 128
CNSTI4 1
ASGNI4
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
BANDI4
ADDRLP4 132
INDIRI4
NEI4 $329
ADDRFP4 4
INDIRP4
ADDRLP4 120
INDIRI4
ADDP4
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRI4
ADDRLP4 128
INDIRI4
BANDI4
ADDRLP4 132
INDIRI4
EQI4 $327
LABELV $329
line 728
;727:		(ent2->client->ps.pm_flags & PMF_DUCKED))
;728:	{
line 729
;729:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $327
line 736
;730:	}
;731://	if ( !InFOV( ent1, ent2, 40, 180 ) || !InFOV( ent2, ent1, 40, 180 ) )
;732://	{
;733://		return qfalse;
;734://	}
;735:
;736:	if (!InFront( ent1->client->ps.origin, ent2->client->ps.origin, ent2->client->ps.viewangles, 0.4f ))
ADDRLP4 136
CNSTI4 408
ASGNI4
ADDRLP4 140
CNSTI4 20
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
ARGP4
ADDRLP4 144
ADDRFP4 4
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 140
INDIRI4
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1053609165
ARGF4
ADDRLP4 148
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $330
line 737
;737:	{
line 738
;738:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $330
line 740
;739:	}
;740:	if (!InFront( ent2->client->ps.origin, ent1->client->ps.origin, ent1->client->ps.viewangles, 0.4f ))
ADDRLP4 152
CNSTI4 408
ASGNI4
ADDRLP4 156
CNSTI4 20
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRFP4 0
INDIRP4
ADDRLP4 152
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1053609165
ARGF4
ADDRLP4 164
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $332
line 741
;741:	{
line 742
;742:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $332
line 746
;743:	}
;744:
;745:	//T to B lock
;746:	if ( ent1->client->ps.torsoAnim == BOTH_A1_T__B_ ||
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 126
EQI4 $339
ADDRLP4 168
INDIRI4
CNSTI4 203
EQI4 $339
ADDRLP4 168
INDIRI4
CNSTI4 280
EQI4 $339
ADDRLP4 168
INDIRI4
CNSTI4 357
EQI4 $339
ADDRLP4 168
INDIRI4
CNSTI4 434
NEI4 $334
LABELV $339
line 751
;747:		ent1->client->ps.torsoAnim == BOTH_A2_T__B_ ||
;748:		ent1->client->ps.torsoAnim == BOTH_A3_T__B_ ||
;749:		ent1->client->ps.torsoAnim == BOTH_A4_T__B_ ||
;750:		ent1->client->ps.torsoAnim == BOTH_A5_T__B_ )
;751:	{//ent1 is attacking top-down
line 756
;752:		/*
;753:		if ( ent2->client->ps.torsoAnim == BOTH_P1_S1_T_ ||
;754:			ent2->client->ps.torsoAnim == BOTH_K1_S1_T_ )
;755:		*/
;756:		{//ent2 is blocking at top
line 757
;757:			return WP_SabersCheckLock2( ent1, ent2, LOCK_TOP );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 172
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $334
line 762
;758:		}
;759:		//return qfalse;
;760:	}
;761:
;762:	if ( ent2->client->ps.torsoAnim == BOTH_A1_T__B_ ||
ADDRLP4 172
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 126
EQI4 $345
ADDRLP4 172
INDIRI4
CNSTI4 203
EQI4 $345
ADDRLP4 172
INDIRI4
CNSTI4 280
EQI4 $345
ADDRLP4 172
INDIRI4
CNSTI4 357
EQI4 $345
ADDRLP4 172
INDIRI4
CNSTI4 434
NEI4 $340
LABELV $345
line 767
;763:		ent2->client->ps.torsoAnim == BOTH_A2_T__B_ ||
;764:		ent2->client->ps.torsoAnim == BOTH_A3_T__B_ ||
;765:		ent2->client->ps.torsoAnim == BOTH_A4_T__B_ ||
;766:		ent2->client->ps.torsoAnim == BOTH_A5_T__B_ )
;767:	{//ent2 is attacking top-down
line 772
;768:		/*
;769:		if ( ent1->client->ps.torsoAnim == BOTH_P1_S1_T_ ||
;770:			ent1->client->ps.torsoAnim == BOTH_K1_S1_T_ )
;771:		*/
;772:		{//ent1 is blocking at top
line 773
;773:			return WP_SabersCheckLock2( ent2, ent1, LOCK_TOP );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 176
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $340
line 778
;774:		}
;775:		//return qfalse;
;776:	}
;777:
;778:	if ( ent1->s.number == 0 &&
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 180
CNSTI4 0
ASGNI4
ADDRLP4 176
INDIRP4
INDIRI4
ADDRLP4 180
INDIRI4
NEI4 $346
ADDRLP4 184
ADDRLP4 176
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 184
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $346
ADDRLP4 184
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 180
INDIRI4
GTI4 $346
line 780
;779:		ent1->client->ps.saberBlocking == BLK_WIDE && ent1->client->ps.weaponTime <= 0 )
;780:	{
line 781
;781:		ent1BlockingPlayer = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 782
;782:	}
LABELV $346
line 783
;783:	if ( ent2->s.number == 0 &&
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 192
CNSTI4 0
ASGNI4
ADDRLP4 188
INDIRP4
INDIRI4
ADDRLP4 192
INDIRI4
NEI4 $348
ADDRLP4 196
ADDRLP4 188
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 2
NEI4 $348
ADDRLP4 196
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 192
INDIRI4
GTI4 $348
line 785
;784:		ent2->client->ps.saberBlocking == BLK_WIDE && ent2->client->ps.weaponTime <= 0 )
;785:	{
line 786
;786:		ent2BlockingPlayer = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 787
;787:	}
LABELV $348
line 790
;788:
;789:	//TR to BL lock
;790:	if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 132
EQI4 $355
ADDRLP4 200
INDIRI4
CNSTI4 209
EQI4 $355
ADDRLP4 200
INDIRI4
CNSTI4 286
EQI4 $355
ADDRLP4 200
INDIRI4
CNSTI4 363
EQI4 $355
ADDRLP4 200
INDIRI4
CNSTI4 440
NEI4 $350
LABELV $355
line 795
;791:		ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;792:		ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;793:		ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;794:		ent1->client->ps.torsoAnim == BOTH_A5_TR_BL )
;795:	{//ent1 is attacking diagonally
line 796
;796:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $356
line 797
;797:		{//player will block this anyway
line 798
;798:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 204
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $356
line 800
;799:		}
;800:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 204
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 132
EQI4 $364
ADDRLP4 204
INDIRI4
CNSTI4 209
EQI4 $364
ADDRLP4 204
INDIRI4
CNSTI4 286
EQI4 $364
ADDRLP4 204
INDIRI4
CNSTI4 363
EQI4 $364
ADDRLP4 204
INDIRI4
CNSTI4 440
EQI4 $364
ADDRLP4 204
INDIRI4
CNSTI4 513
NEI4 $358
LABELV $364
line 806
;801:			ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;802:			ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;803:			ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;804:			ent2->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;805:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TL )
;806:		{//ent2 is attacking in the opposite diagonal
line 807
;807:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 208
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $358
line 809
;808:		}
;809:		if ( ent2->client->ps.torsoAnim == BOTH_A1_BR_TL ||
ADDRLP4 208
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 130
EQI4 $371
ADDRLP4 208
INDIRI4
CNSTI4 207
EQI4 $371
ADDRLP4 208
INDIRI4
CNSTI4 284
EQI4 $371
ADDRLP4 208
INDIRI4
CNSTI4 361
EQI4 $371
ADDRLP4 208
INDIRI4
CNSTI4 438
EQI4 $371
ADDRLP4 208
INDIRI4
CNSTI4 514
NEI4 $365
LABELV $371
line 815
;810:			ent2->client->ps.torsoAnim == BOTH_A2_BR_TL ||
;811:			ent2->client->ps.torsoAnim == BOTH_A3_BR_TL ||
;812:			ent2->client->ps.torsoAnim == BOTH_A4_BR_TL ||
;813:			ent2->client->ps.torsoAnim == BOTH_A5_BR_TL ||
;814:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BL )
;815:		{//ent2 is attacking in the opposite diagonal
line 816
;816:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_BL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 212
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $365
line 818
;817:		}
;818:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $350
line 821
;819:	}
;820:
;821:	if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 204
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 132
EQI4 $377
ADDRLP4 204
INDIRI4
CNSTI4 209
EQI4 $377
ADDRLP4 204
INDIRI4
CNSTI4 286
EQI4 $377
ADDRLP4 204
INDIRI4
CNSTI4 363
EQI4 $377
ADDRLP4 204
INDIRI4
CNSTI4 440
NEI4 $372
LABELV $377
line 826
;822:		ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;823:		ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;824:		ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;825:		ent2->client->ps.torsoAnim == BOTH_A5_TR_BL )
;826:	{//ent2 is attacking diagonally
line 827
;827:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $378
line 828
;828:		{//player will block this anyway
line 829
;829:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 208
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $378
line 831
;830:		}
;831:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 132
EQI4 $386
ADDRLP4 208
INDIRI4
CNSTI4 209
EQI4 $386
ADDRLP4 208
INDIRI4
CNSTI4 286
EQI4 $386
ADDRLP4 208
INDIRI4
CNSTI4 363
EQI4 $386
ADDRLP4 208
INDIRI4
CNSTI4 440
EQI4 $386
ADDRLP4 208
INDIRI4
CNSTI4 513
NEI4 $380
LABELV $386
line 837
;832:			ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;833:			ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;834:			ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;835:			ent1->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;836:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TL )
;837:		{//ent1 is attacking in the opposite diagonal
line 838
;838:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 212
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $380
line 840
;839:		}
;840:		if ( ent1->client->ps.torsoAnim == BOTH_A1_BR_TL ||
ADDRLP4 212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 130
EQI4 $393
ADDRLP4 212
INDIRI4
CNSTI4 207
EQI4 $393
ADDRLP4 212
INDIRI4
CNSTI4 284
EQI4 $393
ADDRLP4 212
INDIRI4
CNSTI4 361
EQI4 $393
ADDRLP4 212
INDIRI4
CNSTI4 438
EQI4 $393
ADDRLP4 212
INDIRI4
CNSTI4 514
NEI4 $387
LABELV $393
line 846
;841:			ent1->client->ps.torsoAnim == BOTH_A2_BR_TL ||
;842:			ent1->client->ps.torsoAnim == BOTH_A3_BR_TL ||
;843:			ent1->client->ps.torsoAnim == BOTH_A4_BR_TL ||
;844:			ent1->client->ps.torsoAnim == BOTH_A5_BR_TL ||
;845:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BL )
;846:		{//ent1 is attacking in the opposite diagonal
line 847
;847:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_BL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 216
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $387
line 849
;848:		}
;849:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $372
line 853
;850:	}
;851:
;852:	//TL to BR lock
;853:	if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 129
EQI4 $399
ADDRLP4 208
INDIRI4
CNSTI4 206
EQI4 $399
ADDRLP4 208
INDIRI4
CNSTI4 283
EQI4 $399
ADDRLP4 208
INDIRI4
CNSTI4 360
EQI4 $399
ADDRLP4 208
INDIRI4
CNSTI4 437
NEI4 $394
LABELV $399
line 858
;854:		ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;855:		ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;856:		ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;857:		ent1->client->ps.torsoAnim == BOTH_A5_TL_BR )
;858:	{//ent1 is attacking diagonally
line 859
;859:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $400
line 860
;860:		{//player will block this anyway
line 861
;861:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 212
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $400
line 863
;862:		}
;863:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 212
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 129
EQI4 $408
ADDRLP4 212
INDIRI4
CNSTI4 206
EQI4 $408
ADDRLP4 212
INDIRI4
CNSTI4 283
EQI4 $408
ADDRLP4 212
INDIRI4
CNSTI4 360
EQI4 $408
ADDRLP4 212
INDIRI4
CNSTI4 437
EQI4 $408
ADDRLP4 212
INDIRI4
CNSTI4 512
NEI4 $402
LABELV $408
line 869
;864:			ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;865:			ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;866:			ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;867:			ent2->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;868:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TR )
;869:		{//ent2 is attacking in the opposite diagonal
line 870
;870:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_TL );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 216
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $402
line 872
;871:		}
;872:		if ( ent2->client->ps.torsoAnim == BOTH_A1_BL_TR ||
ADDRLP4 216
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 131
EQI4 $415
ADDRLP4 216
INDIRI4
CNSTI4 208
EQI4 $415
ADDRLP4 216
INDIRI4
CNSTI4 285
EQI4 $415
ADDRLP4 216
INDIRI4
CNSTI4 362
EQI4 $415
ADDRLP4 216
INDIRI4
CNSTI4 439
EQI4 $415
ADDRLP4 216
INDIRI4
CNSTI4 515
NEI4 $409
LABELV $415
line 878
;873:			ent2->client->ps.torsoAnim == BOTH_A2_BL_TR ||
;874:			ent2->client->ps.torsoAnim == BOTH_A3_BL_TR ||
;875:			ent2->client->ps.torsoAnim == BOTH_A4_BL_TR ||
;876:			ent2->client->ps.torsoAnim == BOTH_A5_BL_TR ||
;877:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BR )
;878:		{//ent2 is attacking in the opposite diagonal
line 879
;879:			return WP_SabersCheckLock2( ent1, ent2, LOCK_DIAG_BR );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $409
line 881
;880:		}
;881:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $394
line 884
;882:	}
;883:
;884:	if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 212
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 129
EQI4 $421
ADDRLP4 212
INDIRI4
CNSTI4 206
EQI4 $421
ADDRLP4 212
INDIRI4
CNSTI4 283
EQI4 $421
ADDRLP4 212
INDIRI4
CNSTI4 360
EQI4 $421
ADDRLP4 212
INDIRI4
CNSTI4 437
NEI4 $416
LABELV $421
line 889
;885:		ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;886:		ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;887:		ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;888:		ent2->client->ps.torsoAnim == BOTH_A5_TL_BR )
;889:	{//ent2 is attacking diagonally
line 890
;890:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $422
line 891
;891:		{//player will block this anyway
line 892
;892:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 216
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $422
line 894
;893:		}
;894:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 129
EQI4 $430
ADDRLP4 216
INDIRI4
CNSTI4 206
EQI4 $430
ADDRLP4 216
INDIRI4
CNSTI4 283
EQI4 $430
ADDRLP4 216
INDIRI4
CNSTI4 360
EQI4 $430
ADDRLP4 216
INDIRI4
CNSTI4 437
EQI4 $430
ADDRLP4 216
INDIRI4
CNSTI4 512
NEI4 $424
LABELV $430
line 900
;895:			ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;896:			ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;897:			ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;898:			ent1->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;899:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TR )
;900:		{//ent1 is attacking in the opposite diagonal
line 901
;901:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_TL );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $424
line 903
;902:		}
;903:		if ( ent1->client->ps.torsoAnim == BOTH_A1_BL_TR ||
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 131
EQI4 $437
ADDRLP4 220
INDIRI4
CNSTI4 208
EQI4 $437
ADDRLP4 220
INDIRI4
CNSTI4 285
EQI4 $437
ADDRLP4 220
INDIRI4
CNSTI4 362
EQI4 $437
ADDRLP4 220
INDIRI4
CNSTI4 439
EQI4 $437
ADDRLP4 220
INDIRI4
CNSTI4 515
NEI4 $431
LABELV $437
line 909
;904:			ent1->client->ps.torsoAnim == BOTH_A2_BL_TR ||
;905:			ent1->client->ps.torsoAnim == BOTH_A3_BL_TR ||
;906:			ent1->client->ps.torsoAnim == BOTH_A4_BL_TR ||
;907:			ent1->client->ps.torsoAnim == BOTH_A5_BL_TR ||
;908:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BR )
;909:		{//ent1 is attacking in the opposite diagonal
line 910
;910:			return WP_SabersCheckLock2( ent2, ent1, LOCK_DIAG_BR );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $431
line 912
;911:		}
;912:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $416
line 915
;913:	}
;914:	//L to R lock
;915:	if ( ent1->client->ps.torsoAnim == BOTH_A1__L__R ||
ADDRLP4 216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 127
EQI4 $443
ADDRLP4 216
INDIRI4
CNSTI4 204
EQI4 $443
ADDRLP4 216
INDIRI4
CNSTI4 281
EQI4 $443
ADDRLP4 216
INDIRI4
CNSTI4 358
EQI4 $443
ADDRLP4 216
INDIRI4
CNSTI4 435
NEI4 $438
LABELV $443
line 920
;916:		ent1->client->ps.torsoAnim == BOTH_A2__L__R ||
;917:		ent1->client->ps.torsoAnim == BOTH_A3__L__R ||
;918:		ent1->client->ps.torsoAnim == BOTH_A4__L__R ||
;919:		ent1->client->ps.torsoAnim == BOTH_A5__L__R )
;920:	{//ent1 is attacking l to r
line 921
;921:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $444
line 922
;922:		{//player will block this anyway
line 923
;923:			return WP_SabersCheckLock2( ent1, ent2, LOCK_L );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 220
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 220
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $444
line 925
;924:		}
;925:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 220
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 129
EQI4 $453
ADDRLP4 220
INDIRI4
CNSTI4 206
EQI4 $453
ADDRLP4 220
INDIRI4
CNSTI4 283
EQI4 $453
ADDRLP4 220
INDIRI4
CNSTI4 360
EQI4 $453
ADDRLP4 220
INDIRI4
CNSTI4 437
EQI4 $453
ADDRLP4 220
INDIRI4
CNSTI4 512
EQI4 $453
ADDRLP4 220
INDIRI4
CNSTI4 514
NEI4 $446
LABELV $453
line 932
;926:			ent2->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;927:			ent2->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;928:			ent2->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;929:			ent2->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;930:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TR ||
;931:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BL )
;932:		{//ent2 is attacking or blocking on the r
line 933
;933:			return WP_SabersCheckLock2( ent1, ent2, LOCK_L );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $446
line 935
;934:		}
;935:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $438
line 937
;936:	}
;937:	if ( ent2->client->ps.torsoAnim == BOTH_A1__L__R ||
ADDRLP4 220
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 220
INDIRI4
CNSTI4 127
EQI4 $459
ADDRLP4 220
INDIRI4
CNSTI4 204
EQI4 $459
ADDRLP4 220
INDIRI4
CNSTI4 281
EQI4 $459
ADDRLP4 220
INDIRI4
CNSTI4 358
EQI4 $459
ADDRLP4 220
INDIRI4
CNSTI4 435
NEI4 $454
LABELV $459
line 942
;938:		ent2->client->ps.torsoAnim == BOTH_A2__L__R ||
;939:		ent2->client->ps.torsoAnim == BOTH_A3__L__R ||
;940:		ent2->client->ps.torsoAnim == BOTH_A4__L__R ||
;941:		ent2->client->ps.torsoAnim == BOTH_A5__L__R )
;942:	{//ent2 is attacking l to r
line 943
;943:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $460
line 944
;944:		{//player will block this anyway
line 945
;945:			return WP_SabersCheckLock2( ent2, ent1, LOCK_L );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 224
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $460
line 947
;946:		}
;947:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TL_BR ||
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 129
EQI4 $469
ADDRLP4 224
INDIRI4
CNSTI4 206
EQI4 $469
ADDRLP4 224
INDIRI4
CNSTI4 283
EQI4 $469
ADDRLP4 224
INDIRI4
CNSTI4 360
EQI4 $469
ADDRLP4 224
INDIRI4
CNSTI4 437
EQI4 $469
ADDRLP4 224
INDIRI4
CNSTI4 512
EQI4 $469
ADDRLP4 224
INDIRI4
CNSTI4 514
NEI4 $462
LABELV $469
line 954
;948:			ent1->client->ps.torsoAnim == BOTH_A2_TL_BR ||
;949:			ent1->client->ps.torsoAnim == BOTH_A3_TL_BR ||
;950:			ent1->client->ps.torsoAnim == BOTH_A4_TL_BR ||
;951:			ent1->client->ps.torsoAnim == BOTH_A5_TL_BR ||
;952:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TR ||
;953:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BL )
;954:		{//ent1 is attacking or blocking on the r
line 955
;955:			return WP_SabersCheckLock2( ent2, ent1, LOCK_L );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $462
line 957
;956:		}
;957:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $454
line 960
;958:	}
;959:	//R to L lock
;960:	if ( ent1->client->ps.torsoAnim == BOTH_A1__R__L ||
ADDRLP4 224
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 128
EQI4 $475
ADDRLP4 224
INDIRI4
CNSTI4 205
EQI4 $475
ADDRLP4 224
INDIRI4
CNSTI4 282
EQI4 $475
ADDRLP4 224
INDIRI4
CNSTI4 359
EQI4 $475
ADDRLP4 224
INDIRI4
CNSTI4 436
NEI4 $470
LABELV $475
line 965
;961:		ent1->client->ps.torsoAnim == BOTH_A2__R__L ||
;962:		ent1->client->ps.torsoAnim == BOTH_A3__R__L ||
;963:		ent1->client->ps.torsoAnim == BOTH_A4__R__L ||
;964:		ent1->client->ps.torsoAnim == BOTH_A5__R__L )
;965:	{//ent1 is attacking r to l
line 966
;966:		if ( ent2BlockingPlayer )
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $476
line 967
;967:		{//player will block this anyway
line 968
;968:			return WP_SabersCheckLock2( ent1, ent2, LOCK_R );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 228
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 228
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $476
line 970
;969:		}
;970:		if ( ent2->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 132
EQI4 $485
ADDRLP4 228
INDIRI4
CNSTI4 209
EQI4 $485
ADDRLP4 228
INDIRI4
CNSTI4 286
EQI4 $485
ADDRLP4 228
INDIRI4
CNSTI4 363
EQI4 $485
ADDRLP4 228
INDIRI4
CNSTI4 440
EQI4 $485
ADDRLP4 228
INDIRI4
CNSTI4 513
EQI4 $485
ADDRLP4 228
INDIRI4
CNSTI4 515
NEI4 $478
LABELV $485
line 977
;971:			ent2->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;972:			ent2->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;973:			ent2->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;974:			ent2->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;975:			ent2->client->ps.torsoAnim == BOTH_P1_S1_TL ||
;976:			ent2->client->ps.torsoAnim == BOTH_P1_S1_BR )
;977:		{//ent2 is attacking or blocking on the l
line 978
;978:			return WP_SabersCheckLock2( ent1, ent2, LOCK_R );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $478
line 980
;979:		}
;980:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $470
line 982
;981:	}
;982:	if ( ent2->client->ps.torsoAnim == BOTH_A1__R__L ||
ADDRLP4 228
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 228
INDIRI4
CNSTI4 128
EQI4 $491
ADDRLP4 228
INDIRI4
CNSTI4 205
EQI4 $491
ADDRLP4 228
INDIRI4
CNSTI4 282
EQI4 $491
ADDRLP4 228
INDIRI4
CNSTI4 359
EQI4 $491
ADDRLP4 228
INDIRI4
CNSTI4 436
NEI4 $486
LABELV $491
line 987
;983:		ent2->client->ps.torsoAnim == BOTH_A2__R__L ||
;984:		ent2->client->ps.torsoAnim == BOTH_A3__R__L ||
;985:		ent2->client->ps.torsoAnim == BOTH_A4__R__L ||
;986:		ent2->client->ps.torsoAnim == BOTH_A5__R__L )
;987:	{//ent2 is attacking r to l
line 988
;988:		if ( ent1BlockingPlayer )
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $492
line 989
;989:		{//player will block this anyway
line 990
;990:			return WP_SabersCheckLock2( ent2, ent1, LOCK_R );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 232
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $492
line 992
;991:		}
;992:		if ( ent1->client->ps.torsoAnim == BOTH_A1_TR_BL ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 132
EQI4 $501
ADDRLP4 232
INDIRI4
CNSTI4 209
EQI4 $501
ADDRLP4 232
INDIRI4
CNSTI4 286
EQI4 $501
ADDRLP4 232
INDIRI4
CNSTI4 363
EQI4 $501
ADDRLP4 232
INDIRI4
CNSTI4 440
EQI4 $501
ADDRLP4 232
INDIRI4
CNSTI4 513
EQI4 $501
ADDRLP4 232
INDIRI4
CNSTI4 515
NEI4 $494
LABELV $501
line 999
;993:			ent1->client->ps.torsoAnim == BOTH_A2_TR_BL ||
;994:			ent1->client->ps.torsoAnim == BOTH_A3_TR_BL ||
;995:			ent1->client->ps.torsoAnim == BOTH_A4_TR_BL ||
;996:			ent1->client->ps.torsoAnim == BOTH_A5_TR_BL ||
;997:			ent1->client->ps.torsoAnim == BOTH_P1_S1_TL ||
;998:			ent1->client->ps.torsoAnim == BOTH_P1_S1_BR )
;999:		{//ent1 is attacking or blocking on the l
line 1000
;1000:			return WP_SabersCheckLock2( ent2, ent1, LOCK_R );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $494
line 1002
;1001:		}
;1002:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $293
JUMPV
LABELV $486
line 1004
;1003:	}
;1004:	if ( !Q_irand( 0, 10 ) )
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 232
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
NEI4 $502
line 1005
;1005:	{
line 1006
;1006:		return WP_SabersCheckLock2( ent1, ent2, LOCK_RANDOM );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 7
ARGI4
ADDRLP4 236
ADDRGP4 WP_SabersCheckLock2
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
RETI4
ADDRGP4 $293
JUMPV
LABELV $502
line 1008
;1007:	}
;1008:	return qfalse;
CNSTI4 0
RETI4
LABELV $293
endproc WP_SabersCheckLock 240 16
export CheckSaberDamage
proc CheckSaberDamage 1240 32
line 1012
;1009:}
;1010:
;1011:qboolean CheckSaberDamage(gentity_t *self, vec3_t saberStart, vec3_t saberEnd, qboolean doInterpolate)
;1012:{
line 1015
;1013:	trace_t tr;
;1014:	vec3_t dir;
;1015:	int dmg = 0;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 1016
;1016:	int attackStr = 0;
ADDRLP4 1100
CNSTI4 0
ASGNI4
line 1017
;1017:	qboolean idleDamage = qfalse;
ADDRLP4 1104
CNSTI4 0
ASGNI4
line 1018
;1018:	qboolean didHit = qfalse;
ADDRLP4 1096
CNSTI4 0
ASGNI4
line 1020
;1019:
;1020:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
EQI4 $505
line 1021
;1021:	{
line 1022
;1022:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $505
line 1025
;1023:	}
;1024:
;1025:	if (doInterpolate)
ADDRFP4 12
INDIRI4
CNSTI4 0
EQI4 $507
line 1026
;1026:	{ //This didn't quite work out like I hoped. But it's better than nothing. Sort of.
line 1028
;1027:		vec3_t oldSaberStart, oldSaberEnd, saberDif, oldSaberDif;
;1028:		int traceTests = 0;
ADDRLP4 1160
CNSTI4 0
ASGNI4
line 1029
;1029:		float trDif = 8;
ADDRLP4 1108
CNSTF4 1090519040
ASGNF4
line 1031
;1030:
;1031:		VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRB
ASGNB 12
line 1032
;1032:		VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1034
;1033:
;1034:		VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1164
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1168
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1136
ADDRLP4 1164
INDIRP4
INDIRF4
ADDRLP4 1168
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1172
CNSTI4 4
ASGNI4
ADDRLP4 1136+4
ADDRLP4 1164
INDIRP4
ADDRLP4 1172
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1168
INDIRP4
ADDRLP4 1172
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1176
CNSTI4 8
ASGNI4
ADDRLP4 1136+8
ADDRFP4 4
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1176
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1035
;1035:		VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1148
ADDRLP4 1112
INDIRF4
ADDRLP4 1124
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1124+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1124+8
INDIRF4
SUBF4
ASGNF4
line 1037
;1036:
;1037:		VectorNormalize(saberDif);
ADDRLP4 1136
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1038
;1038:		VectorNormalize(oldSaberDif);
ADDRLP4 1148
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1040
;1039:
;1040:		saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1041
;1041:		saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1180
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1180
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1180
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1042
;1042:		saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1184
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1184
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1184
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1044
;1043:
;1044:		oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1124
ADDRLP4 1112
INDIRF4
ADDRLP4 1148
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1045
;1045:		oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1124+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1148+4
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1046
;1046:		oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1124+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1148+8
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1050
;1047:
;1048:		//G_TestLine(oldSaberEnd, saberEnd, 0x0000ff, 50);
;1049:
;1050:		trap_Trace(&tr, saberEnd, NULL, NULL, saberStart, self->s.number, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER));
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1188
CNSTP4 0
ASGNP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRLP4 1188
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 262417
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1052
;1051:
;1052:		trDif++;
ADDRLP4 1108
ADDRLP4 1108
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
ADDRGP4 $526
JUMPV
LABELV $525
line 1055
;1053:
;1054:		while (tr.fraction == 1.0 && traceTests < 4 && tr.entityNum >= ENTITYNUM_NONE)
;1055:		{
line 1056
;1056:			VectorCopy(self->client->lastSaberBase, oldSaberStart);
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
INDIRB
ASGNB 12
line 1057
;1057:			VectorCopy(self->client->lastSaberTip, oldSaberEnd);
ADDRLP4 1124
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1720
ADDP4
INDIRB
ASGNB 12
line 1059
;1058:
;1059:			VectorSubtract(saberStart, saberEnd, saberDif);
ADDRLP4 1192
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1196
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1136
ADDRLP4 1192
INDIRP4
INDIRF4
ADDRLP4 1196
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1200
CNSTI4 4
ASGNI4
ADDRLP4 1136+4
ADDRLP4 1192
INDIRP4
ADDRLP4 1200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1196
INDIRP4
ADDRLP4 1200
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1204
CNSTI4 8
ASGNI4
ADDRLP4 1136+8
ADDRFP4 4
INDIRP4
ADDRLP4 1204
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 1204
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1060
;1060:			VectorSubtract(oldSaberStart, oldSaberEnd, oldSaberDif);
ADDRLP4 1148
ADDRLP4 1112
INDIRF4
ADDRLP4 1124
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1124+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1148+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1124+8
INDIRF4
SUBF4
ASGNF4
line 1062
;1061:
;1062:			VectorNormalize(saberDif);
ADDRLP4 1136
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1063
;1063:			VectorNormalize(oldSaberDif);
ADDRLP4 1148
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1065
;1064:
;1065:			saberEnd[0] = saberStart[0] - (saberDif[0]*trDif);
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 1136
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1066
;1066:			saberEnd[1] = saberStart[1] - (saberDif[1]*trDif);
ADDRLP4 1208
CNSTI4 4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1208
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1136+4
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1067
;1067:			saberEnd[2] = saberStart[2] - (saberDif[2]*trDif);
ADDRLP4 1212
CNSTI4 8
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
ADDRFP4 4
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1136+8
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1069
;1068:
;1069:			oldSaberEnd[0] = oldSaberStart[0] - (oldSaberDif[0]*trDif);
ADDRLP4 1124
ADDRLP4 1112
INDIRF4
ADDRLP4 1148
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1070
;1070:			oldSaberEnd[1] = oldSaberStart[1] - (oldSaberDif[1]*trDif);
ADDRLP4 1124+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 1148+4
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1071
;1071:			oldSaberEnd[2] = oldSaberStart[2] - (oldSaberDif[2]*trDif);
ADDRLP4 1124+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 1148+8
INDIRF4
ADDRLP4 1108
INDIRF4
MULF4
SUBF4
ASGNF4
line 1075
;1072:
;1073:			//G_TestLine(oldSaberEnd, saberEnd, 0x0000ff, 50);
;1074:
;1075:			trap_Trace(&tr, saberEnd, NULL, NULL, saberStart, self->s.number, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER));
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1216
CNSTP4 0
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 262417
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1077
;1076:
;1077:			traceTests++;
ADDRLP4 1160
ADDRLP4 1160
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1078
;1078:			trDif += 8;
ADDRLP4 1108
ADDRLP4 1108
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1079
;1079:		}
LABELV $526
line 1054
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $547
ADDRLP4 1160
INDIRI4
CNSTI4 4
GEI4 $547
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
GEI4 $525
LABELV $547
line 1080
;1080:	}
ADDRGP4 $508
JUMPV
LABELV $507
line 1082
;1081:	else
;1082:	{
line 1083
;1083:		trap_Trace(&tr, saberStart, NULL, NULL, saberEnd, self->s.number, (MASK_PLAYERSOLID|CONTENTS_LIGHTSABER));
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1108
CNSTP4 0
ASGNP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 262417
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1084
;1084:	}
LABELV $508
line 1086
;1085:
;1086:	if (SaberAttacking(self) &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1108
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
EQI4 $548
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $548
line 1088
;1087:		self->client->ps.saberAttackWound < level.time)
;1088:	{ //this animation is that of the last attack movement, and so it should do full damage
line 1089
;1089:		dmg = SABER_HITDAMAGE;//*self->client->ps.fd.saberAnimLevel;
ADDRLP4 1080
CNSTI4 35
ASGNI4
line 1091
;1090:
;1091:		if (self->client->ps.fd.saberAnimLevel == 3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 3
NEI4 $551
line 1092
;1092:		{
line 1093
;1093:			dmg = 100;
ADDRLP4 1080
CNSTI4 100
ASGNI4
line 1094
;1094:		}
ADDRGP4 $552
JUMPV
LABELV $551
line 1095
;1095:		else if (self->client->ps.fd.saberAnimLevel == 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $553
line 1096
;1096:		{
line 1097
;1097:			dmg = 60;
ADDRLP4 1080
CNSTI4 60
ASGNI4
line 1098
;1098:		}
LABELV $553
LABELV $552
line 1100
;1099:
;1100:		attackStr = self->client->ps.fd.saberAnimLevel;
ADDRLP4 1100
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ASGNI4
line 1101
;1101:	}
ADDRGP4 $549
JUMPV
LABELV $548
line 1102
;1102:	else if (self->client->ps.saberIdleWound < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $555
line 1103
;1103:	{ //just touching, do minimal damage and only check for it every 200ms (mainly to cut down on network traffic for hit events)
line 1104
;1104:		dmg = 5;
ADDRLP4 1080
CNSTI4 5
ASGNI4
line 1105
;1105:		self->client->ps.saberIdleWound = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1106
;1106:		idleDamage = qtrue;
ADDRLP4 1104
CNSTI4 1
ASGNI4
line 1107
;1107:	}
LABELV $555
LABELV $549
line 1109
;1108:
;1109:	if (!dmg)
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $559
line 1110
;1110:	{
line 1111
;1111:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $559
line 1114
;1112:	}
;1113:
;1114:	if (dmg > 5 && self->client->ps.isJediMaster)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $561
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $561
line 1115
;1115:	{ //give the Jedi Master more saber attack power
line 1116
;1116:		dmg *= 2;
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1117
;1117:	}
LABELV $561
line 1119
;1118:
;1119:	VectorSubtract(saberEnd, saberStart, dir);
ADDRLP4 1112
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1116
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1084
ADDRLP4 1112
INDIRP4
INDIRF4
ADDRLP4 1116
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1120
CNSTI4 4
ASGNI4
ADDRLP4 1084+4
ADDRLP4 1112
INDIRP4
ADDRLP4 1120
INDIRI4
ADDP4
INDIRF4
ADDRLP4 1116
INDIRP4
ADDRLP4 1120
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1124
CNSTI4 8
ASGNI4
ADDRLP4 1084+8
ADDRFP4 8
INDIRP4
ADDRLP4 1124
INDIRI4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
ADDRLP4 1124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1120
;1120:	VectorNormalize(dir);
ADDRLP4 1084
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1126
;1121:
;1122:	//rww - I'm saying || tr.startsolid here, because otherwise your saber tends to skip positions and go through
;1123:	//people, and the compensation traces start in their bbox too. Which results in the saber passing through people
;1124:	//when you visually cut right through them. Which sucks.
;1125:
;1126:	if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $572
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $565
LABELV $572
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $565
ADDRLP4 0+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $565
line 1131
;1127:		/*(!g_entities[tr.entityNum].client || !g_entities[tr.entityNum].client->ps.usingATST) &&*/
;1128:		//g_entities[tr.entityNum].client &&
;1129:		g_entities[tr.entityNum].takedamage &&
;1130:		tr.entityNum != self->s.number)
;1131:	{
line 1133
;1132:		gentity_t *te;
;1133:		qboolean unblockable = qfalse;
ADDRLP4 1132
CNSTI4 0
ASGNI4
line 1135
;1134:
;1135:		if (idleDamage &&
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $573
ADDRLP4 1136
CNSTI4 828
ASGNI4
ADDRLP4 1136
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1136
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1140
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1144
CNSTI4 0
ASGNI4
ADDRLP4 1140
INDIRI4
ADDRLP4 1144
INDIRI4
EQI4 $573
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1144
INDIRI4
NEI4 $573
line 1139
;1136:			g_entities[tr.entityNum].client &&
;1137:			OnSameTeam(self, &g_entities[tr.entityNum]) &&
;1138:			!g_friendlySaber.integer)
;1139:		{
line 1140
;1140:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $573
line 1143
;1141:		}
;1142:
;1143:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1148
CNSTI4 828
ASGNI4
ADDRLP4 1152
CNSTI4 0
ASGNI4
ADDRLP4 1148
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1152
INDIRI4
EQI4 $579
ADDRLP4 1148
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $579
ADDRLP4 1148
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 1152
INDIRI4
EQI4 $579
ADDRLP4 1148
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $579
line 1146
;1144:			g_entities[tr.entityNum].client->ps.duelInProgress &&
;1145:			g_entities[tr.entityNum].client->ps.duelIndex != self->s.number)
;1146:		{
line 1147
;1147:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $579
line 1150
;1148:		}
;1149:
;1150:		if (g_entities[tr.entityNum].inuse && g_entities[tr.entityNum].client &&
ADDRLP4 1156
CNSTI4 828
ASGNI4
ADDRLP4 1160
CNSTI4 0
ASGNI4
ADDRLP4 1156
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 1160
INDIRI4
EQI4 $589
ADDRLP4 1156
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $589
ADDRLP4 1164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 1160
INDIRI4
EQI4 $589
ADDRLP4 1164
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRLP4 1156
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
INDIRI4
EQI4 $589
line 1153
;1151:			self->client->ps.duelInProgress &&
;1152:			self->client->ps.duelIndex != g_entities[tr.entityNum].s.number)
;1153:		{
line 1154
;1154:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $589
line 1157
;1155:		}
;1156:
;1157:		didHit = qtrue;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1159
;1158:
;1159:		if (self->client->ps.saberMove == LS_A_BACK ||
ADDRLP4 1168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 12
EQI4 $600
ADDRLP4 1168
INDIRI4
CNSTI4 13
EQI4 $600
ADDRLP4 1168
INDIRI4
CNSTI4 11
EQI4 $600
ADDRLP4 1168
INDIRI4
CNSTI4 15
NEI4 $596
LABELV $600
line 1163
;1160:			self->client->ps.saberMove == LS_A_BACK_CR ||
;1161:			self->client->ps.saberMove == LS_A_BACKSTAB ||
;1162:			self->client->ps.saberMove == LS_A_JUMP_T__B_)
;1163:		{
line 1164
;1164:			unblockable = qtrue;
ADDRLP4 1132
CNSTI4 1
ASGNI4
line 1165
;1165:			if (self->client->ps.saberMove == LS_A_JUMP_T__B_)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 15
NEI4 $601
line 1166
;1166:			{ //do extra damage for special unblockables
line 1167
;1167:				dmg += 40;
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 40
ADDI4
ASGNI4
line 1168
;1168:			}
ADDRGP4 $602
JUMPV
LABELV $601
line 1170
;1169:			else
;1170:			{
line 1171
;1171:				dmg += 20;
ADDRLP4 1080
ADDRLP4 1080
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 1172
;1172:			}
LABELV $602
line 1173
;1173:		}
LABELV $596
line 1175
;1174:
;1175:		if (g_entities[tr.entityNum].client && !unblockable && WP_SaberCanBlock(&g_entities[tr.entityNum], tr.endpos, 0, MOD_SABER, qfalse, attackStr))
ADDRLP4 1172
CNSTI4 828
ASGNI4
ADDRLP4 1172
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $603
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 1132
INDIRI4
ADDRLP4 1176
INDIRI4
NEI4 $603
ADDRLP4 1172
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1176
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1176
INDIRI4
ARGI4
ADDRLP4 1100
INDIRI4
ARGI4
ADDRLP4 1180
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1180
INDIRI4
CNSTI4 0
EQI4 $603
line 1176
;1176:		{
line 1177
;1177:			te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1184
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1128
ADDRLP4 1184
INDIRP4
ASGNP4
line 1178
;1178:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1128
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1179
;1179:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1128
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1180
;1180:			te->s.eventParm = 1;
ADDRLP4 1128
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1182
;1181:
;1182:			if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $612
line 1183
;1183:			{
line 1184
;1184:				if ((g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] - self->client->ps.fd.forcePowerLevel[FP_SABERATTACK]) > 1 &&
ADDRLP4 1188
CNSTI4 992
ASGNI4
ADDRLP4 1192
CNSTI4 1
ASGNI4
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1188
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 1188
INDIRI4
ADDP4
INDIRI4
SUBI4
ADDRLP4 1192
INDIRI4
LEI4 $614
ADDRLP4 1192
INDIRI4
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1196
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1196
INDIRI4
CNSTI4 9
GEI4 $614
line 1186
;1185:					Q_irand(1, 10) < 9) //used to be < 7
;1186:				{ //Just got blocked by someone with a decently higher attack level, so enter into a lock (where they have the advantage due to a higher attack lev)
line 1187
;1187:					if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1200
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 0
EQI4 $615
line 1188
;1188:					{	
line 1189
;1189:						self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1190
;1190:						g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1191
;1191:						return didHit;
ADDRLP4 1096
INDIRI4
RETI4
ADDRGP4 $504
JUMPV
line 1193
;1192:					}
;1193:				}
LABELV $614
line 1194
;1194:				else if (Q_irand(1, 10) < 3)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1200
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1200
INDIRI4
CNSTI4 3
GEI4 $623
line 1195
;1195:				{ //Just got blocked by someone with a decently higher attack level, so enter into a lock (where they have the advantage due to a higher attack lev)
line 1196
;1196:					if (WP_SabersCheckLock(self, &g_entities[tr.entityNum]))
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1204
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1204
INDIRI4
CNSTI4 0
EQI4 $625
line 1197
;1197:					{	
line 1198
;1198:						self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1199
;1199:						g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_NONE;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1200
;1200:						return didHit;
ADDRLP4 1096
INDIRI4
RETI4
ADDRGP4 $504
JUMPV
LABELV $625
line 1202
;1201:					}
;1202:				}
LABELV $623
LABELV $615
line 1203
;1203:			}
LABELV $612
line 1206
;1204:
;1205:			//our attack was blocked, so bounce back?
;1206:			if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $630
line 1207
;1207:			{
line 1208
;1208:				self->client->ps.weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1209:				self->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1210
;1210:				self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 1212
;1211:
;1212:				self->client->ps.saberBlockTime = level.time + (350 - (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1188
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1213
;1213:			}
LABELV $630
line 1214
;1214:			self->client->ps.saberAttackWound = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1216
;1215:
;1216:			if (self->client->ps.fd.saberAnimLevel >= FORCE_LEVEL_3 && dmg > 5 && g_entities[tr.entityNum].client->ps.saberMove != LS_READY && g_entities[tr.entityNum].client->ps.saberMove != LS_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 3
LTI4 $566
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $566
ADDRLP4 1188
CNSTI4 828
ASGNI4
ADDRLP4 1192
CNSTI4 512
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $566
ADDRLP4 1188
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ADDRLP4 1192
INDIRI4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $566
line 1217
;1217:			{
line 1218
;1218:				g_entities[tr.entityNum].client->ps.weaponTime = 0;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1219
;1219:				g_entities[tr.entityNum].client->ps.weaponstate = WEAPON_READY;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1220
;1220:				g_entities[tr.entityNum].client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 1222
;1221:
;1222:				g_entities[tr.entityNum].client->ps.saberBlockTime = level.time + (350 - (g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1196
CNSTI4 828
ASGNI4
ADDRLP4 1196
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1196
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1223
;1223:			}
line 1245
;1224:
;1225:			//NOTE: Actual blocking is handled in WP_SaberCanBlock
;1226:			/*
;1227:			if (dmg > 5)
;1228:			{ //play block anim on other person
;1229:				gentity_t *otherhit = &g_entities[tr.entityNum];
;1230:
;1231:				if (otherhit && otherhit->client)
;1232:				{
;1233:				//	WP_SaberBlockNonRandom(otherhit, tr.endpos, qfalse);
;1234:
;1235:					otherhit->client->ps.weaponTime = 0;
;1236:					otherhit->client->ps.weaponstate = WEAPON_READY;
;1237:					otherhit->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
;1238:
;1239:					self->client->ps.saberBlockTime = level.time + 300;
;1240:
;1241:					otherhit->client->ps.saberAttackWound = level.time + 300;
;1242:				}
;1243:			}
;1244:			*/
;1245:		}
ADDRGP4 $566
JUMPV
LABELV $603
line 1247
;1246:		else
;1247:		{
line 1248
;1248:			if (g_entities[tr.entityNum].client && g_entities[tr.entityNum].client->ps.usingATST)
ADDRLP4 1184
CNSTI4 828
ASGNI4
ADDRLP4 1184
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $651
ADDRLP4 1184
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $651
line 1249
;1249:			{
line 1250
;1250:				dmg *= 0.1;
ADDRLP4 1080
CNSTF4 1036831949
ADDRLP4 1080
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1251
;1251:			}
LABELV $651
line 1253
;1252:
;1253:			if (g_entities[tr.entityNum].client && !g_entities[tr.entityNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK])
ADDRLP4 1188
CNSTI4 828
ASGNI4
ADDRLP4 1188
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $657
ADDRLP4 1188
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
CNSTI4 0
NEI4 $657
line 1254
;1254:			{ //not a "jedi", so make them suffer more
line 1255
;1255:				if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $663
line 1256
;1256:				{ //don't bother increasing just for idle touch damage
line 1257
;1257:					dmg *= 1.5;
ADDRLP4 1080
CNSTF4 1069547520
ADDRLP4 1080
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1258
;1258:				}
LABELV $663
line 1259
;1259:			}
LABELV $657
line 1261
;1260:
;1261:			G_Damage(&g_entities[tr.entityNum], self, self, dir, tr.endpos, dmg, 0, MOD_SABER);
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1080
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1263
;1262:
;1263:			te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 0+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1196
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1128
ADDRLP4 1196
INDIRP4
ASGNP4
line 1264
;1264:			VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1128
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1265
;1265:			VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1128
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1267
;1266:			
;1267:			if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1200
ADDRLP4 1128
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 0
ASGNF4
ADDRLP4 1200
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $670
ADDRLP4 1200
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $670
ADDRLP4 1200
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $670
line 1268
;1268:			{ //don't let it play with no direction
line 1269
;1269:				te->s.angles[1] = 1;
ADDRLP4 1128
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 1270
;1270:			}
LABELV $670
line 1272
;1271:
;1272:			if (g_entities[tr.entityNum].client)
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $672
line 1273
;1273:			{
line 1274
;1274:				te->s.eventParm = 1;
ADDRLP4 1128
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1275
;1275:			}
ADDRGP4 $673
JUMPV
LABELV $672
line 1277
;1276:			else
;1277:			{
line 1278
;1278:				te->s.eventParm = 0;
ADDRLP4 1128
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 1279
;1279:			}
LABELV $673
line 1281
;1280:
;1281:			self->client->ps.saberAttackWound = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1282
;1282:		}
line 1283
;1283:	}
ADDRGP4 $566
JUMPV
LABELV $565
line 1284
;1284:	else if ((tr.fraction != 1 || tr.startsolid) &&
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $687
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $677
LABELV $687
ADDRLP4 1128
CNSTI4 828
ASGNI4
ADDRLP4 1128
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
CNSTI4 0
EQI4 $677
ADDRLP4 1128
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+44
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $677
line 1287
;1285:		(g_entities[tr.entityNum].r.contents & CONTENTS_LIGHTSABER) &&
;1286:		g_entities[tr.entityNum].r.contents != -1)
;1287:	{ //saber clash
line 1289
;1288:		gentity_t *te;
;1289:		gentity_t *otherOwner = &g_entities[g_entities[tr.entityNum].r.ownerNum];
ADDRLP4 1140
CNSTI4 828
ASGNI4
ADDRLP4 1132
ADDRLP4 1140
INDIRI4
ADDRLP4 1140
INDIRI4
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities+296+100
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1291
;1290:
;1291:		if (otherOwner &&
ADDRLP4 1148
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $691
ADDRLP4 1132
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $691
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1148
INDIRU4
EQU4 $691
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1152
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1156
CNSTI4 0
ASGNI4
ADDRLP4 1152
INDIRI4
ADDRLP4 1156
INDIRI4
EQI4 $691
ADDRGP4 g_friendlySaber+12
INDIRI4
ADDRLP4 1156
INDIRI4
NEI4 $691
line 1296
;1292:			otherOwner->inuse &&
;1293:			otherOwner->client &&
;1294:			OnSameTeam(self, otherOwner) &&
;1295:			!g_friendlySaber.integer)
;1296:		{
line 1297
;1297:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $691
line 1300
;1298:		}
;1299:
;1300:		if (otherOwner && otherOwner->client &&
ADDRLP4 1164
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $694
ADDRLP4 1168
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1168
INDIRP4
CVPU4 4
ADDRLP4 1164
INDIRU4
EQU4 $694
ADDRLP4 1168
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $694
ADDRLP4 1168
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $694
line 1303
;1301:			otherOwner->client->ps.duelInProgress &&
;1302:			otherOwner->client->ps.duelIndex != self->s.number)
;1303:		{
line 1304
;1304:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $694
line 1307
;1305:		}
;1306:
;1307:		if (otherOwner && otherOwner->client &&
ADDRLP4 1176
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $696
ADDRLP4 1180
CNSTI4 408
ASGNI4
ADDRLP4 1132
INDIRP4
ADDRLP4 1180
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1176
INDIRU4
EQU4 $696
ADDRLP4 1184
ADDRFP4 0
INDIRP4
ADDRLP4 1180
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1184
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $696
ADDRLP4 1184
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRLP4 1132
INDIRP4
INDIRI4
EQI4 $696
line 1310
;1308:			self->client->ps.duelInProgress &&
;1309:			self->client->ps.duelIndex != otherOwner->s.number)
;1310:		{
line 1311
;1311:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $696
line 1314
;1312:		}
;1313:
;1314:		didHit = qtrue;
ADDRLP4 1096
CNSTI4 1
ASGNI4
line 1316
;1315:
;1316:		te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 0+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1188
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 1136
ADDRLP4 1188
INDIRP4
ASGNP4
line 1318
;1317:
;1318:		VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 1136
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1319
;1319:		VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 1136
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 1320
;1320:		te->s.eventParm = 1;
ADDRLP4 1136
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1324
;1321:
;1322:		//WP_SaberBlockNonRandom(self, tr.endpos, qfalse);
;1323:
;1324:		if (otherOwner && otherOwner->client && otherOwner->client->ps.saberInFlight)
ADDRLP4 1196
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1196
INDIRU4
EQU4 $701
ADDRLP4 1200
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1200
INDIRP4
CVPU4 4
ADDRLP4 1196
INDIRU4
EQU4 $701
ADDRLP4 1200
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $701
line 1325
;1325:		{
line 1326
;1326:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $504
JUMPV
LABELV $701
line 1329
;1327:		}
;1328:
;1329:		if (self->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 3
GEI4 $703
line 1330
;1330:		{
line 1331
;1331:			self->client->ps.weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1332
;1332:			self->client->ps.weaponstate = WEAPON_READY;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1333
;1333:			self->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 1334
;1334:			self->client->ps.saberBlockTime = level.time + (350 - (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1204
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1336
;1335:
;1336:			if (otherOwner && otherOwner->client)
ADDRLP4 1212
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1212
INDIRU4
EQU4 $704
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1212
INDIRU4
EQU4 $704
line 1337
;1337:			{
line 1338
;1338:				if (otherOwner->client->ps.weaponTime < 1 || otherOwner->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3)
ADDRLP4 1216
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
LTI4 $710
ADDRLP4 1216
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 3
GEI4 $704
LABELV $710
line 1339
;1339:				{
line 1340
;1340:					WP_SaberCanBlock(otherOwner, tr.endpos, 0, MOD_SABER, qfalse, 1);
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1220
CNSTI4 0
ASGNI4
ADDRLP4 1220
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 WP_SaberCanBlock
CALLI4
pop
line 1341
;1341:				}
line 1342
;1342:			}
line 1343
;1343:		}
ADDRGP4 $704
JUMPV
LABELV $703
line 1344
;1344:		else if (otherOwner && otherOwner->client && otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] <= self->client->ps.fd.saberAnimLevel)
ADDRLP4 1208
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1208
INDIRU4
EQU4 $712
ADDRLP4 1212
CNSTI4 408
ASGNI4
ADDRLP4 1216
ADDRLP4 1132
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CVPU4 4
ADDRLP4 1208
INDIRU4
EQU4 $712
ADDRLP4 1216
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 1212
INDIRI4
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
GTI4 $712
line 1345
;1345:		{ //block
line 1346
;1346:			if (otherOwner->client->ps.weaponTime < 1 || otherOwner->client->ps.fd.saberAnimLevel < FORCE_LEVEL_3)
ADDRLP4 1220
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
LTI4 $716
ADDRLP4 1220
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
CNSTI4 3
GEI4 $714
LABELV $716
line 1347
;1347:			{
line 1348
;1348:				if (WP_SaberCanBlock(otherOwner, tr.endpos, 0, MOD_SABER, qfalse, 1) && dmg > 5)
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 1224
CNSTI4 0
ASGNI4
ADDRLP4 1224
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1224
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1228
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
EQI4 $717
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $717
line 1349
;1349:				{
line 1350
;1350:					otherOwner->client->ps.weaponTime = 0;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1351
;1351:					otherOwner->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1352
;1352:					otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 1353
;1353:					otherOwner->client->ps.saberBlockTime = level.time + (350 - (otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1232
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1232
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1354
;1354:				}
LABELV $717
line 1355
;1355:			}
LABELV $714
line 1356
;1356:		}
LABELV $712
LABELV $704
line 1358
;1357:
;1358:		self->client->ps.saberAttackWound = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1360
;1359:
;1360:		if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $722
line 1361
;1361:		{
line 1362
;1362:			if (Q_irand(1, 10) < 9) //used to be < 7
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 1220
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 1220
INDIRI4
CNSTI4 9
GEI4 $724
line 1363
;1363:			{
line 1364
;1364:				if (WP_SabersCheckLock(self, otherOwner))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1132
INDIRP4
ARGP4
ADDRLP4 1224
ADDRGP4 WP_SabersCheckLock
CALLI4
ASGNI4
ADDRLP4 1224
INDIRI4
CNSTI4 0
EQI4 $726
line 1365
;1365:				{
line 1366
;1366:					self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1367
;1367:					otherOwner->client->ps.saberBlocked = BLOCKED_NONE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1368
;1368:					return didHit;
ADDRLP4 1096
INDIRI4
RETI4
ADDRGP4 $504
JUMPV
LABELV $726
line 1370
;1369:				}
;1370:			}
LABELV $724
line 1371
;1371:		}
LABELV $722
line 1373
;1372:
;1373:		if (dmg > 5)
ADDRLP4 1080
INDIRI4
CNSTI4 5
LEI4 $728
line 1374
;1374:		{ //we clashed into this person's saber while attacking, so make them feel it too
line 1375
;1375:			if (otherOwner && otherOwner->client && otherOwner->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] <= self->client->ps.fd.saberAnimLevel)
ADDRLP4 1224
CNSTU4 0
ASGNU4
ADDRLP4 1132
INDIRP4
CVPU4 4
ADDRLP4 1224
INDIRU4
EQU4 $730
ADDRLP4 1228
CNSTI4 408
ASGNI4
ADDRLP4 1232
ADDRLP4 1132
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1232
INDIRP4
CVPU4 4
ADDRLP4 1224
INDIRU4
EQU4 $730
ADDRLP4 1232
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 1228
INDIRI4
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
GTI4 $730
line 1376
;1376:			{
line 1379
;1377:			//	WP_SaberBlockNonRandom(otherOwner, tr.endpos, qfalse);
;1378:
;1379:				otherOwner->client->ps.weaponTime = 0;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1380
;1380:				otherOwner->client->ps.weaponstate = WEAPON_READY;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1381
;1381:				otherOwner->client->ps.saberBlocked = BLOCKED_ATK_BOUNCE;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 1383
;1382:
;1383:				self->client->ps.saberBlockTime = level.time + (350 - (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND]*100));//300;
ADDRLP4 1236
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1236
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 350
CNSTI4 100
ADDRLP4 1236
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
MULI4
SUBI4
ADDI4
ASGNI4
line 1385
;1384:
;1385:				otherOwner->client->ps.saberAttackWound = level.time + 300;
ADDRLP4 1132
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1386
;1386:			}
LABELV $730
line 1387
;1387:		}
LABELV $728
line 1388
;1388:	}
LABELV $677
LABELV $566
line 1390
;1389:
;1390:	return didHit;
ADDRLP4 1096
INDIRI4
RETI4
LABELV $504
endproc CheckSaberDamage 1240 32
export CheckThrownSaberDamaged
proc CheckThrownSaberDamaged 1240 32
line 1403
;1391:}
;1392:
;1393:#define MIN_SABER_SLICE_DISTANCE 50
;1394:
;1395:#define MIN_SABER_SLICE_RETURN_DISTANCE 30
;1396:
;1397:#define SABER_THROWN_HIT_DAMAGE 30
;1398:#define SABER_THROWN_RETURN_HIT_DAMAGE 5
;1399:
;1400:void thrownSaberTouch (gentity_t *saberent, gentity_t *other, trace_t *trace);
;1401:
;1402:qboolean CheckThrownSaberDamaged(gentity_t *saberent, gentity_t *saberOwner, gentity_t *ent, int dist, int returning)
;1403:{
line 1408
;1404:	vec3_t vecsub;
;1405:	float veclen;
;1406:	gentity_t *te;
;1407:
;1408:	if (saberOwner && saberOwner->client && saberOwner->client->ps.saberAttackWound > level.time)
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $735
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $735
ADDRLP4 28
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $735
line 1409
;1409:	{
line 1410
;1410:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $734
JUMPV
LABELV $735
line 1413
;1411:	}
;1412:
;1413:	if (ent && ent->client && ent->inuse && ent->s.number != saberOwner->s.number &&
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 36
CNSTU4 0
ASGNU4
ADDRLP4 32
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $738
ADDRLP4 40
ADDRLP4 32
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
ADDRLP4 36
INDIRU4
EQU4 $738
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $738
ADDRLP4 32
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $738
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $738
ADDRLP4 32
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $738
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $738
ADDRLP4 56
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
EQI4 $738
ADDRLP4 56
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $738
line 1418
;1414:		ent->health > 0 && ent->takedamage &&
;1415:		trap_InPVS(ent->client->ps.origin, saberent->r.currentOrigin) &&
;1416:		ent->client->sess.sessionTeam != TEAM_SPECTATOR &&
;1417:		ent->client->pers.connected)
;1418:	{
line 1419
;1419:		if (ent->inuse && ent->client &&
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $740
ADDRLP4 68
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $740
ADDRLP4 68
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $740
ADDRLP4 68
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $740
line 1422
;1420:			ent->client->ps.duelInProgress &&
;1421:			ent->client->ps.duelIndex != saberOwner->s.number)
;1422:		{
line 1423
;1423:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $734
JUMPV
LABELV $740
line 1426
;1424:		}
;1425:
;1426:		if (ent->inuse && ent->client &&
ADDRLP4 72
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $742
ADDRLP4 80
CNSTI4 408
ASGNI4
ADDRLP4 72
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $742
ADDRLP4 84
ADDRFP4 4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $742
ADDRLP4 84
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRLP4 72
INDIRP4
INDIRI4
EQI4 $742
line 1429
;1427:			saberOwner->client->ps.duelInProgress &&
;1428:			saberOwner->client->ps.duelIndex != ent->s.number)
;1429:		{
line 1430
;1430:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $734
JUMPV
LABELV $742
line 1433
;1431:		}
;1432:
;1433:		VectorSubtract(saberent->r.currentOrigin, ent->client->ps.origin, vecsub);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 88
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1434
;1434:		veclen = VectorLength(vecsub);
ADDRLP4 0
ARGP4
ADDRLP4 96
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 96
INDIRF4
ASGNF4
line 1436
;1435:
;1436:		if (veclen < dist)
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRI4
CVIF4 4
GEF4 $739
line 1437
;1437:		{
line 1440
;1438:			trace_t tr;
;1439:
;1440:			trap_Trace(&tr, saberent->r.currentOrigin, NULL, NULL, ent->client->ps.origin, saberent->s.number, MASK_SHOT);
ADDRLP4 100
ARGP4
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 1184
CNSTP4 0
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1180
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1454
;1441:
;1442:			/*
;1443:			if (tr.startsolid || tr.allsolid)
;1444:			{
;1445:				if (!returning)
;1446:				{ //return to owner if startsolid
;1447:					thrownSaberTouch(saberent, saberent, NULL);
;1448:				}
;1449:
;1450:				return qfalse;
;1451:			}
;1452:			*/
;1453:
;1454:			if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 100+8
INDIRF4
CNSTF4 1065353216
EQF4 $752
ADDRLP4 100+52
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $739
LABELV $752
line 1455
;1455:			{ //Slice them
line 1456
;1456:				if (!saberOwner->client->ps.isJediMaster && WP_SaberCanBlock(ent, tr.endpos, 0, MOD_SABER, qfalse, 8))
ADDRLP4 1188
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
ADDRLP4 1188
INDIRI4
NEI4 $753
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100+12
ARGP4
ADDRLP4 1188
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 1188
INDIRI4
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 1192
ADDRGP4 WP_SaberCanBlock
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
EQI4 $753
line 1457
;1457:				{
line 1458
;1458:					te = G_TempEntity( tr.endpos, EV_SABER_BLOCK );
ADDRLP4 100+12
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 1196
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1196
INDIRP4
ASGNP4
line 1459
;1459:					VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 100+12
INDIRB
ASGNB 12
line 1460
;1460:					VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 100+24
INDIRB
ASGNB 12
line 1461
;1461:					if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1200
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 1204
CNSTF4 0
ASGNF4
ADDRLP4 1200
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $759
ADDRLP4 1200
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $759
ADDRLP4 1200
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1204
INDIRF4
NEF4 $759
line 1462
;1462:					{
line 1463
;1463:						te->s.angles[1] = 1;
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 1464
;1464:					}
LABELV $759
line 1465
;1465:					te->s.eventParm = 1;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1467
;1466:
;1467:					if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $761
line 1468
;1468:					{ //return to owner if blocked
line 1469
;1469:						thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1208
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1470
;1470:					}
LABELV $761
line 1472
;1471:
;1472:					saberOwner->client->ps.saberAttackWound = level.time + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1473
;1473:					return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $734
JUMPV
LABELV $753
line 1476
;1474:				}
;1475:				else
;1476:				{
line 1479
;1477:					vec3_t dir;
;1478:
;1479:					VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
ADDRLP4 100+12
INDIRF4
ADDRLP4 1208
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1196+4
ADDRLP4 100+12+4
INDIRF4
ADDRLP4 1208
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1196+8
ADDRLP4 100+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1480
;1480:					VectorNormalize(dir);
ADDRLP4 1196
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1482
;1481:
;1482:					if (!dir[0] && !dir[1] && !dir[2])
ADDRLP4 1212
CNSTF4 0
ASGNF4
ADDRLP4 1196
INDIRF4
ADDRLP4 1212
INDIRF4
NEF4 $771
ADDRLP4 1196+4
INDIRF4
ADDRLP4 1212
INDIRF4
NEF4 $771
ADDRLP4 1196+8
INDIRF4
ADDRLP4 1212
INDIRF4
NEF4 $771
line 1483
;1483:					{
line 1484
;1484:						dir[1] = 1;
ADDRLP4 1196+4
CNSTF4 1065353216
ASGNF4
line 1485
;1485:					}
LABELV $771
line 1487
;1486:
;1487:					if (saberOwner->client->ps.isJediMaster)
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
EQI4 $776
line 1488
;1488:					{ //2x damage for the Jedi Master
line 1489
;1489:						G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, saberent->damage*2, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1216
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 100+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1490
;1490:					}
ADDRGP4 $777
JUMPV
LABELV $776
line 1492
;1491:					else
;1492:					{
line 1493
;1493:						G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, saberent->damage, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1216
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1196
ARGP4
ADDRLP4 100+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1494
;1494:					}
LABELV $777
line 1496
;1495:
;1496:					te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 100+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1216
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1216
INDIRP4
ASGNP4
line 1497
;1497:					VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 100+12
INDIRB
ASGNB 12
line 1498
;1498:					VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 100+24
INDIRB
ASGNB 12
line 1499
;1499:					if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1220
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 1224
CNSTF4 0
ASGNF4
ADDRLP4 1220
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
NEF4 $783
ADDRLP4 1220
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
NEF4 $783
ADDRLP4 1220
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1224
INDIRF4
NEF4 $783
line 1500
;1500:					{
line 1501
;1501:						te->s.angles[1] = 1;
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 1502
;1502:					}
LABELV $783
line 1504
;1503:
;1504:					te->s.eventParm = 1;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1506
;1505:
;1506:					if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $785
line 1507
;1507:					{ //return to owner if blocked
line 1508
;1508:						thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1228
INDIRP4
ARGP4
ADDRLP4 1228
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1509
;1509:					}
LABELV $785
line 1510
;1510:				}
line 1512
;1511:
;1512:				saberOwner->client->ps.saberAttackWound = level.time + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1513
;1513:			}
line 1514
;1514:		}
line 1515
;1515:	}
ADDRGP4 $739
JUMPV
LABELV $738
line 1516
;1516:	else if (ent && !ent->client && ent->inuse && ent->takedamage && ent->health > 0 && ent->s.number != saberOwner->s.number &&
ADDRLP4 60
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 64
CNSTU4 0
ASGNU4
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
EQU4 $788
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 64
INDIRU4
NEU4 $788
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $788
ADDRLP4 60
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $788
ADDRLP4 60
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
LEI4 $788
ADDRLP4 72
ADDRLP4 60
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $788
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRP4
INDIRI4
EQI4 $788
ADDRLP4 80
CNSTI4 368
ASGNI4
ADDRLP4 60
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $788
line 1518
;1517:		ent->s.number != saberent->s.number && trap_InPVS(ent->r.currentOrigin, saberent->r.currentOrigin))
;1518:	{
line 1519
;1519:		VectorSubtract(saberent->r.currentOrigin, ent->r.currentOrigin, vecsub);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
CNSTI4 368
ASGNI4
ADDRLP4 96
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 88
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
ADDRLP4 92
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 100
CNSTI4 372
ASGNI4
ADDRLP4 0+4
ADDRLP4 88
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
ADDRLP4 100
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 104
CNSTI4 376
ASGNI4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
ADDRLP4 104
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1520
;1520:		veclen = VectorLength(vecsub);
ADDRLP4 0
ARGP4
ADDRLP4 108
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 108
INDIRF4
ASGNF4
line 1522
;1521:
;1522:		if (veclen < dist)
ADDRLP4 12
INDIRF4
ADDRFP4 12
INDIRI4
CVIF4 4
GEF4 $792
line 1523
;1523:		{
line 1526
;1524:			trace_t tr;
;1525:
;1526:			trap_Trace(&tr, saberent->r.currentOrigin, NULL, NULL, ent->r.currentOrigin, saberent->s.number, MASK_SHOT);
ADDRLP4 112
ARGP4
ADDRLP4 1192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
CNSTI4 368
ASGNI4
ADDRLP4 1192
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 1196
INDIRI4
ADDP4
ARGP4
ADDRLP4 1192
INDIRP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1528
;1527:
;1528:			if (tr.fraction == 1 || tr.entityNum == ent->s.number)
ADDRLP4 112+8
INDIRF4
CNSTF4 1065353216
EQF4 $798
ADDRLP4 112+52
INDIRI4
ADDRFP4 8
INDIRP4
INDIRI4
NEI4 $794
LABELV $798
line 1529
;1529:			{
line 1532
;1530:				vec3_t dir;
;1531:
;1532:				VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
ADDRLP4 112+12
INDIRF4
ADDRLP4 1216
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1204+4
ADDRLP4 112+12+4
INDIRF4
ADDRLP4 1216
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1204+8
ADDRLP4 112+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1533
;1533:				VectorNormalize(dir);
ADDRLP4 1204
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1535
;1534:
;1535:				G_Damage(ent, saberOwner, saberOwner, dir, tr.endpos, 5, 0, MOD_SABER);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1220
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1220
INDIRP4
ARGP4
ADDRLP4 1204
ARGP4
ADDRLP4 112+12
ARGP4
CNSTI4 5
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1537
;1536:
;1537:				te = G_TempEntity( tr.endpos, EV_SABER_HIT );
ADDRLP4 112+12
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 1224
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 1224
INDIRP4
ASGNP4
line 1538
;1538:				VectorCopy(tr.endpos, te->s.origin);
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 112+12
INDIRB
ASGNB 12
line 1539
;1539:				VectorCopy(tr.plane.normal, te->s.angles);
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 112+24
INDIRB
ASGNB 12
line 1540
;1540:				if (!te->s.angles[0] && !te->s.angles[1] && !te->s.angles[2])
ADDRLP4 1228
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 1232
CNSTF4 0
ASGNF4
ADDRLP4 1228
INDIRP4
CNSTI4 116
ADDP4
INDIRF4
ADDRLP4 1232
INDIRF4
NEF4 $810
ADDRLP4 1228
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
ADDRLP4 1232
INDIRF4
NEF4 $810
ADDRLP4 1228
INDIRP4
CNSTI4 124
ADDP4
INDIRF4
ADDRLP4 1232
INDIRF4
NEF4 $810
line 1541
;1541:				{
line 1542
;1542:					te->s.angles[1] = 1;
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
CNSTF4 1065353216
ASGNF4
line 1543
;1543:				}
LABELV $810
line 1545
;1544:
;1545:				te->s.eventParm = 1;
ADDRLP4 16
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 1547
;1546:
;1547:				if (!returning)
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $812
line 1548
;1548:				{ //return to owner if blocked
line 1549
;1549:					thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 1236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1236
INDIRP4
ARGP4
ADDRLP4 1236
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1550
;1550:				}
LABELV $812
line 1552
;1551:
;1552:				saberOwner->client->ps.saberAttackWound = level.time + 500;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1553
;1553:			}
LABELV $794
line 1554
;1554:		}
LABELV $792
line 1555
;1555:	}
LABELV $788
LABELV $739
line 1557
;1556:
;1557:	return qtrue;
CNSTI4 1
RETI4
LABELV $734
endproc CheckThrownSaberDamaged 1240 32
export saberCheckRadiusDamage
proc saberCheckRadiusDamage 28 20
line 1561
;1558:}
;1559:
;1560:void saberCheckRadiusDamage(gentity_t *saberent, int returning)
;1561:{ //we're going to cheat and damage players within the saber's radius, just for the sake of doing things more "efficiently"
line 1562
;1562:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1563
;1563:	int dist = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1565
;1564:	gentity_t *ent;
;1565:	gentity_t *saberOwner = &g_entities[saberent->r.ownerNum];
ADDRLP4 8
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1567
;1566:
;1567:	if (returning && returning != 2)
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $816
ADDRLP4 16
INDIRI4
CNSTI4 2
EQI4 $816
line 1568
;1568:	{
line 1569
;1569:		dist = MIN_SABER_SLICE_RETURN_DISTANCE;
ADDRLP4 12
CNSTI4 30
ASGNI4
line 1570
;1570:	}
ADDRGP4 $817
JUMPV
LABELV $816
line 1572
;1571:	else
;1572:	{
line 1573
;1573:		dist = MIN_SABER_SLICE_DISTANCE;
ADDRLP4 12
CNSTI4 50
ASGNI4
line 1574
;1574:	}
LABELV $817
line 1576
;1575:
;1576:	if (!saberOwner || !saberOwner->client)
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $820
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $818
LABELV $820
line 1577
;1577:	{
line 1578
;1578:		return;
ADDRGP4 $815
JUMPV
LABELV $818
line 1581
;1579:	}
;1580:
;1581:	if (saberOwner->client->ps.saberAttackWound > level.time)
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $825
line 1582
;1582:	{
line 1583
;1583:		return;
ADDRGP4 $815
JUMPV
LABELV $824
line 1587
;1584:	}
;1585:
;1586:	while (i < /*MAX_CLIENTS*/MAX_GENTITIES)
;1587:	{
line 1588
;1588:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1590
;1589:
;1590:		CheckThrownSaberDamaged(saberent, saberOwner, ent, dist, returning);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CheckThrownSaberDamaged
CALLI4
pop
line 1592
;1591:
;1592:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1593
;1593:	}
LABELV $825
line 1586
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $824
line 1594
;1594:}
LABELV $815
endproc saberCheckRadiusDamage 28 20
export saberMoveBack
proc saberMoveBack 28 12
line 1599
;1595:
;1596://#define THROWN_SABER_COMP
;1597:
;1598:void saberMoveBack( gentity_t *ent, qboolean goingBack ) 
;1599:{
line 1602
;1600:	vec3_t		origin, oldOrg;
;1601:
;1602:	ent->s.pos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 1604
;1603:
;1604:	VectorCopy( ent->r.currentOrigin, oldOrg );
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1606
;1605:	// get current position
;1606:	BG_EvaluateTrajectory( &ent->s.pos, level.time, origin );
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1608
;1607:	//Get current angles?
;1608:	BG_EvaluateTrajectory( &ent->s.apos, level.time, ent->r.currentAngles );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1649
;1609:
;1610:	//compensation test code..
;1611:#ifdef THROWN_SABER_COMP
;1612:	if (!goingBack)
;1613:	{ //acts as a fallback in case touch code fails, keeps saber from going through things between predictions
;1614:		float originalLength = 0;
;1615:		int iCompensationLength = 32;
;1616:		trace_t tr;
;1617:		vec3_t mins, maxs;
;1618:		vec3_t calcComp, compensatedOrigin;
;1619:		VectorSet( mins, -24.0f, -24.0f, -8.0f );
;1620:		VectorSet( maxs, 24.0f, 24.0f, 8.0f );
;1621:
;1622:		VectorSubtract(origin, oldOrg, calcComp);
;1623:		originalLength = VectorLength(calcComp);
;1624:
;1625:		VectorNormalize(calcComp);
;1626:
;1627:		compensatedOrigin[0] = oldOrg[0] + calcComp[0]*(originalLength+iCompensationLength);		
;1628:		compensatedOrigin[1] = oldOrg[1] + calcComp[1]*(originalLength+iCompensationLength);
;1629:		compensatedOrigin[2] = oldOrg[2] + calcComp[2]*(originalLength+iCompensationLength);
;1630:
;1631:		trap_Trace(&tr, oldOrg, mins, maxs, compensatedOrigin, ent->r.ownerNum, MASK_PLAYERSOLID);
;1632:
;1633:		if ((tr.fraction != 1 || tr.startsolid || tr.allsolid) && tr.entityNum != ent->r.ownerNum)
;1634:		{
;1635:			VectorClear(ent->s.pos.trDelta);
;1636:
;1637:			//Unfortunately doing this would defeat the purpose of the compensation. We will have to settle for a jerk on the client.
;1638:			//VectorCopy( origin, ent->r.currentOrigin );
;1639:
;1640:			CheckThrownSaberDamaged(ent, &g_entities[ent->r.ownerNum], &g_entities[tr.entityNum], 256, 0);
;1641:
;1642:			tr.startsolid = 0;
;1643:			thrownSaberTouch(ent, &g_entities[tr.entityNum], &tr);
;1644:			return;
;1645:		}
;1646:	}
;1647:#endif
;1648:
;1649:	VectorCopy( origin, ent->r.currentOrigin );
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 1650
;1650:}
LABELV $827
endproc saberMoveBack 28 12
export SaberBounceSound
proc SaberBounceSound 4 0
line 1653
;1651:
;1652:void SaberBounceSound( gentity_t *self, gentity_t *other, trace_t *trace )
;1653:{
line 1654
;1654:	VectorCopy(self->r.currentAngles, self->s.apos.trBase);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 1655
;1655:	self->s.apos.trBase[PITCH] = 90;
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTF4 1119092736
ASGNF4
line 1656
;1656:}
LABELV $830
endproc SaberBounceSound 4 0
export DeadSaberThink
proc DeadSaberThink 0 4
line 1659
;1657:
;1658:void DeadSaberThink(gentity_t *saberent)
;1659:{
line 1660
;1660:	if (saberent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $832
line 1661
;1661:	{
line 1662
;1662:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1663
;1663:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1664
;1664:		return;
ADDRGP4 $831
JUMPV
LABELV $832
line 1667
;1665:	}
;1666:
;1667:	G_RunObject(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 1668
;1668:}
LABELV $831
endproc DeadSaberThink 0 4
export MakeDeadSaber
proc MakeDeadSaber 52 12
line 1671
;1669:
;1670:void MakeDeadSaber(gentity_t *ent)
;1671:{	//spawn a "dead" saber entity here so it looks like the saber fell out of the air.
line 1677
;1672:	//This entity will remove itself after a very short time period.
;1673:	vec3_t startorg;
;1674:	vec3_t startang;
;1675:	gentity_t *saberent;
;1676:	
;1677:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $837
line 1678
;1678:	{ //never spawn a dead saber in JM, because the only saber on the level is really a world object
line 1679
;1679:		G_Sound(ent, CHAN_AUTO, saberOffSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOffSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1680
;1680:		return;
ADDRGP4 $836
JUMPV
LABELV $837
line 1683
;1681:	}
;1682:
;1683:	saberent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1685
;1684:
;1685:	VectorCopy(ent->r.currentOrigin, startorg);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1686
;1686:	VectorCopy(ent->r.currentAngles, startang);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRB
ASGNB 12
line 1688
;1687:
;1688:	saberent->classname = "deadsaber";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $840
ASGNP4
line 1690
;1689:			
;1690:	saberent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 1691
;1691:	saberent->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 396
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1693
;1692:
;1693:	saberent->clipmask = MASK_PLAYERSOLID;
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 273
ASGNI4
line 1694
;1694:	saberent->r.contents = CONTENTS_TRIGGER;//0;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1696
;1695:
;1696:	VectorSet( saberent->r.mins, -3.0f, -3.0f, -3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3225419776
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3225419776
ASGNF4
line 1697
;1697:	VectorSet( saberent->r.maxs, 3.0f, 3.0f, 3.0f );
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1077936128
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1077936128
ASGNF4
line 1701
;1698:
;1699:	//saberent->mass = 10;
;1700:
;1701:	saberent->touch = SaberBounceSound;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberBounceSound
ASGNP4
line 1703
;1702:
;1703:	saberent->think = DeadSaberThink;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 DeadSaberThink
ASGNP4
line 1704
;1704:	saberent->nextthink = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1706
;1705:
;1706:	VectorCopy(startorg, saberent->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1707
;1707:	VectorCopy(startang, saberent->s.apos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1709
;1708:
;1709:	VectorCopy(startorg, saberent->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1710
;1710:	VectorCopy(startang, saberent->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1712
;1711:
;1712:	VectorCopy(startorg, saberent->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1713
;1713:	VectorCopy(startang, saberent->r.currentAngles);
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1715
;1714:
;1715:	saberent->s.apos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 5
ASGNI4
line 1716
;1716:	saberent->s.apos.trDelta[0] = Q_irand(200, 800);
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
ADDRLP4 32
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
line 1717
;1717:	saberent->s.apos.trDelta[1] = Q_irand(200, 800);
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 36
INDIRI4
CVIF4 4
ASGNF4
line 1718
;1718:	saberent->s.apos.trDelta[2] = Q_irand(200, 800);
CNSTI4 200
ARGI4
CNSTI4 800
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 40
INDIRI4
CVIF4 4
ASGNF4
line 1719
;1719:	saberent->s.apos.trTime = level.time-50;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1721
;1720:
;1721:	saberent->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1722
;1722:	saberent->s.pos.trTime = level.time-50;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 1723
;1723:	saberent->s.eFlags = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 1724
;1724:	saberent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $844
ARGP4
ADDRLP4 44
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 1725
;1725:	saberent->s.modelGhoul2 = 1;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 1726
;1726:	saberent->s.g2radius = 20;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
CNSTI4 20
ASGNI4
line 1728
;1727:
;1728:	saberent->s.eType = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 1729
;1729:	saberent->s.weapon = WP_SABER;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 1731
;1730:
;1731:	saberent->speed = level.time + 4000;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4000
ADDI4
CVIF4 4
ASGNF4
line 1733
;1732:
;1733:	saberent->bounceCount = 12;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 12
ASGNI4
line 1736
;1734:
;1735:	//fall off in the direction the real saber was headed
;1736:	VectorCopy(ent->s.pos.trDelta, saberent->s.pos.trDelta);
ADDRLP4 48
CNSTI4 36
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
ADDRFP4 0
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRB
ASGNB 12
line 1738
;1737:
;1738:	saberMoveBack(saberent, qtrue);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 1739
;1739:	saberent->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 1741
;1740:
;1741:	trap_LinkEntity(saberent);	
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1742
;1742:}
LABELV $836
endproc MakeDeadSaber 52 12
export saberBackToOwner
proc saberBackToOwner 48 8
line 1745
;1743:
;1744:void saberBackToOwner(gentity_t *saberent)
;1745:{
line 1746
;1746:	gentity_t *saberOwner = &g_entities[saberent->r.ownerNum];
ADDRLP4 16
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1750
;1747:	vec3_t dir;
;1748:	float ownerLen;
;1749:
;1750:	if (saberent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $847
line 1751
;1751:	{
line 1752
;1752:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 1754
;1753:
;1754:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1755
;1755:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1756
;1756:		return;
ADDRGP4 $846
JUMPV
LABELV $847
line 1759
;1757:	}
;1758:
;1759:	if (!g_entities[saberent->r.ownerNum].inuse ||
ADDRLP4 20
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $856
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $856
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $850
LABELV $856
line 1762
;1760:		!g_entities[saberent->r.ownerNum].client ||
;1761:		g_entities[saberent->r.ownerNum].client->sess.sessionTeam == TEAM_SPECTATOR)
;1762:	{
line 1763
;1763:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 1765
;1764:
;1765:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1766
;1766:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1767
;1767:		return;
ADDRGP4 $846
JUMPV
LABELV $850
line 1770
;1768:	}
;1769:
;1770:	if (g_entities[saberent->r.ownerNum].health < 1 || !g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERATTACK] || !g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW])
ADDRLP4 24
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $864
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $864
ADDRLP4 24
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $858
LABELV $864
line 1771
;1771:	{ //He's dead, just go back to our normal saber status
line 1772
;1772:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 1773
;1773:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 1774
;1774:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1776
;1775:
;1776:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 1778
;1777:
;1778:		saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1779
;1779:		saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 1780
;1780:		VectorSet( saberent->r.mins, -8.0f, -8.0f, -8.0f );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 1781
;1781:		VectorSet( saberent->r.maxs, 8.0f, 8.0f, 8.0f );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 1782
;1782:		saberent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1784
;1783:
;1784:		g_entities[saberent->r.ownerNum].client->ps.saberInFlight = qfalse;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 1785
;1785:		g_entities[saberent->r.ownerNum].client->ps.saberThrowDelay = level.time + 500;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1786
;1786:		g_entities[saberent->r.ownerNum].client->ps.saberCanThrow = qfalse;
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1788
;1787:
;1788:		return;
ADDRGP4 $846
JUMPV
LABELV $858
line 1791
;1789:	}
;1790:
;1791:	saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 1795
;1792:
;1793:	//saberent->s.apos.trDelta[1] = 0;
;1794:
;1795:	VectorSubtract(saberent->pos1, saberent->r.currentOrigin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 36
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1797
;1796:
;1797:	ownerLen = VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 1799
;1798:
;1799:	if (saberent->speed < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $872
line 1800
;1800:	{
line 1801
;1801:		VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1803
;1802:
;1803:		saberMoveBack(saberent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 1804
;1804:		VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1806
;1805:
;1806:		if (g_entities[saberent->r.ownerNum].client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
LTI4 $875
line 1807
;1807:		{ //allow players with high saber throw rank to control the return speed of the saber
line 1808
;1808:			if (g_entities[saberent->r.ownerNum].client->buttons & BUTTON_ATTACK)
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $878
line 1809
;1809:			{
line 1810
;1810:				VectorScale(dir, 1200, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1150681088
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1150681088
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1150681088
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1811
;1811:				saberent->speed = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
CVIF4 4
ASGNF4
line 1812
;1812:			}
ADDRGP4 $876
JUMPV
LABELV $878
line 1814
;1813:			else
;1814:			{
line 1815
;1815:				VectorScale(dir, 700, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1816
;1816:				saberent->speed = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 1817
;1817:			}
line 1818
;1818:		}
ADDRGP4 $876
JUMPV
LABELV $875
line 1820
;1819:		else
;1820:		{
line 1821
;1821:			VectorScale(dir, 700, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1143930880
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1143930880
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1143930880
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1822
;1822:			saberent->speed = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
CVIF4 4
ASGNF4
line 1823
;1823:		}
LABELV $876
line 1824
;1824:		saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1825
;1825:	}
LABELV $872
line 1827
;1826:
;1827:	if (ownerLen <= 512)
ADDRLP4 12
INDIRF4
CNSTF4 1140850688
GTF4 $891
line 1828
;1828:	{
line 1829
;1829:		saberent->s.saberInFlight = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 0
ASGNI4
line 1830
;1830:		saberent->s.loopSound = saberHumSound;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 saberHumSound
INDIRI4
ASGNI4
line 1831
;1831:	}
LABELV $891
line 1833
;1832:
;1833:	if (ownerLen <= 32)
ADDRLP4 12
INDIRF4
CNSTF4 1107296256
GTF4 $893
line 1834
;1834:	{
line 1835
;1835:		saberOwner->client->ps.saberInFlight = qfalse;
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 1836
;1836:		saberOwner->client->ps.saberCanThrow = qfalse;
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1837
;1837:		saberOwner->client->ps.saberThrowDelay = level.time + 300;
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 1839
;1838:
;1839:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 1841
;1840:
;1841:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 1842
;1842:		saberent->nextthink = level.time + 50;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 1844
;1843:
;1844:		return;
ADDRGP4 $846
JUMPV
LABELV $893
line 1847
;1845:	}
;1846:
;1847:	if (!saberent->s.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
NEI4 $897
line 1848
;1848:	{
line 1849
;1849:		saberCheckRadiusDamage(saberent, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 1850
;1850:	}
ADDRGP4 $898
JUMPV
LABELV $897
line 1852
;1851:	else
;1852:	{
line 1853
;1853:		saberCheckRadiusDamage(saberent, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 1854
;1854:	}
LABELV $898
line 1856
;1855:
;1856:	saberMoveBack(saberent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 1859
;1857:	//G_RunObject(saberent);
;1858:
;1859:	saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1860
;1860:}
LABELV $846
endproc saberBackToOwner 48 8
export thrownSaberTouch
proc thrownSaberTouch 44 20
line 1865
;1861:
;1862:void saberFirstThrown(gentity_t *saberent);
;1863:
;1864:void thrownSaberTouch (gentity_t *saberent, gentity_t *other, trace_t *trace)
;1865:{
line 1866
;1866:	gentity_t *hitEnt = other;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
line 1868
;1867:
;1868:	if (other && other->s.number == saberent->r.ownerNum)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $901
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
NEI4 $901
line 1869
;1869:	{
line 1870
;1870:		return;
ADDRGP4 $900
JUMPV
LABELV $901
line 1872
;1871:	}
;1872:	VectorClear(saberent->s.pos.trDelta);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1873
;1873:	saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1875
;1874:
;1875:	saberent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 1876
;1876:	saberent->s.apos.trDelta[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 1877
;1877:	saberent->s.apos.trDelta[1] = 800;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 1145569280
ASGNF4
line 1878
;1878:	saberent->s.apos.trDelta[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 1880
;1879:
;1880:	VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 1884
;1881:
;1882:	//saberent->damage = SABER_THROWN_RETURN_HIT_DAMAGE;
;1883:
;1884:	saberent->think = saberBackToOwner;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 saberBackToOwner
ASGNP4
line 1885
;1885:	saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1888
;1886:
;1887:	//saberCheckRadiusDamage(saberent, 2);
;1888:	if (other && other->r.ownerNum < MAX_CLIENTS &&
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $905
ADDRLP4 28
ADDRLP4 20
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32
GEI4 $905
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $905
ADDRLP4 36
CNSTI4 828
ADDRLP4 28
INDIRI4
MULI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $905
ADDRLP4 36
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $905
line 1892
;1889:		(other->r.contents & CONTENTS_LIGHTSABER) &&
;1890:		g_entities[other->r.ownerNum].client &&
;1891:		g_entities[other->r.ownerNum].inuse)
;1892:	{
line 1893
;1893:		hitEnt = &g_entities[other->r.ownerNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1894
;1894:	}
LABELV $905
line 1896
;1895:
;1896:	CheckThrownSaberDamaged(saberent, &g_entities[saberent->r.ownerNum], hitEnt, 256, 0);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 40
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 256
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CheckThrownSaberDamaged
CALLI4
pop
line 1898
;1897:
;1898:	saberent->speed = 0;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 0
ASGNF4
line 1899
;1899:}
LABELV $900
endproc thrownSaberTouch 44 20
export saberFirstThrown
proc saberFirstThrown 1204 28
line 1904
;1900:
;1901:#define SABER_MAX_THROW_DISTANCE 700
;1902:
;1903:void saberFirstThrown(gentity_t *saberent)
;1904:{
line 1907
;1905:	vec3_t		vSub;
;1906:	float		vLen;
;1907:	gentity_t	*saberOwn = &g_entities[saberent->r.ownerNum];
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1909
;1908:
;1909:	if (saberent->r.ownerNum == ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $910
line 1910
;1910:	{
line 1911
;1911:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 1913
;1912:
;1913:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1914
;1914:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1915
;1915:		return;
ADDRGP4 $909
JUMPV
LABELV $910
line 1918
;1916:	}
;1917:
;1918:	if (!saberOwn ||
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $917
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $917
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $917
ADDRLP4 28
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $913
LABELV $917
line 1922
;1919:		!saberOwn->inuse ||
;1920:		!saberOwn->client ||
;1921:		saberOwn->client->sess.sessionTeam == TEAM_SPECTATOR)
;1922:	{
line 1923
;1923:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 1925
;1924:
;1925:		saberent->think = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 1926
;1926:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1927
;1927:		return;
ADDRGP4 $909
JUMPV
LABELV $913
line 1930
;1928:	}
;1929:
;1930:	if (saberOwn->health < 1 || !saberOwn->client->ps.fd.forcePowerLevel[FP_SABERATTACK] || !saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW])
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
LTI4 $922
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $922
ADDRLP4 36
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $919
LABELV $922
line 1931
;1931:	{ //He's dead, just go back to our normal saber status
line 1932
;1932:		saberent->touch = SaberGotHit;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 SaberGotHit
ASGNP4
line 1933
;1933:		saberent->think = SaberUpdateSelf;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 SaberUpdateSelf
ASGNP4
line 1934
;1934:		saberent->nextthink = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1936
;1935:
;1936:		MakeDeadSaber(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MakeDeadSaber
CALLV
pop
line 1938
;1937:
;1938:		saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1939
;1939:		saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 1940
;1940:		VectorSet( saberent->r.mins, -8.0f, -8.0f, -8.0f );
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 1941
;1941:		VectorSet( saberent->r.maxs, 8.0f, 8.0f, 8.0f );
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 1942
;1942:		saberent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1944
;1943:
;1944:		saberOwn->client->ps.saberInFlight = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 1945
;1945:		saberOwn->client->ps.saberThrowDelay = level.time + 500;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1946
;1946:		saberOwn->client->ps.saberCanThrow = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 1948
;1947:
;1948:		return;
ADDRGP4 $909
JUMPV
LABELV $919
line 1951
;1949:	}
;1950:
;1951:	if ((level.time - saberOwn->client->ps.saberDidThrowTime) > 500)
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
SUBI4
CNSTI4 500
LEI4 $925
line 1952
;1952:	{
line 1953
;1953:		if (!(saberOwn->client->buttons & BUTTON_ALT_ATTACK))
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $928
line 1954
;1954:		{ //If owner releases altattack 500ms or later after throwing saber, it autoreturns
line 1955
;1955:			thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1956
;1956:			goto runMin;
ADDRGP4 $930
JUMPV
LABELV $928
line 1958
;1957:		}
;1958:		else if ((level.time - saberOwn->client->ps.saberDidThrowTime) > 6000)
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
SUBI4
CNSTI4 6000
LEI4 $931
line 1959
;1959:		{ //if it's out longer than 6 seconds, return it
line 1960
;1960:			thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1961
;1961:			goto runMin;
ADDRGP4 $930
JUMPV
LABELV $931
line 1963
;1962:		}
;1963:	}
LABELV $925
line 1965
;1964:
;1965:	if (BG_HasYsalamiri(g_gametype.integer, &saberOwn->client->ps))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $934
line 1966
;1966:	{
line 1967
;1967:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1968
;1968:		goto runMin;
ADDRGP4 $930
JUMPV
LABELV $934
line 1971
;1969:	}
;1970:	
;1971:	if (!BG_CanUseFPNow(g_gametype.integer, &saberOwn->client->ps, level.time, FP_SABERTHROW))
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRLP4 48
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $937
line 1972
;1972:	{
line 1973
;1973:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1974
;1974:		goto runMin;
ADDRGP4 $930
JUMPV
LABELV $937
line 1977
;1975:	}
;1976:
;1977:	VectorSubtract(saberOwn->client->ps.origin, saberent->r.currentOrigin, vSub);
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 52
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1978
;1978:	vLen = VectorLength(vSub);
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 60
INDIRF4
ASGNF4
line 1980
;1979:
;1980:	if (vLen >= (SABER_MAX_THROW_DISTANCE*saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW]))
ADDRLP4 16
INDIRF4
CNSTI4 700
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
MULI4
CVIF4 4
LTF4 $943
line 1981
;1981:	{
line 1982
;1982:		thrownSaberTouch(saberent, saberent, NULL);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 thrownSaberTouch
CALLV
pop
line 1983
;1983:		goto runMin;
ADDRGP4 $930
JUMPV
LABELV $943
line 1986
;1984:	}
;1985:
;1986:	if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_2 &&
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 2
LTI4 $945
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
GEF4 $945
line 1988
;1987:		saberent->speed < level.time)
;1988:	{ //if owner is rank 3 in saber throwing, the saber goes where he points
line 1992
;1989:		vec3_t fwd, traceFrom, traceTo, dir;
;1990:		trace_t tr;
;1991:
;1992:		AngleVectors(saberOwn->client->ps.viewangles, fwd, 0, 0);
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 1192
CNSTP4 0
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1994
;1993:
;1994:		VectorCopy(saberOwn->client->ps.origin, traceFrom);
ADDRLP4 100
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1995
;1995:		traceFrom[2] += saberOwn->client->ps.viewheight;
ADDRLP4 100+8
ADDRLP4 100+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1997
;1996:
;1997:		VectorCopy(traceFrom, traceTo);
ADDRLP4 76
ADDRLP4 100
INDIRB
ASGNB 12
line 1998
;1998:		traceTo[0] += fwd[0]*4096;
ADDRLP4 76
ADDRLP4 76
INDIRF4
CNSTF4 1166016512
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 1999
;1999:		traceTo[1] += fwd[1]*4096;
ADDRLP4 76+4
ADDRLP4 76+4
INDIRF4
CNSTF4 1166016512
ADDRLP4 88+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2000
;2000:		traceTo[2] += fwd[2]*4096;
ADDRLP4 76+8
ADDRLP4 76+8
INDIRF4
CNSTF4 1166016512
ADDRLP4 88+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2002
;2001:
;2002:		saberMoveBack(saberent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberMoveBack
CALLV
pop
line 2003
;2003:		VectorCopy(saberent->r.currentOrigin, saberent->s.pos.trBase);
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 1196
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 2005
;2004:
;2005:		if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
LTI4 $953
line 2006
;2006:		{ //if highest saber throw rank, we can direct the saber toward players directly by looking at them
line 2007
;2007:			trap_Trace(&tr, traceFrom, NULL, NULL, traceTo, saberOwn->s.number, MASK_PLAYERSOLID);
ADDRLP4 112
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2008
;2008:		}
ADDRGP4 $954
JUMPV
LABELV $953
line 2010
;2009:		else
;2010:		{
line 2011
;2011:			trap_Trace(&tr, traceFrom, NULL, NULL, traceTo, saberOwn->s.number, MASK_SOLID);
ADDRLP4 112
ARGP4
ADDRLP4 100
ARGP4
ADDRLP4 1200
CNSTP4 0
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2012
;2012:		}
LABELV $954
line 2017
;2013:
;2014:		//G_TestLine(traceFrom, tr.endpos, 0x000000ff, 100);
;2015:
;2016:		//if (tr.fraction != 1)
;2017:		{
line 2018
;2018:			VectorSubtract(tr.endpos, saberent->r.currentOrigin, dir);
ADDRLP4 1200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 112+12
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 112+12+4
INDIRF4
ADDRLP4 1200
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 112+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2020
;2019:
;2020:			VectorNormalize(dir);
ADDRLP4 64
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2022
;2021:
;2022:			VectorScale(dir, 500, saberent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1140457472
ADDRLP4 64
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1140457472
ADDRLP4 64+4
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1140457472
ADDRLP4 64+8
INDIRF4
MULF4
ASGNF4
line 2023
;2023:			saberent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2025
;2024:
;2025:			if (saberOwn->client->ps.fd.forcePowerLevel[FP_SABERTHROW] >= FORCE_LEVEL_3)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1000
ADDP4
INDIRI4
CNSTI4 3
LTI4 $965
line 2026
;2026:			{ //we'll treat them to a quicker update rate if their throw rank is high enough
line 2027
;2027:				saberent->speed = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ASGNF4
line 2028
;2028:			}
ADDRGP4 $966
JUMPV
LABELV $965
line 2030
;2029:			else
;2030:			{
line 2031
;2031:				saberent->speed = level.time + 400;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 400
ADDI4
CVIF4 4
ASGNF4
line 2032
;2032:			}
LABELV $966
line 2033
;2033:		}
line 2034
;2034:	}
LABELV $945
LABELV $930
line 2038
;2035:
;2036:runMin:
;2037:
;2038:	saberCheckRadiusDamage(saberent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberCheckRadiusDamage
CALLV
pop
line 2039
;2039:	G_RunObject(saberent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunObject
CALLV
pop
line 2040
;2040:}
LABELV $909
endproc saberFirstThrown 1204 28
export WP_SaberPositionUpdate
proc WP_SaberPositionUpdate 316 40
line 2043
;2041:
;2042:void WP_SaberPositionUpdate( gentity_t *self, usercmd_t *ucmd )
;2043:{ //rww - keep the saber position as updated as possible on the server so that we can try to do realistic-looking contact stuff
line 2051
;2044:	mdxaBone_t	boltMatrix;
;2045:	vec3_t properAngles, properOrigin;
;2046:	vec3_t boltAngles, boltOrigin;
;2047:	vec3_t end;
;2048:	vec3_t legAxis[3];
;2049:	vec3_t addVel;
;2050:	vec3_t rawAngles;
;2051:	float fVSpeed = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 2055
;2052:	int f;
;2053:	int torsoAnim;
;2054:	int legsAnim;
;2055:	int returnAfterUpdate = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2056
;2056:	float animSpeedScale = 1;
ADDRLP4 28
CNSTF4 1065353216
ASGNF4
line 2057
;2057:	qboolean setTorso = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 2059
;2058:
;2059:	if (self && self->inuse && self->client)
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
CNSTU4 0
ASGNU4
ADDRLP4 196
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $970
ADDRLP4 196
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $970
ADDRLP4 196
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 200
INDIRU4
EQU4 $970
line 2060
;2060:	{
line 2061
;2061:		if (self->client->saberCycleQueue)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
CNSTI4 0
EQI4 $972
line 2062
;2062:		{
line 2063
;2063:			self->client->ps.fd.saberDrawAnimLevel = self->client->saberCycleQueue;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 204
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
ASGNI4
line 2064
;2064:		}
ADDRGP4 $973
JUMPV
LABELV $972
line 2066
;2065:		else
;2066:		{
line 2067
;2067:			self->client->ps.fd.saberDrawAnimLevel = self->client->ps.fd.saberAnimLevel;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 1220
ADDP4
ADDRLP4 204
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ASGNI4
line 2068
;2068:		}
LABELV $973
line 2069
;2069:	}
LABELV $970
line 2071
;2070:
;2071:	if (self &&
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
CNSTU4 0
ASGNU4
ADDRLP4 204
INDIRP4
CVPU4 4
ADDRLP4 208
INDIRU4
EQU4 $974
ADDRLP4 212
CNSTI4 0
ASGNI4
ADDRLP4 204
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
EQI4 $974
ADDRLP4 216
ADDRLP4 204
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 216
INDIRP4
CVPU4 4
ADDRLP4 208
INDIRU4
EQU4 $974
ADDRLP4 216
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
EQI4 $974
ADDRLP4 216
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 212
INDIRI4
LEI4 $976
ADDRLP4 204
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $974
LABELV $976
line 2076
;2072:		self->inuse &&
;2073:		self->client &&
;2074:		self->client->saberCycleQueue &&
;2075:		(self->client->ps.weaponTime <= 0 || self->health < 1))
;2076:	{ //we cycled attack levels while we were busy, so update now that we aren't (even if that means we're dead)
line 2077
;2077:		self->client->ps.fd.saberAnimLevel = self->client->saberCycleQueue;
ADDRLP4 220
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 1216
ADDP4
ADDRLP4 220
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
ASGNI4
line 2078
;2078:		self->client->saberCycleQueue = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
CNSTI4 0
ASGNI4
line 2079
;2079:	}
LABELV $974
line 2081
;2080:
;2081:	if (!self ||
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 224
CNSTU4 0
ASGNU4
ADDRLP4 220
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $982
ADDRLP4 228
ADDRLP4 220
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $982
ADDRLP4 228
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $982
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
ADDRLP4 224
INDIRU4
EQU4 $982
ADDRLP4 220
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 1
GEI4 $977
LABELV $982
line 2086
;2082:		!self->client ||
;2083:		!self->client->ghoul2 ||
;2084:		!g2SaberInstance ||
;2085:		self->health < 1)
;2086:	{
line 2087
;2087:		return;
ADDRGP4 $969
JUMPV
LABELV $977
line 2090
;2088:	}
;2089:
;2090:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $983
line 2091
;2091:	{ //we don't update the server's G2 instance in the case of ATST use, so..
line 2092
;2092:		return;
ADDRGP4 $969
JUMPV
LABELV $983
line 2095
;2093:	}
;2094:
;2095:	if (self->client->ps.weapon != WP_SABER ||
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 236
CNSTI4 2
ASGNI4
ADDRLP4 232
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 236
INDIRI4
NEI4 $988
ADDRLP4 240
ADDRLP4 232
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
ADDRLP4 240
INDIRI4
CNSTI4 1
EQI4 $988
ADDRLP4 240
INDIRI4
ADDRLP4 236
INDIRI4
NEI4 $985
LABELV $988
line 2098
;2096:		self->client->ps.weaponstate == WEAPON_RAISING ||
;2097:		self->client->ps.weaponstate == WEAPON_DROPPING)
;2098:	{
line 2099
;2099:		returnAfterUpdate = 1;
ADDRLP4 140
CNSTI4 1
ASGNI4
line 2101
;2100:		//return;
;2101:	}
LABELV $985
line 2103
;2102:
;2103:	if (self->client->ps.saberThrowDelay < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $989
line 2104
;2104:	{
line 2105
;2105:		self->client->ps.saberCanThrow = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 2106
;2106:	}
LABELV $989
line 2108
;2107:
;2108:	if (self->client->ps.fd.forcePowersActive & (1 << FP_RAGE))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $992
line 2109
;2109:	{
line 2110
;2110:		animSpeedScale = 2;
ADDRLP4 28
CNSTF4 1073741824
ASGNF4
line 2111
;2111:	}
LABELV $992
line 2113
;2112:	
;2113:	torsoAnim = (self->client->ps.torsoAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2114
;2114:	legsAnim = (self->client->ps.legsAnim & ~ANIM_TOGGLEBIT );
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2116
;2115:
;2116:	VectorCopy(self->client->ps.origin, properOrigin);
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2117
;2117:	VectorCopy(self->client->ps.viewangles, properAngles);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 2120
;2118:
;2119:	//try to predict the origin based on velocity so it's more like what the client is seeing
;2120:	VectorCopy(self->client->ps.velocity, addVel);
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2121
;2121:	VectorNormalize(addVel);
ADDRLP4 108
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2123
;2122:
;2123:	if (self->client->ps.velocity[0] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
GEF4 $994
line 2124
;2124:	{
line 2125
;2125:		fVSpeed += (-self->client->ps.velocity[0]);
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2126
;2126:	}
ADDRGP4 $995
JUMPV
LABELV $994
line 2128
;2127:	else
;2128:	{
line 2129
;2129:		fVSpeed += self->client->ps.velocity[0];
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2130
;2130:	}
LABELV $995
line 2131
;2131:	if (self->client->ps.velocity[1] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
GEF4 $996
line 2132
;2132:	{
line 2133
;2133:		fVSpeed += (-self->client->ps.velocity[1]);
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2134
;2134:	}
ADDRGP4 $997
JUMPV
LABELV $996
line 2136
;2135:	else
;2136:	{
line 2137
;2137:		fVSpeed += self->client->ps.velocity[1];
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2138
;2138:	}
LABELV $997
line 2139
;2139:	if (self->client->ps.velocity[2] < 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $998
line 2140
;2140:	{
line 2141
;2141:		fVSpeed += (-self->client->ps.velocity[2]);
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
NEGF4
ADDF4
ASGNF4
line 2142
;2142:	}
ADDRGP4 $999
JUMPV
LABELV $998
line 2144
;2143:	else
;2144:	{
line 2145
;2145:		fVSpeed += self->client->ps.velocity[2];
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2146
;2146:	}
LABELV $999
line 2148
;2147:
;2148:	fVSpeed *= 0.08;
ADDRLP4 24
CNSTF4 1034147594
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 2150
;2149:
;2150:	properOrigin[0] += addVel[0]*fVSpeed;
ADDRLP4 96
ADDRLP4 96
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 2151
;2151:	properOrigin[1] += addVel[1]*fVSpeed;
ADDRLP4 96+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 108+4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 2152
;2152:	properOrigin[2] += addVel[2]*fVSpeed;
ADDRLP4 96+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 108+8
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 2154
;2153:
;2154:	properAngles[0] = 0;
ADDRLP4 80
CNSTF4 0
ASGNF4
line 2155
;2155:	properAngles[1] = self->client->ps.viewangles[YAW];
ADDRLP4 80+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2156
;2156:	properAngles[2] = 0;
ADDRLP4 80+8
CNSTF4 0
ASGNF4
line 2158
;2157:
;2158:	AnglesToAxis( properAngles, legAxis );
ADDRLP4 80
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 2159
;2159:	G_G2PlayerAngles( self, legAxis, properAngles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 G_G2PlayerAngles
CALLV
pop
line 2161
;2160:
;2161:	if (returnAfterUpdate)
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1006
line 2162
;2162:	{ //We don't even need to do GetBoltMatrix if we're only in here to keep the g2 server instance in sync
line 2163
;2163:		goto finalUpdate;
ADDRGP4 $1008
JUMPV
LABELV $1006
line 2166
;2164:	}
;2165:
;2166:	trap_G2API_GetBoltMatrix(self->client->ghoul2, 1, 0, &boltMatrix, properAngles, properOrigin, level.time, NULL, vec3_origin);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 32
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 trap_G2API_GetBoltMatrix
CALLI4
pop
line 2168
;2167:
;2168:	boltOrigin[0] = boltMatrix.matrix[0][3];
ADDRLP4 12
ADDRLP4 32+12
INDIRF4
ASGNF4
line 2169
;2169:	boltOrigin[1] = boltMatrix.matrix[1][3];
ADDRLP4 12+4
ADDRLP4 32+16+12
INDIRF4
ASGNF4
line 2170
;2170:	boltOrigin[2] = boltMatrix.matrix[2][3];
ADDRLP4 12+8
ADDRLP4 32+32+12
INDIRF4
ASGNF4
line 2172
;2171:
;2172:	boltAngles[0] = -boltMatrix.matrix[0][1];
ADDRLP4 0
ADDRLP4 32+4
INDIRF4
NEGF4
ASGNF4
line 2173
;2173:	boltAngles[1] = -boltMatrix.matrix[1][1];
ADDRLP4 0+4
ADDRLP4 32+16+4
INDIRF4
NEGF4
ASGNF4
line 2174
;2174:	boltAngles[2] = -boltMatrix.matrix[2][1];
ADDRLP4 0+8
ADDRLP4 32+32+4
INDIRF4
NEGF4
ASGNF4
line 2176
;2175:
;2176:	VectorCopy(boltAngles, rawAngles);
ADDRLP4 184
ADDRLP4 0
INDIRB
ASGNB 12
line 2178
;2177:
;2178:	VectorMA( boltOrigin, 40, boltAngles, end );
ADDRLP4 244
CNSTF4 1109393408
ASGNF4
ADDRLP4 124
ADDRLP4 12
INDIRF4
ADDRLP4 244
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 244
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1109393408
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2180
;2179:
;2180:	if (self->client->ps.saberEntityNum)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1030
line 2181
;2181:	{
line 2182
;2182:		gentity_t *mySaber = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 248
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2184
;2183:
;2184:		if (mySaber && (mySaber->r.contents & CONTENTS_LIGHTSABER) && !self->client->ps.saberInFlight)
ADDRLP4 252
ADDRLP4 248
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1032
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRLP4 252
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 262144
BANDI4
ADDRLP4 256
INDIRI4
EQI4 $1032
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 256
INDIRI4
NEI4 $1032
line 2185
;2185:		{ //place it roughly in the middle of the saber..
line 2186
;2186:			VectorMA( boltOrigin, 20, boltAngles, mySaber->r.currentOrigin );
ADDRLP4 248
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRF4
CNSTF4 1101004800
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 372
ADDP4
ADDRLP4 12+4
INDIRF4
CNSTF4 1101004800
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 376
ADDP4
ADDRLP4 12+8
INDIRF4
CNSTF4 1101004800
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2188
;2187:
;2188:			if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1038
line 2189
;2189:			{
line 2190
;2190:				VectorCopy(boltOrigin, mySaber->r.currentOrigin);
ADDRLP4 248
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2191
;2191:			}
LABELV $1038
line 2193
;2192:			//VectorCopy(/*boltOrigin*/end, mySaber->r.currentOrigin);
;2193:		}
LABELV $1032
line 2194
;2194:	}
LABELV $1030
line 2196
;2195:
;2196:	boltAngles[YAW] = self->client->ps.viewangles[YAW];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2200
;2197:
;2198:	//G_TestLine(boltOrigin, end, 0x000000ff, 50);
;2199:
;2200:	if (self->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1041
line 2201
;2201:	{ //do the thrown-saber stuff
line 2202
;2202:		gentity_t *saberent = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 248
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2204
;2203:
;2204:		if (saberent)
ADDRLP4 248
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1042
line 2205
;2205:		{
line 2206
;2206:			if (!self->client->ps.saberEntityState)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1045
line 2207
;2207:			{
line 2210
;2208:				vec3_t startorg, startang, dir;
;2209:
;2210:				VectorCopy(boltOrigin, saberent->r.currentOrigin);
ADDRLP4 248
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2212
;2211:
;2212:				VectorCopy(boltOrigin, startorg);
ADDRLP4 264
ADDRLP4 12
INDIRB
ASGNB 12
line 2213
;2213:				VectorCopy(boltAngles, startang);
ADDRLP4 276
ADDRLP4 0
INDIRB
ASGNB 12
line 2219
;2214:
;2215:				//startang[0] = 90;
;2216:				//Instead of this we'll sort of fake it and slowly tilt it down on the client via
;2217:				//a perframe method
;2218:
;2219:				saberent->r.svFlags &= ~(SVF_NOCLIENT);
ADDRLP4 288
ADDRLP4 248
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
ADDRLP4 288
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 2220
;2220:				VectorCopy(startorg, saberent->s.pos.trBase);
ADDRLP4 248
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 264
INDIRB
ASGNB 12
line 2221
;2221:				VectorCopy(startang, saberent->s.apos.trBase);
ADDRLP4 248
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 276
INDIRB
ASGNB 12
line 2223
;2222:
;2223:				VectorCopy(startorg, saberent->s.origin);
ADDRLP4 248
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 264
INDIRB
ASGNB 12
line 2224
;2224:				VectorCopy(startang, saberent->s.angles);
ADDRLP4 248
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 276
INDIRB
ASGNB 12
line 2226
;2225:
;2226:				saberent->s.saberInFlight = qtrue;
ADDRLP4 248
INDIRP4
CNSTI4 228
ADDP4
CNSTI4 1
ASGNI4
line 2228
;2227:
;2228:				saberent->s.apos.trType = TR_LINEAR;
ADDRLP4 248
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 2229
;2229:				saberent->s.apos.trDelta[0] = 0;
ADDRLP4 248
INDIRP4
CNSTI4 72
ADDP4
CNSTF4 0
ASGNF4
line 2230
;2230:				saberent->s.apos.trDelta[1] = 800;
ADDRLP4 248
INDIRP4
CNSTI4 76
ADDP4
CNSTF4 1145569280
ASGNF4
line 2231
;2231:				saberent->s.apos.trDelta[2] = 0;
ADDRLP4 248
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
line 2233
;2232:
;2233:				saberent->s.pos.trType = TR_LINEAR;
ADDRLP4 248
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 2234
;2234:				saberent->s.eType = ET_GENERAL;
ADDRLP4 248
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 2235
;2235:				saberent->s.eFlags = 0;
ADDRLP4 248
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 2236
;2236:				saberent->s.modelindex = G_ModelIndex("models/weapons2/saber/saber_w.glm");
ADDRGP4 $844
ARGP4
ADDRLP4 292
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 248
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 292
INDIRI4
ASGNI4
line 2237
;2237:				saberent->s.modelGhoul2 = 127;
ADDRLP4 248
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 127
ASGNI4
line 2239
;2238:
;2239:				saberent->parent = self;
ADDRLP4 248
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 2241
;2240:
;2241:				self->client->ps.saberEntityState = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 2244
;2242:
;2243:				//Projectile stuff:
;2244:				AngleVectors(self->client->ps.viewangles, dir, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 252
ARGP4
ADDRLP4 296
CNSTP4 0
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2246
;2245:
;2246:				saberent->nextthink = level.time + FRAMETIME;
ADDRLP4 248
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 2247
;2247:				saberent->think = saberFirstThrown;//G_RunObject;
ADDRLP4 248
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 saberFirstThrown
ASGNP4
line 2249
;2248:
;2249:				saberent->damage = SABER_THROWN_HIT_DAMAGE;
ADDRLP4 248
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 30
ASGNI4
line 2250
;2250:				saberent->methodOfDeath = MOD_SABER;
ADDRLP4 248
INDIRP4
CNSTI4 704
ADDP4
CNSTI4 3
ASGNI4
line 2251
;2251:				saberent->splashMethodOfDeath = MOD_SABER;
ADDRLP4 248
INDIRP4
CNSTI4 708
ADDP4
CNSTI4 3
ASGNI4
line 2252
;2252:				saberent->s.solid = 2;
ADDRLP4 248
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 2
ASGNI4
line 2253
;2253:				saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 248
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 2255
;2254:
;2255:				VectorSet( saberent->r.mins, -24.0f, -24.0f, -8.0f );
ADDRLP4 248
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3250585600
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3250585600
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 2256
;2256:				VectorSet( saberent->r.maxs, 24.0f, 24.0f, 8.0f );
ADDRLP4 248
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1103101952
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1103101952
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 2258
;2257:
;2258:				saberent->s.genericenemyindex = self->s.number+1024;
ADDRLP4 248
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1024
ADDI4
ASGNI4
line 2260
;2259:
;2260:				saberent->touch = thrownSaberTouch;
ADDRLP4 248
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 thrownSaberTouch
ASGNP4
line 2262
;2261:
;2262:				saberent->s.weapon = WP_SABER;
ADDRLP4 248
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 2
ASGNI4
line 2264
;2263:
;2264:				VectorScale(dir, 400, saberent->s.pos.trDelta );
ADDRLP4 248
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1137180672
ADDRLP4 252
INDIRF4
MULF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ADDRLP4 252+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 1137180672
ADDRLP4 252+8
INDIRF4
MULF4
ASGNF4
line 2265
;2265:				saberent->s.pos.trTime = level.time;
ADDRLP4 248
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2267
;2266:
;2267:				saberent->s.loopSound = saberSpinSound;
ADDRLP4 248
INDIRP4
CNSTI4 200
ADDP4
ADDRGP4 saberSpinSound
INDIRI4
ASGNI4
line 2269
;2268:
;2269:				self->client->ps.saberDidThrowTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2271
;2270:
;2271:				self->client->dangerTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1748
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2272
;2272:				self->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 300
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 300
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 2273
;2273:				self->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 2275
;2274:
;2275:				trap_LinkEntity(saberent);
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2276
;2276:			}
ADDRGP4 $1042
JUMPV
LABELV $1045
line 2278
;2277:			else
;2278:			{
line 2279
;2279:				VectorCopy(boltOrigin, saberent->pos1);
ADDRLP4 248
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2280
;2280:				trap_LinkEntity(saberent);
ADDRLP4 248
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2281
;2281:			}
line 2282
;2282:		}
line 2283
;2283:	}
ADDRGP4 $1042
JUMPV
LABELV $1041
line 2284
;2284:	else if (!self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1053
line 2285
;2285:	{
line 2286
;2286:		gentity_t *saberent = &g_entities[self->client->ps.saberEntityNum];
ADDRLP4 248
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2288
;2287:
;2288:		if (saberent)
ADDRLP4 248
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1055
line 2289
;2289:		{
line 2290
;2290:			saberent->r.svFlags |= (SVF_NOCLIENT);
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2291
;2291:			saberent->r.contents = CONTENTS_LIGHTSABER;
ADDRLP4 248
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 262144
ASGNI4
line 2292
;2292:			VectorSet( saberent->r.mins, -8.0f, -8.0f, -8.0f );
ADDRLP4 248
INDIRP4
CNSTI4 316
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 320
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 324
ADDP4
CNSTF4 3238002688
ASGNF4
line 2293
;2293:			VectorSet( saberent->r.maxs, 8.0f, 8.0f, 8.0f );
ADDRLP4 248
INDIRP4
CNSTI4 328
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 332
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 336
ADDP4
CNSTF4 1090519040
ASGNF4
line 2294
;2294:			saberent->s.loopSound = 0;
ADDRLP4 248
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2295
;2295:		}
LABELV $1055
line 2297
;2296:
;2297:		if (self->client->ps.saberLockTime > level.time && self->client->ps.saberEntityNum)
ADDRLP4 252
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1057
ADDRLP4 252
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1057
line 2298
;2298:		{
line 2299
;2299:			if (self->client->ps.saberIdleWound < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $1060
line 2300
;2300:			{
line 2303
;2301:				gentity_t *te;
;2302:				vec3_t dir;
;2303:				te = G_TempEntity( g_entities[self->client->ps.saberEntityNum].r.currentOrigin, EV_SABER_BLOCK );
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRLP4 272
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 272
INDIRP4
ASGNP4
line 2304
;2304:				VectorSet( dir, 0, 1, 0 );
ADDRLP4 260
CNSTF4 0
ASGNF4
ADDRLP4 260+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 260+8
CNSTF4 0
ASGNF4
line 2305
;2305:				VectorCopy(g_entities[self->client->ps.saberEntityNum].r.currentOrigin, te->s.origin);
ADDRLP4 256
INDIRP4
CNSTI4 92
ADDP4
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+296+72
ADDP4
INDIRB
ASGNB 12
line 2306
;2306:				VectorCopy(dir, te->s.angles);
ADDRLP4 256
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 260
INDIRB
ASGNB 12
line 2307
;2307:				te->s.eventParm = 1;
ADDRLP4 256
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 2309
;2308:
;2309:				self->client->ps.saberIdleWound = level.time + Q_irand(400, 600);
CNSTI4 400
ARGI4
CNSTI4 600
ARGI4
ADDRLP4 276
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 736
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 276
INDIRI4
ADDI4
ASGNI4
line 2310
;2310:			}
LABELV $1060
line 2312
;2311:
;2312:			VectorCopy(boltOrigin, self->client->lastSaberBase);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2313
;2313:			VectorCopy(end, self->client->lastSaberTip);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1720
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 2314
;2314:			self->client->hasCurrentPosition = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
CNSTI4 1
ASGNI4
line 2316
;2315:
;2316:			self->client->ps.saberBlocked = BLOCKED_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2318
;2317:
;2318:			goto finalUpdate;
ADDRGP4 $1008
JUMPV
LABELV $1057
line 2321
;2319:		}
;2320:
;2321:		if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1070
line 2322
;2322:		{
line 2323
;2323:			self->client->ps.saberIdleWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 2324
;2324:			self->client->ps.saberAttackWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 0
ASGNI4
line 2325
;2325:		}
LABELV $1070
line 2327
;2326:
;2327:		if (self->client->hasCurrentPosition && g_saberInterpolate.integer)
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
INDIRI4
ADDRLP4 256
INDIRI4
EQI4 $1072
ADDRGP4 g_saberInterpolate+12
INDIRI4
ADDRLP4 256
INDIRI4
EQI4 $1072
line 2328
;2328:		{
line 2329
;2329:			if (!CheckSaberDamage(self, boltOrigin, end, qfalse))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ADDRGP4 CheckSaberDamage
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1073
line 2330
;2330:			{
line 2331
;2331:				CheckSaberDamage(self, boltOrigin, end, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 2332
;2332:			}
line 2333
;2333:		}
ADDRGP4 $1073
JUMPV
LABELV $1072
line 2335
;2334:		else
;2335:		{
line 2336
;2336:			CheckSaberDamage(self, boltOrigin, end, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 124
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 2337
;2337:		}
LABELV $1073
line 2339
;2338:
;2339:		if (self->client->ps.dualBlade)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1077
line 2340
;2340:		{
line 2343
;2341:			vec3_t otherOrg, otherEnd;
;2342:
;2343:			VectorMA( boltOrigin, -12, rawAngles, otherOrg );
ADDRLP4 284
CNSTF4 3242196992
ASGNF4
ADDRLP4 260
ADDRLP4 12
INDIRF4
ADDRLP4 284
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 284
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 260+8
ADDRLP4 12+8
INDIRF4
CNSTF4 3242196992
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2344
;2344:			VectorMA( otherOrg, -40, rawAngles, otherEnd );
ADDRLP4 288
CNSTF4 3256877056
ASGNF4
ADDRLP4 272
ADDRLP4 260
INDIRF4
ADDRLP4 288
INDIRF4
ADDRLP4 184
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272+4
ADDRLP4 260+4
INDIRF4
ADDRLP4 288
INDIRF4
ADDRLP4 184+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 272+8
ADDRLP4 260+8
INDIRF4
CNSTF4 3256877056
ADDRLP4 184+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2346
;2345:
;2346:			self->client->ps.saberIdleWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 2347
;2347:			self->client->ps.saberAttackWound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 0
ASGNI4
line 2349
;2348:
;2349:			CheckSaberDamage(self, otherOrg, otherEnd, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 272
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CheckSaberDamage
CALLI4
pop
line 2350
;2350:		}
LABELV $1077
line 2352
;2351:
;2352:		VectorCopy(boltOrigin, self->client->lastSaberBase);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1732
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2353
;2353:		VectorCopy(end, self->client->lastSaberTip);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1720
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 2354
;2354:		self->client->hasCurrentPosition = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1744
ADDP4
CNSTI4 1
ASGNI4
line 2356
;2355:
;2356:		self->client->ps.saberEntityState = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 2357
;2357:	}
LABELV $1053
LABELV $1042
LABELV $1008
line 2359
;2358:finalUpdate:
;2359:	if (self->client->ps.saberLockFrame)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1091
line 2360
;2360:	{
line 2361
;2361:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "model_root", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 248
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1093
ARGP4
ADDRLP4 252
ADDRLP4 248
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 252
INDIRI4
ARGI4
ADDRLP4 252
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 2362
;2362:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "upper_lumbar", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $234
ARGP4
ADDRLP4 260
ADDRLP4 256
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 260
INDIRI4
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 2363
;2363:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "Motion", self->client->ps.saberLockFrame, self->client->ps.saberLockFrame+1, BONE_ANIM_OVERRIDE_FREEZE|BONE_ANIM_BLEND, animSpeedScale, level.time, -1, 150);
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1096
ARGP4
ADDRLP4 268
ADDRLP4 264
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
ADDRLP4 268
INDIRI4
ARGI4
ADDRLP4 268
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 200
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 2364
;2364:		return;
ADDRGP4 $969
JUMPV
LABELV $1091
line 2367
;2365:	}
;2366:
;2367:	if (self->client->ps.legsAnimExecute != legsAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
ADDRLP4 120
INDIRI4
EQI4 $1098
line 2368
;2368:	{
line 2369
;2369:		float animSpeed = 50.0f / bgGlobalAnimations[legsAnim].frameLerp;
ADDRLP4 248
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2371
;2370:		int aFlags;
;2371:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 256
ADDRLP4 248
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 248
ADDRLP4 256
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 256
INDIRF4
ASGNF4
line 2373
;2372:
;2373:		if (bgGlobalAnimations[legsAnim].loopFrames != -1)
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1101
line 2374
;2374:		{
line 2375
;2375:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 252
CNSTI4 16
ASGNI4
line 2376
;2376:		}
ADDRGP4 $1102
JUMPV
LABELV $1101
line 2378
;2377:		else
;2378:		{
line 2379
;2379:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 252
CNSTI4 72
ASGNI4
line 2380
;2380:		}
LABELV $1102
line 2382
;2381:
;2382:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 252
ADDRLP4 252
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2384
;2383:
;2384:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "model_root", bgGlobalAnimations[legsAnim].firstFrame, bgGlobalAnimations[legsAnim].firstFrame+bgGlobalAnimations[legsAnim].numFrames, aFlags, animSpeedScale, level.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1093
ARGP4
ADDRLP4 260
CNSTI4 28
ADDRLP4 120
INDIRI4
MULI4
ASGNI4
ADDRLP4 264
ADDRLP4 260
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
ARGI4
ADDRLP4 264
INDIRI4
ADDRLP4 260
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 252
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 2385
;2385:		self->client->ps.legsAnimExecute = legsAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 120
INDIRI4
ASGNI4
line 2386
;2386:	}
LABELV $1098
line 2387
;2387:	if (self->client->ps.torsoAnimExecute != torsoAnim)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $1106
line 2388
;2388:	{
line 2390
;2389:		int initialFrame;
;2390:		int aFlags = 0;
ADDRLP4 248
CNSTI4 0
ASGNI4
line 2391
;2391:		float animSpeed = 0;
ADDRLP4 252
CNSTF4 0
ASGNF4
line 2393
;2392:
;2393:		f = torsoAnim;
ADDRLP4 136
ADDRLP4 92
INDIRI4
ASGNI4
line 2395
;2394:
;2395:		initialFrame = bgGlobalAnimations[f].firstFrame;
ADDRLP4 256
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
line 2408
;2396:	
;2397:		/*
;2398:		if (bgGlobalAnimations[f].numFrames > 20)
;2399:		{
;2400:			initialFrame += 6;
;2401:		}
;2402:		else if (bgGlobalAnimations[f].numFrames > 3)
;2403:		{ //HACK: Force it a couple frames into the animation so it doesn't lag behind the client visual position as much..
;2404:			initialFrame += 2;
;2405:		}
;2406:		*/
;2407:
;2408:		BG_SaberStartTransAnim(self->client->ps.fd.saberAnimLevel, f, &animSpeedScale);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_SaberStartTransAnim
CALLV
pop
line 2410
;2409:
;2410:		animSpeed = 50.0f / bgGlobalAnimations[f].frameLerp;
ADDRLP4 252
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2411
;2411:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 260
ADDRLP4 252
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 252
ADDRLP4 260
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 260
INDIRF4
ASGNF4
line 2413
;2412:
;2413:		if (bgGlobalAnimations[f].loopFrames != -1)
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1109
line 2414
;2414:		{
line 2415
;2415:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 248
CNSTI4 16
ASGNI4
line 2416
;2416:		}
ADDRGP4 $1110
JUMPV
LABELV $1109
line 2418
;2417:		else
;2418:		{
line 2419
;2419:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 248
CNSTI4 72
ASGNI4
line 2420
;2420:		}
LABELV $1110
line 2422
;2421:
;2422:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 248
ADDRLP4 248
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2424
;2423:
;2424:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "upper_lumbar", initialFrame, bgGlobalAnimations[f].firstFrame+bgGlobalAnimations[f].numFrames, aFlags, animSpeedScale, level.time, initialFrame, 150);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $234
ARGP4
ADDRLP4 264
ADDRLP4 256
INDIRI4
ASGNI4
ADDRLP4 264
INDIRI4
ARGI4
ADDRLP4 268
CNSTI4 28
ADDRLP4 136
INDIRI4
MULI4
ASGNI4
ADDRLP4 268
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ADDRLP4 268
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 248
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 264
INDIRI4
CVIF4 4
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 2426
;2425:
;2426:		self->client->ps.torsoAnimExecute = torsoAnim;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 2428
;2427:		
;2428:		setTorso = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 2429
;2429:	}
LABELV $1106
line 2431
;2430:
;2431:	if (!BG_FlippingAnim( self->client->ps.legsAnim ) &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 248
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 252
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 252
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 276
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 284
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $1114
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 288
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 292
CNSTI4 0
ASGNI4
ADDRLP4 288
INDIRI4
ADDRLP4 292
INDIRI4
NEI4 $1114
ADDRLP4 144
INDIRI4
ADDRLP4 292
INDIRI4
EQI4 $1114
line 2442
;2432:		!BG_FlippingAnim( self->client->ps.torsoAnim ) &&
;2433:		!BG_SpinningSaberAnim( self->client->ps.legsAnim ) &&
;2434:		!BG_SpinningSaberAnim( self->client->ps.torsoAnim ) &&
;2435:		!BG_InSpecialJump( self->client->ps.legsAnim ) &&
;2436:		!BG_InSpecialJump( self->client->ps.torsoAnim ) &&
;2437:		!BG_InRoll(&self->client->ps, self->client->ps.legsAnim) &&
;2438:		!BG_SaberInSpecial(self->client->ps.saberMove) &&
;2439:		!BG_SaberInSpecialAttack(self->client->ps.legsAnim) &&
;2440:		!BG_SaberInSpecialAttack(self->client->ps.torsoAnim) &&
;2441:		setTorso )
;2442:	{
line 2443
;2443:		float animSpeed = 50.0f / bgGlobalAnimations[torsoAnim].frameLerp;
ADDRLP4 296
CNSTF4 1112014848
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+12
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 2445
;2444:		int aFlags;
;2445:		animSpeedScale = (animSpeed *= animSpeedScale);
ADDRLP4 304
ADDRLP4 296
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 296
ADDRLP4 304
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 304
INDIRF4
ASGNF4
line 2447
;2446:
;2447:		if (bgGlobalAnimations[torsoAnim].loopFrames != -1)
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ADDRGP4 bgGlobalAnimations+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $1117
line 2448
;2448:		{
line 2449
;2449:			aFlags = BONE_ANIM_OVERRIDE_LOOP;
ADDRLP4 300
CNSTI4 16
ASGNI4
line 2450
;2450:		}
ADDRGP4 $1118
JUMPV
LABELV $1117
line 2452
;2451:		else
;2452:		{
line 2453
;2453:			aFlags = BONE_ANIM_OVERRIDE_FREEZE;
ADDRLP4 300
CNSTI4 72
ASGNI4
line 2454
;2454:		}
LABELV $1118
line 2456
;2455:
;2456:		aFlags |= BONE_ANIM_BLEND; //since client defaults to blend. Not sure if this will make much difference if any on client position, but it's here just for the sake of matching them.
ADDRLP4 300
ADDRLP4 300
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2458
;2457:
;2458:		trap_G2API_SetBoneAnim(self->client->ghoul2, 0, "Motion", bgGlobalAnimations[torsoAnim].firstFrame, bgGlobalAnimations[torsoAnim].firstFrame+bgGlobalAnimations[torsoAnim].numFrames, aFlags, animSpeedScale, level.time, -1, 150);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1716
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $1096
ARGP4
ADDRLP4 308
CNSTI4 28
ADDRLP4 92
INDIRI4
MULI4
ASGNI4
ADDRLP4 312
ADDRLP4 308
INDIRI4
ADDRGP4 bgGlobalAnimations
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
ARGI4
ADDRLP4 312
INDIRI4
ADDRLP4 308
INDIRI4
ADDRGP4 bgGlobalAnimations+4
ADDP4
INDIRI4
ADDI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 28
INDIRF4
ARGF4
ADDRGP4 level+32
INDIRI4
ARGI4
CNSTF4 3212836864
ARGF4
CNSTI4 150
ARGI4
ADDRGP4 trap_G2API_SetBoneAnim
CALLI4
pop
line 2459
;2459:	}
LABELV $1114
line 2460
;2460:}
LABELV $969
endproc WP_SaberPositionUpdate 316 40
export WP_MissileBlockForBlock
proc WP_MissileBlockForBlock 4 0
line 2463
;2461:
;2462:int WP_MissileBlockForBlock( int saberBlock )
;2463:{
line 2464
;2464:	switch( saberBlock )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1123
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $1123
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1130-12
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1130
address $1125
address $1126
address $1127
address $1128
address $1129
code
line 2465
;2465:	{
LABELV $1125
line 2467
;2466:	case BLOCKED_UPPER_RIGHT:
;2467:		return BLOCKED_UPPER_RIGHT_PROJ;
CNSTI4 8
RETI4
ADDRGP4 $1122
JUMPV
line 2468
;2468:		break;
LABELV $1126
line 2470
;2469:	case BLOCKED_UPPER_LEFT:
;2470:		return BLOCKED_UPPER_LEFT_PROJ;
CNSTI4 9
RETI4
ADDRGP4 $1122
JUMPV
line 2471
;2471:		break;
LABELV $1127
line 2473
;2472:	case BLOCKED_LOWER_RIGHT:
;2473:		return BLOCKED_LOWER_RIGHT_PROJ;
CNSTI4 10
RETI4
ADDRGP4 $1122
JUMPV
line 2474
;2474:		break;
LABELV $1128
line 2476
;2475:	case BLOCKED_LOWER_LEFT:
;2476:		return BLOCKED_LOWER_LEFT_PROJ;
CNSTI4 11
RETI4
ADDRGP4 $1122
JUMPV
line 2477
;2477:		break;
LABELV $1129
line 2479
;2478:	case BLOCKED_TOP:
;2479:		return BLOCKED_TOP_PROJ;
CNSTI4 12
RETI4
ADDRGP4 $1122
JUMPV
line 2480
;2480:		break;
LABELV $1123
line 2482
;2481:	}
;2482:	return saberBlock;
ADDRFP4 0
INDIRI4
RETI4
LABELV $1122
endproc WP_MissileBlockForBlock 4 0
lit
align 4
LABELV $1133
byte 4 0
byte 4 0
byte 4 0
export WP_SaberBlockNonRandom
code
proc WP_SaberBlockNonRandom 72 16
line 2486
;2483:}
;2484:
;2485:void WP_SaberBlockNonRandom( gentity_t *self, vec3_t hitloc, qboolean missileBlock )
;2486:{
line 2487
;2487:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 36
ADDRGP4 $1133
INDIRB
ASGNB 12
line 2492
;2488:	vec3_t clEye;
;2489:	float rightdot;
;2490:	float zdiff;
;2491:
;2492:	VectorCopy(self->client->ps.origin, clEye);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2493
;2493:	clEye[2] += self->client->ps.viewheight;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2495
;2494:
;2495:	VectorSubtract( hitloc, clEye, diff );
ADDRLP4 56
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 56
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2496
;2496:	diff[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 2497
;2497:	VectorNormalize( diff );
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2499
;2498:
;2499:	fwdangles[1] = self->client->ps.viewangles[1];
ADDRLP4 36+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2501
;2500:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;2501:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 36
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2503
;2502:
;2503:	rightdot = DotProduct(right, diff);
ADDRLP4 52
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 24+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2504
;2504:	zdiff = hitloc[2] - clEye[2];
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 2507
;2505:	
;2506:	//FIXME: take torsoAngles into account?
;2507:	if ( zdiff > 0 )//40 )
ADDRLP4 48
INDIRF4
CNSTF4 0
LEF4 $1146
line 2508
;2508:	{
line 2509
;2509:		if ( rightdot > 0.3 )
ADDRLP4 52
INDIRF4
CNSTF4 1050253722
LEF4 $1148
line 2510
;2510:		{
line 2511
;2511:			self->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2512
;2512:		}
ADDRGP4 $1147
JUMPV
LABELV $1148
line 2513
;2513:		else if ( rightdot < -0.3 )
ADDRLP4 52
INDIRF4
CNSTF4 3197737370
GEF4 $1150
line 2514
;2514:		{
line 2515
;2515:			self->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 2516
;2516:		}
ADDRGP4 $1147
JUMPV
LABELV $1150
line 2518
;2517:		else
;2518:		{
line 2519
;2519:			self->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 2520
;2520:		}
line 2521
;2521:	}
ADDRGP4 $1147
JUMPV
LABELV $1146
line 2522
;2522:	else if ( zdiff > -20 )//20 )
ADDRLP4 48
INDIRF4
CNSTF4 3248488448
LEF4 $1152
line 2523
;2523:	{
line 2524
;2524:		if ( zdiff < -10 )//30 )
ADDRLP4 48
INDIRF4
CNSTF4 3240099840
GEF4 $1154
line 2525
;2525:		{//hmm, pretty low, but not low enough to use the low block, so we need to duck
line 2527
;2526:			//NPC should duck, but NPC should never get here
;2527:		}
LABELV $1154
line 2528
;2528:		if ( rightdot > 0.1 )
ADDRLP4 52
INDIRF4
CNSTF4 1036831949
LEF4 $1156
line 2529
;2529:		{
line 2530
;2530:			self->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2531
;2531:		}
ADDRGP4 $1153
JUMPV
LABELV $1156
line 2532
;2532:		else if ( rightdot < -0.1 )
ADDRLP4 52
INDIRF4
CNSTF4 3184315597
GEF4 $1158
line 2533
;2533:		{
line 2534
;2534:			self->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 2535
;2535:		}
ADDRGP4 $1153
JUMPV
LABELV $1158
line 2537
;2536:		else
;2537:		{//FIXME: this looks really weird if the shot is too low!
line 2538
;2538:			self->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 2539
;2539:		}
line 2540
;2540:	}
ADDRGP4 $1153
JUMPV
LABELV $1152
line 2542
;2541:	else
;2542:	{
line 2543
;2543:		if ( rightdot >= 0 )
ADDRLP4 52
INDIRF4
CNSTF4 0
LTF4 $1160
line 2544
;2544:		{
line 2545
;2545:			self->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 2546
;2546:		}
ADDRGP4 $1161
JUMPV
LABELV $1160
line 2548
;2547:		else
;2548:		{
line 2549
;2549:			self->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 2550
;2550:		}
LABELV $1161
line 2551
;2551:	}
LABELV $1153
LABELV $1147
line 2580
;2552:
;2553:	/*
;2554:	if ( !self->s.number )
;2555:	{
;2556:		gi.Printf( "EyeZ: %4.2f  HitZ: %4.2f  zdiff: %4.2f  rdot: %4.2f\n", self->client->renderInfo.eyePoint[2], hitloc[2], zdiff, rightdot );
;2557:		switch ( self->client->ps.saberBlocked )
;2558:		{
;2559:		case BLOCKED_TOP:
;2560:			gi.Printf( "BLOCKED_TOP\n" );
;2561:			break;
;2562:		case BLOCKED_UPPER_RIGHT:
;2563:			gi.Printf( "BLOCKED_UPPER_RIGHT\n" );
;2564:			break;
;2565:		case BLOCKED_UPPER_LEFT:
;2566:			gi.Printf( "BLOCKED_UPPER_LEFT\n" );
;2567:			break;
;2568:		case BLOCKED_LOWER_RIGHT:
;2569:			gi.Printf( "BLOCKED_LOWER_RIGHT\n" );
;2570:			break;
;2571:		case BLOCKED_LOWER_LEFT:
;2572:			gi.Printf( "BLOCKED_LOWER_LEFT\n" );
;2573:			break;
;2574:		default:
;2575:			break;
;2576:		}
;2577:	}
;2578:	*/
;2579:
;2580:	if ( missileBlock )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1162
line 2581
;2581:	{
line 2582
;2582:		self->client->ps.saberBlocked = WP_MissileBlockForBlock( self->client->ps.saberBlocked );
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 WP_MissileBlockForBlock
CALLI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ASGNI4
line 2587
;2583:		//if ( !self->s.number )
;2584:		//{
;2585:			//G_DynaMixEvent( DM_BLOCK );
;2586:		//}
;2587:	}
LABELV $1162
line 2589
;2588:	else
;2589:	{
line 2594
;2590:		//if ( !self->s.number )
;2591:		//{
;2592:			//G_DynaMixEvent( DM_PARRY );
;2593:		//}
;2594:	}
LABELV $1163
line 2595
;2595:}
LABELV $1132
endproc WP_SaberBlockNonRandom 72 16
lit
align 4
LABELV $1165
byte 4 0
byte 4 0
byte 4 0
export WP_SaberBlock
code
proc WP_SaberBlock 80 16
line 2598
;2596:
;2597:void WP_SaberBlock( gentity_t *playerent, vec3_t hitloc, qboolean missileBlock )
;2598:{
line 2600
;2599:	//gentity_t *playerent;
;2600:	vec3_t diff, fwdangles={0,0,0}, right;
ADDRLP4 24
ADDRGP4 $1165
INDIRB
ASGNB 12
line 2620
;2601:	float rightdot;
;2602:	float zdiff;
;2603:
;2604:	/*
;2605:	if (saber && saber->owner)
;2606:	{
;2607:		playerent = saber->owner;
;2608:		if (!playerent->client)
;2609:		{
;2610:			return;
;2611:		}
;2612:	}
;2613:	else
;2614:	{	// Bad entity passed.
;2615:		return;
;2616:	}
;2617:	*/
;2618:	//I don't see what the point of this was anyway, saber isn't used anywhere in the function.
;2619:
;2620:	VectorSubtract(hitloc, playerent->client->ps.origin, diff);
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2621
;2621:	VectorNormalize(diff);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2623
;2622:
;2623:	fwdangles[1] = playerent->client->ps.viewangles[1];
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 2625
;2624:	// Ultimately we might care if the shot was ahead or behind, but for now, just quadrant is fine.
;2625:	AngleVectors( fwdangles, NULL, right, NULL );
ADDRLP4 24
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2627
;2626:
;2627:	rightdot = DotProduct(right, diff) + RandFloat(-0.2f,0.2f);
CNSTF4 3192704205
ARGF4
CNSTF4 1045220557
ARGF4
ADDRLP4 56
ADDRGP4 RandFloat
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ADDRLP4 56
INDIRF4
ADDF4
ASGNF4
line 2628
;2628:	zdiff = hitloc[2] - playerent->client->ps.origin[2] + Q_irand(-8,8);
CNSTI4 -8
ARGI4
ADDRLP4 60
CNSTI4 8
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 36
ADDRFP4 4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ADDRLP4 64
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2631
;2629:	
;2630:	// Figure out what quadrant the block was in.
;2631:	if (zdiff > 24)
ADDRLP4 36
INDIRF4
CNSTF4 1103101952
LEF4 $1173
line 2632
;2632:	{	// Attack from above
line 2633
;2633:		if (Q_irand(0,1))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1175
line 2634
;2634:		{
line 2635
;2635:			playerent->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 2636
;2636:		}
ADDRGP4 $1174
JUMPV
LABELV $1175
line 2638
;2637:		else
;2638:		{
line 2639
;2639:			playerent->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 2640
;2640:		}
line 2641
;2641:	}
ADDRGP4 $1174
JUMPV
LABELV $1173
line 2642
;2642:	else if (zdiff > 13)
ADDRLP4 36
INDIRF4
CNSTF4 1095761920
LEF4 $1177
line 2643
;2643:	{	// The upper half has three viable blocks...
line 2644
;2644:		if (rightdot > 0.25)
ADDRLP4 40
INDIRF4
CNSTF4 1048576000
LEF4 $1179
line 2645
;2645:		{	// In the right quadrant...
line 2646
;2646:			if (Q_irand(0,1))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1181
line 2647
;2647:			{
line 2648
;2648:				playerent->client->ps.saberBlocked = BLOCKED_UPPER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 4
ASGNI4
line 2649
;2649:			}
ADDRGP4 $1178
JUMPV
LABELV $1181
line 2651
;2650:			else
;2651:			{
line 2652
;2652:				playerent->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 2653
;2653:			}
line 2654
;2654:		}
ADDRGP4 $1178
JUMPV
LABELV $1179
line 2656
;2655:		else
;2656:		{
line 2657
;2657:			switch(Q_irand(0,3))
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 72
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LTI4 $1178
ADDRLP4 68
INDIRI4
CNSTI4 3
GTI4 $1178
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1189
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $1189
address $1186
address $1187
address $1187
address $1188
code
line 2658
;2658:			{
LABELV $1186
line 2660
;2659:			case 0:
;2660:				playerent->client->ps.saberBlocked = BLOCKED_UPPER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 3
ASGNI4
line 2661
;2661:				break;
ADDRGP4 $1178
JUMPV
LABELV $1187
line 2664
;2662:			case 1:
;2663:			case 2:
;2664:				playerent->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 2665
;2665:				break;
ADDRGP4 $1178
JUMPV
LABELV $1188
line 2667
;2666:			case 3:
;2667:				playerent->client->ps.saberBlocked = BLOCKED_TOP;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 7
ASGNI4
line 2668
;2668:				break;
line 2670
;2669:			}
;2670:		}
line 2671
;2671:	}
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2673
;2672:	else
;2673:	{	// The lower half is a bit iffy as far as block coverage.  Pick one of the "low" ones at random.
line 2674
;2674:		if (Q_irand(0,1))
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $1190
line 2675
;2675:		{
line 2676
;2676:			playerent->client->ps.saberBlocked = BLOCKED_LOWER_RIGHT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 5
ASGNI4
line 2677
;2677:		}
ADDRGP4 $1191
JUMPV
LABELV $1190
line 2679
;2678:		else
;2679:		{
line 2680
;2680:			playerent->client->ps.saberBlocked = BLOCKED_LOWER_LEFT;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 6
ASGNI4
line 2681
;2681:		}
LABELV $1191
line 2682
;2682:	}
LABELV $1178
LABELV $1174
line 2684
;2683:
;2684:	if ( missileBlock )
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1192
line 2685
;2685:	{
line 2686
;2686:		playerent->client->ps.saberBlocked = WP_MissileBlockForBlock( playerent->client->ps.saberBlocked );
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 WP_MissileBlockForBlock
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
ADDRLP4 72
INDIRI4
ASGNI4
line 2687
;2687:	}
LABELV $1192
line 2688
;2688:}
LABELV $1164
endproc WP_SaberBlock 80 16
export WP_SaberCanBlock
proc WP_SaberCanBlock 64 16
line 2691
;2689:
;2690:int WP_SaberCanBlock(gentity_t *self, vec3_t point, int dflags, int mod, qboolean projectile, int attackStr)
;2691:{
line 2692
;2692:	qboolean thrownSaber = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2693
;2693:	float blockFactor = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 2695
;2694:
;2695:	if (!self || !self->client || !point)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1198
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1198
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
NEU4 $1195
LABELV $1198
line 2696
;2696:	{
line 2697
;2697:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1195
line 2700
;2698:	}
;2699:
;2700:	if (attackStr == 8)
ADDRFP4 20
INDIRI4
CNSTI4 8
NEI4 $1199
line 2701
;2701:	{
line 2702
;2702:		attackStr = 0;
ADDRFP4 20
CNSTI4 0
ASGNI4
line 2703
;2703:		thrownSaber = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2704
;2704:	}
LABELV $1199
line 2706
;2705:
;2706:	if (BG_SaberInAttack(self->client->ps.saberMove))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $1201
line 2707
;2707:	{
line 2708
;2708:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1201
line 2711
;2709:	}
;2710:
;2711:	if (PM_InSaberAnim(self->client->ps.torsoAnim) && !self->client->ps.saberBlocked &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 PM_InSaberAnim
CALLI4
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1203
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $1203
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $1203
ADDRLP4 32
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $1203
line 2713
;2712:		self->client->ps.saberMove != LS_READY && self->client->ps.saberMove != LS_NONE)
;2713:	{
line 2714
;2714:		if ( self->client->ps.saberMove < LS_PARRY_UP || self->client->ps.saberMove > LS_REFLECT_LL )
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 108
LTI4 $1207
ADDRLP4 36
INDIRI4
CNSTI4 117
LEI4 $1205
LABELV $1207
line 2715
;2715:		{
line 2716
;2716:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1205
line 2718
;2717:		}
;2718:	}
LABELV $1203
line 2720
;2719:
;2720:	if (self->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1208
line 2721
;2721:	{
line 2722
;2722:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1208
line 2725
;2723:	}
;2724:
;2725:	if (self->client->ps.usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1210
line 2726
;2726:	{
line 2727
;2727:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1210
line 2730
;2728:	}
;2729:
;2730:	if (self->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1212
line 2731
;2731:	{
line 2732
;2732:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1212
line 2735
;2733:	}
;2734:
;2735:	if (self->client->ps.weaponstate == WEAPON_RAISING)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1214
line 2736
;2736:	{
line 2737
;2737:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1214
line 2740
;2738:	}
;2739:
;2740:	if (self->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1216
line 2741
;2741:	{
line 2742
;2742:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1216
line 2745
;2743:	}
;2744:
;2745:	if ((self->client->pers.cmd.buttons & BUTTON_ATTACK)/* &&
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1388
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1218
line 2747
;2746:		(projectile || attackStr == FORCE_LEVEL_3)*/)
;2747:	{ //don't block when the player is trying to slash, if it's a projectile or he's doing a very strong attack
line 2748
;2748:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1218
line 2751
;2749:	}
;2750:
;2751:	if (attackStr == FORCE_LEVEL_3)
ADDRFP4 20
INDIRI4
CNSTI4 3
NEI4 $1220
line 2752
;2752:	{
line 2753
;2753:		if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1222
line 2754
;2754:		{
line 2755
;2755:			if (Q_irand(1, 10) < 3)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 3
GEI4 $1223
line 2756
;2756:			{
line 2757
;2757:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
line 2759
;2758:			}
;2759:		}
LABELV $1222
line 2761
;2760:		else
;2761:		{
line 2762
;2762:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1223
line 2764
;2763:		}
;2764:	}
LABELV $1220
line 2766
;2765:
;2766:	if (attackStr == FORCE_LEVEL_2 && Q_irand(1, 10) < 3)
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $1226
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 36
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 3
GEI4 $1226
line 2767
;2767:	{
line 2768
;2768:		if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
LTI4 $1228
line 2769
;2769:		{
line 2771
;2770:			//do nothing for now
;2771:		}
ADDRGP4 $1229
JUMPV
LABELV $1228
line 2772
;2772:		else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] >= FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
LTI4 $1230
line 2773
;2773:		{
line 2774
;2774:			if (Q_irand(1, 10) < 5)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 40
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 5
GEI4 $1231
line 2775
;2775:			{
line 2776
;2776:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
line 2778
;2777:			}
;2778:		}
LABELV $1230
line 2780
;2779:		else
;2780:		{
line 2781
;2781:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1231
LABELV $1229
line 2783
;2782:		}
;2783:	}
LABELV $1226
line 2785
;2784:	
;2785:	if (attackStr == FORCE_LEVEL_1 && !self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] &&
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRFP4 20
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $1234
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1234
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 44
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 3
GEI4 $1234
line 2787
;2786:		Q_irand(1, 40) < 3)
;2787:	{ //if I have no defense level at all then I might be unable to block a level 1 attack (but very rarely)
line 2788
;2788:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1234
line 2791
;2789:	}
;2790:
;2791:	if (SaberAttacking(self))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 SaberAttacking
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $1236
line 2792
;2792:	{ //attacking, can't block now
line 2795
;2793:
;2794:		//FIXME: Do a "saber box" check here to see if the enemy saber hit this guy's saber
;2795:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1236
line 2798
;2796:	}
;2797:
;2798:	if (self->client->ps.saberMove != LS_READY &&
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1238
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1238
line 2800
;2799:		!self->client->ps.saberBlocking)
;2800:	{
line 2801
;2801:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1238
line 2804
;2802:	}
;2803:
;2804:	if (self->client->ps.saberBlockTime >= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1240
line 2805
;2805:	{
line 2806
;2806:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1240
line 2809
;2807:	}
;2808:
;2809:	if (self->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1243
line 2810
;2810:	{
line 2811
;2811:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1243
line 2814
;2812:	}
;2813:
;2814:	if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_3)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1245
line 2815
;2815:	{
line 2816
;2816:		blockFactor = 0.05f;
ADDRLP4 0
CNSTF4 1028443341
ASGNF4
line 2817
;2817:	}
ADDRGP4 $1246
JUMPV
LABELV $1245
line 2818
;2818:	else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1247
line 2819
;2819:	{
line 2820
;2820:		blockFactor = 0.6f;
ADDRLP4 0
CNSTF4 1058642330
ASGNF4
line 2821
;2821:	}
ADDRGP4 $1248
JUMPV
LABELV $1247
line 2822
;2822:	else if (self->client->ps.fd.forcePowerLevel[FP_SABERDEFEND] == FORCE_LEVEL_1)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 996
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1249
line 2823
;2823:	{
line 2824
;2824:		blockFactor = 0.9f;
ADDRLP4 0
CNSTF4 1063675494
ASGNF4
line 2825
;2825:	}
ADDRGP4 $1250
JUMPV
LABELV $1249
line 2827
;2826:	else
;2827:	{ //for now we just don't get to autoblock with no def
line 2828
;2828:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1250
LABELV $1248
LABELV $1246
line 2831
;2829:	}
;2830:
;2831:	if (thrownSaber)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1251
line 2832
;2832:	{
line 2833
;2833:		blockFactor -= 0.25f;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 2834
;2834:	}
LABELV $1251
line 2836
;2835:
;2836:	if (!InFront( point, self->client->ps.origin, self->client->ps.viewangles, blockFactor )) //orig 0.2f
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 InFront
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $1253
line 2837
;2837:	{
line 2838
;2838:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1194
JUMPV
LABELV $1253
line 2841
;2839:	}
;2840:
;2841:	WP_SaberBlockNonRandom(self, point, projectile);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 WP_SaberBlockNonRandom
CALLV
pop
line 2842
;2842:	return 1;
CNSTI4 1
RETI4
LABELV $1194
endproc WP_SaberCanBlock 64 16
export HasSetSaberOnly
proc HasSetSaberOnly 16 0
line 2846
;2843:}
;2844:
;2845:qboolean HasSetSaberOnly(void)
;2846:{
line 2847
;2847:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2848
;2848:	int wDisable = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2850
;2849:
;2850:	if (g_gametype.integer == GT_JEDIMASTER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $1256
line 2851
;2851:	{ //set to 0 
line 2852
;2852:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1255
JUMPV
LABELV $1256
line 2855
;2853:	}
;2854:
;2855:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1259
line 2856
;2856:	{
line 2857
;2857:		wDisable = g_duelWeaponDisable.integer;
ADDRLP4 4
ADDRGP4 g_duelWeaponDisable+12
INDIRI4
ASGNI4
line 2858
;2858:	}
ADDRGP4 $1265
JUMPV
LABELV $1259
line 2860
;2859:	else
;2860:	{
line 2861
;2861:		wDisable = g_weaponDisable.integer;
ADDRLP4 4
ADDRGP4 g_weaponDisable+12
INDIRI4
ASGNI4
line 2862
;2862:	}
ADDRGP4 $1265
JUMPV
LABELV $1264
line 2865
;2863:
;2864:	while (i < WP_NUM_WEAPONS)
;2865:	{
line 2866
;2866:		if (!(wDisable & (1 << i)) &&
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
ADDRLP4 12
INDIRI4
NEI4 $1267
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $1267
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1267
line 2868
;2867:			i != WP_SABER && i != WP_NONE)
;2868:		{
line 2869
;2869:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1255
JUMPV
LABELV $1267
line 2872
;2870:		}
;2871:
;2872:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2873
;2873:	}
LABELV $1265
line 2864
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $1264
line 2875
;2874:
;2875:	return qtrue;
CNSTI4 1
RETI4
LABELV $1255
endproc HasSetSaberOnly 16 0
import InFront
import botstates
import floattime
import gLevelFlags
import nodenum
import nodetable
import gLastPrintedIndex
import gWPNum
import gWPArray
import gWPRenderedFrame
import gBotEdit
import gDeactivated
import gWPRenderTime
import gBotChatBuffer
import eFlagBlue
import eFlagRed
import oFlagBlue
import flagBlue
import oFlagRed
import flagRed
import bot_wp_visconnect
import bot_wp_distconnect
import bot_wp_clearweight
import bot_wp_edit
import bot_wp_info
import bot_camp
import bot_attachments
import bot_forgimmick
import bot_forcepowers
import ConcatArgs
import GetBestIdleGoal
import GetNearestVisibleWP
import BotIsAChickenWuss
import OrgVisibleBox
import BotWaypointRender
import StandardBotAI
import BotDoChat
import BotUtilizePersonality
import NumBots
import BotResetState
import B_Free
import B_Alloc
import B_TempFree
import B_TempAlloc
import forceJumpStrength
import forceJumpHeight
import g_MaxHolocronCarry
import PM_SetSaberMove
import PM_WeaponLightsaber
import PM_SetAnim
import PM_FinishWeaponChange
import PM_BeginWeaponChange
import PM_ForceLegsAnim
import PM_ContinueLegsAnim
import PM_StartTorsoAnim
import BG_CycleInven
import PM_StepSlideMove
import PM_SlideMove
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import PM_SaberJumpAttackMove
import PM_SaberFlipOverAttackMove
import PM_SomeoneInFront
import PM_GroundDistance
import PM_GetSaberStance
import PM_AnimLength
import PM_InRollComplete
import PM_InOnGroundAnim
import PM_SpinningAnim
import PM_LandingAnim
import PM_JumpingAnim
import PM_PainAnim
import PM_InKnockDown
import PM_InSaberAnim
import PM_SaberInStart
import PM_SaberInReflect
import PM_SaberInParry
import forcePowerNeeded
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import trap_ROFF_Purge_Ent
import trap_ROFF_Play
import trap_ROFF_Cache
import trap_ROFF_UpdateEntities
import trap_ROFF_Clean
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_ForcePower
import trap_EA_Alt_Attack
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_timeouttospec
import g_forceDodge
import g_dismember
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_debugUp
import g_debugRight
import g_debugForward
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_adaptRespawn
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlySaber
import g_friendlyFire
import g_saberInterpolate
import g_capturelimit
import g_timelimit
import g_duel_fraglimit
import g_fraglimit
import g_duelWeaponDisable
import g_weaponDisable
import g_forcePowerDisable
import g_spawnInvulnerability
import g_forceRegenTime
import g_saberLocking
import g_privateDuel
import g_forceBasedTeams
import g_maxForceRank
import g_dmflags
import g_autoMapCycle
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectSagaSpawnPoint
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import B_CleanupAlloc
import B_InitAlloc
import InFieldOfVision
import BotOrder
import OrgVisible
import InitSagaMode
import G_ClearClientLog
import G_LogExit
import G_LogWeaponOutput
import G_LogWeaponInit
import G_LogWeaponItem
import G_LogWeaponPowerup
import G_LogWeaponFrag
import G_LogWeaponDeath
import G_LogWeaponKill
import G_LogWeaponDamage
import G_LogWeaponFire
import G_LogWeaponPickup
import Jedi_DodgeEvasion
import ForceTelepathy
import ForceThrow
import ForceSeeing
import ForceTeamForceReplenish
import ForceTeamHeal
import ForceAbsorb
import ForceProtect
import ForceGrip
import ForceRage
import ForceSpeed
import ForceHeal
import ForcePowerUsableOn
import WP_ForcePowersUpdate
import WP_SpawnInitForcePowers
import WP_InitForcePowers
import WP_ForcePowerStop
import G_PreDefSound
import G_RefreshNextMap
import G_DoesMapSupportGametype
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_GetStripEdString
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import g_ff_objectives
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import BlowDetpacks
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import gJMSaberEnt
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import WP_FireGenericBlasterMissile
import WP_FireTurretMissile
import G_PlayerBecomeATST
import ATST_ManageDamageBoxes
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import WP_FireBlasterMissile
import G_ExplodeMissile
import G_BounceProjectile
import CreateMissile
import G_RunMissile
import G_ReflectMissile
import ExplodeDeath
import TossClientCubes
import TossClientItems
import TossClientWeapon
import body_die
import G_RadiusDamage
import G_Damage
import CanDamage
import trap_G2API_SetBoneAnim
import trap_G2API_GetGLAName
import trap_G2API_SetBoneAngles
import trap_G2API_CleanGhoul2Models
import trap_G2API_RemoveGhoul2Model
import trap_G2API_HasGhoul2ModelOnIndex
import trap_G2API_DuplicateGhoul2Instance
import trap_G2API_CopySpecificGhoul2Model
import trap_G2API_CopyGhoul2Instance
import trap_G2API_SetBoltInfo
import trap_G2API_AddBolt
import trap_G2API_InitGhoul2Model
import trap_G2API_GetBoltMatrix_NoReconstruct
import trap_G2API_GetBoltMatrix
import trap_G2_HaveWeGhoul2Models
import trap_G2_SetGhoul2ModelIndexes
import trap_G2_ListModelBones
import trap_G2_ListModelSurfaces
import G_SkinIndex
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vtos
import tv
import G_RunObject
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_KillG2Queue
import G_SendG2KillQueue
import TryUse
import G_EntitySound
import G_SoundAtLoc
import G_Sound
import G_MuteSound
import G_ScreenShake
import G_PlayEffect
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetAngles
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_RadiusList
import G_Find
import G_KillBox
import G_TeamCommand
import G_EffectIndex
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import ItemUse_MedPack
import ItemUse_Seeker
import ItemUse_Sentry
import ItemUse_Shield
import ItemUse_Binoculars
import G_GetDuelWinner
import Cmd_EngageDuel_f
import Cmd_ToggleSaber_f
import G_ItemUsable
import Cmd_SaberAttackCycle_f
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import g2SaberInstance
import precachedKyle
import forcePowerDarkLight
import WeaponAttackAnim
import WeaponReadyAnim
import BG_OutOfMemory
import BG_StringAlloc
import BG_TempFree
import BG_TempAlloc
import BG_AllocUnaligned
import BG_Alloc
import BG_CanUseFPNow
import BG_HasYsalamiri
import BG_GetItemIndexByTag
import BG_ParseAnimationFile
import BG_PlayerTouchesItem
import BG_G2PlayerAngles
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_ForcePowerDrain
import BG_SaberStartTransAnim
import BG_InDeathAnim
import BG_InRoll
import BG_SaberInSpecialAttack
import BG_SpinningSaberAnim
import BG_FlippingAnim
import BG_SaberInIdle
import BG_SaberInSpecial
import BG_SaberInAttack
import BG_DirectFlippingAnim
import BG_InSaberStandAnim
import BG_InSpecialJump
import BG_LegalizedForcePowers
import saberMoveData
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import vectoyaw
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import pm
import bgForcePowerCost
import forceMasteryPoints
import forceMasteryLevels
import bgGlobalAnimations
import BGPAFtextLoaded
import forcePowerSorted
import WP_MuzzlePoint
import ammoData
import weaponData
import GetStringForID
import GetIDForString
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import powf
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import forceSpeedLevels
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $1096
char 1 77
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $1093
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 95
char 1 114
char 1 111
char 1 111
char 1 116
char 1 0
align 1
LABELV $844
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 115
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 50
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 95
char 1 119
char 1 46
char 1 103
char 1 108
char 1 109
char 1 0
align 1
LABELV $840
char 1 100
char 1 101
char 1 97
char 1 100
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
align 1
LABELV $238
char 1 116
char 1 104
char 1 111
char 1 114
char 1 97
char 1 99
char 1 105
char 1 99
char 1 0
align 1
LABELV $236
char 1 108
char 1 111
char 1 119
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $234
char 1 117
char 1 112
char 1 112
char 1 101
char 1 114
char 1 95
char 1 108
char 1 117
char 1 109
char 1 98
char 1 97
char 1 114
char 1 0
align 1
LABELV $126
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 104
char 1 117
char 1 109
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $125
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $124
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 111
char 1 102
char 1 102
char 1 113
char 1 117
char 1 105
char 1 99
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $123
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 47
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 115
char 1 112
char 1 105
char 1 110
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $121
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 0
