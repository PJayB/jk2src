export P_SetTwitchInfo
code
proc P_SetTwitchInfo 4 0
file "../g_active.c"
line 7
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:void P_SetTwitchInfo(gclient_t	*client)
;7:{
line 8
;8:	client->ps.painTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 9
;9:	client->ps.painDirection ^= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 10
;10:}
LABELV $78
endproc P_SetTwitchInfo 4 0
export P_DamageFeedback
proc P_DamageFeedback 48 12
line 22
;11:
;12:/*
;13:===============
;14:G_DamageFeedback
;15:
;16:Called just before a snapshot is sent to the given player.
;17:Totals up all damage and generates both the player_state_t
;18:damage values to that client for pain blends and kicks, and
;19:global pain sound events for all clients.
;20:===============
;21:*/
;22:void P_DamageFeedback( gentity_t *player ) {
line 27
;23:	gclient_t	*client;
;24:	float	count;
;25:	vec3_t	angles;
;26:
;27:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 28
;28:	if ( client->ps.pm_type == PM_DEAD ) {
ADDRLP4 20
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $81
line 29
;29:		return;
ADDRGP4 $80
JUMPV
LABELV $81
line 33
;30:	}
;31:
;32:	// total points of damage shot at the player this frame
;33:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1608
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 34
;34:	if ( count == 0 ) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $83
line 35
;35:		return;		// didn't take any damage
ADDRGP4 $80
JUMPV
LABELV $83
line 38
;36:	}
;37:
;38:	if ( count > 255 ) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $85
line 39
;39:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 40
;40:	}
LABELV $85
line 46
;41:
;42:	// send the information to the client
;43:
;44:	// world damage (falling, slime, etc) uses a special code
;45:	// to make the blend blob centered instead of positional
;46:	if ( client->damage_fromWorld ) {
ADDRLP4 0
INDIRP4
CNSTI4 1632
ADDP4
INDIRI4
CNSTI4 0
EQI4 $87
line 47
;47:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 255
ASGNI4
line 48
;48:		client->ps.damageYaw = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 50
;49:
;50:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1632
ADDP4
CNSTI4 0
ASGNI4
line 51
;51:	} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 52
;52:		vectoangles( client->damage_from, angles );
ADDRLP4 0
INDIRP4
CNSTI4 1620
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 53
;53:		client->ps.damagePitch = angles[PITCH]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 1132462080
ADDRLP4 8
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 54
;54:		client->ps.damageYaw = angles[YAW]/360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 1132462080
ADDRLP4 8+4
INDIRF4
CNSTF4 1135869952
DIVF4
MULF4
CVFI4 4
ASGNI4
line 55
;55:	}
LABELV $88
line 58
;56:
;57:	// play an apropriate pain sound
;58:	if ( (level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE) ) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
LEI4 $90
ADDRLP4 28
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $90
line 61
;59:
;60:		// don't do more than two pain sounds a second
;61:		if ( level.time - client->ps.painTime < 500 ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $93
line 62
;62:			return;
ADDRGP4 $80
JUMPV
LABELV $93
line 64
;63:		}
;64:		P_SetTwitchInfo(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 P_SetTwitchInfo
CALLV
pop
line 65
;65:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 66
;66:		G_AddEvent( player, EV_PAIN, player->health );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 77
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 67
;67:		client->ps.damageEvent++;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 69
;68:
;69:		if (client->damage_armor && !client->damage_blood)
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1608
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $97
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $97
line 70
;70:		{
line 71
;71:			client->ps.damageType = 1; //pure shields
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 1
ASGNI4
line 72
;72:		}
ADDRGP4 $98
JUMPV
LABELV $97
line 73
;73:		else if (client->damage_armor)
ADDRLP4 0
INDIRP4
CNSTI4 1608
ADDP4
INDIRI4
CNSTI4 0
EQI4 $99
line 74
;74:		{
line 75
;75:			client->ps.damageType = 2; //shields and health
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 2
ASGNI4
line 76
;76:		}
ADDRGP4 $100
JUMPV
LABELV $99
line 78
;77:		else
;78:		{
line 79
;79:			client->ps.damageType = 0; //pure health
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 80
;80:		}
LABELV $100
LABELV $98
line 81
;81:	}
LABELV $90
line 84
;82:
;83:
;84:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 89
;85:
;86:	//
;87:	// clear totals
;88:	//
;89:	client->damage_blood = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 0
ASGNI4
line 90
;90:	client->damage_armor = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1608
ADDP4
CNSTI4 0
ASGNI4
line 91
;91:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1616
ADDP4
CNSTI4 0
ASGNI4
line 92
;92:}
LABELV $80
endproc P_DamageFeedback 48 12
export P_WorldEffects
proc P_WorldEffects 40 32
line 103
;93:
;94:
;95:
;96:/*
;97:=============
;98:P_WorldEffects
;99:
;100:Check for lava / slime contents and drowning
;101:=============
;102:*/
;103:void P_WorldEffects( gentity_t *ent ) {
line 107
;104:	qboolean	envirosuit;
;105:	int			waterlevel;
;106:
;107:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
line 108
;108:		ent->client->airOutTime = level.time + 12000;	// don't need air
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 109
;109:		return;
ADDRGP4 $101
JUMPV
LABELV $102
line 112
;110:	}
;111:
;112:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ASGNI4
line 114
;113:
;114:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $107
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $108
JUMPV
LABELV $107
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $108
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 119
;115:
;116:	//
;117:	// check for drowning
;118:	//
;119:	if ( waterlevel == 3 ) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $109
line 121
;120:		// envirosuit give air
;121:		if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $111
line 122
;122:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 123
;123:		}
LABELV $111
line 126
;124:
;125:		// if out of air, start drowning
;126:		if ( ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $110
line 128
;127:			// drown!
;128:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 129
;129:			if ( ent->health > 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $110
line 131
;130:				// take more damage the longer underwater
;131:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 132
;132:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 15
LEI4 $119
line 133
;133:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 15
ASGNI4
LABELV $119
line 136
;134:
;135:				// play a gurp sound instead of a normal pain sound
;136:				if (ent->health <= ent->damage) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
GTI4 $121
line 137
;137:					G_Sound(ent, CHAN_VOICE, G_SoundIndex(/*"*drown.wav"*/"sound/player/gurp1.wav"));
ADDRGP4 $123
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 138
;138:				} else if (rand()&1) {
ADDRGP4 $122
JUMPV
LABELV $121
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $124
line 139
;139:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp1.wav"));
ADDRGP4 $123
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 140
;140:				} else {
ADDRGP4 $125
JUMPV
LABELV $124
line 141
;141:					G_Sound(ent, CHAN_VOICE, G_SoundIndex("sound/player/gurp2.wav"));
ADDRGP4 $126
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 142
;142:				}
LABELV $125
LABELV $122
line 145
;143:
;144:				// don't play a normal pain sound
;145:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 147
;146:
;147:				G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
CNSTP4 0
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 29
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 149
;148:					ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
;149:			}
line 150
;150:		}
line 151
;151:	} else {
ADDRGP4 $110
JUMPV
LABELV $109
line 152
;152:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 153
;153:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 2
ASGNI4
line 154
;154:	}
LABELV $110
line 159
;155:
;156:	//
;157:	// check for sizzle damage (move to pmove?)
;158:	//
;159:	if (waterlevel && 
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $129
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 12
INDIRI4
EQI4 $129
line 160
;160:		(ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
line 161
;161:		if (ent->health > 0
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $131
ADDRLP4 16
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $131
line 162
;162:			&& ent->pain_debounce_time <= level.time	) {
line 164
;163:
;164:			if ( envirosuit ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $134
line 165
;165:				G_AddEvent( ent, EV_POWERUP_BATTLESUIT, 0 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 83
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 166
;166:			} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 167
;167:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $136
line 168
;168:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 30
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 31
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 170
;169:						30*waterlevel, 0, MOD_LAVA);
;170:				}
LABELV $136
line 172
;171:
;172:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $138
line 173
;173:					G_Damage (ent, NULL, NULL, NULL, NULL, 
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
CNSTP4 0
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
CNSTP4 0
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 10
ADDRLP4 0
INDIRI4
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 30
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 175
;174:						10*waterlevel, 0, MOD_SLIME);
;175:				}
LABELV $138
line 176
;176:			}
LABELV $135
line 177
;177:		}
LABELV $131
line 178
;178:	}
LABELV $129
line 179
;179:}
LABELV $101
endproc P_WorldEffects 40 32
export DoImpact
proc DoImpact 96 32
line 188
;180:
;181:
;182:
;183:
;184:
;185://==============================================================
;186:extern void G_ApplyKnockback( gentity_t *targ, vec3_t newDir, float knockback );
;187:void DoImpact( gentity_t *self, gentity_t *other, qboolean damageSelf )
;188:{
line 193
;189:	float magnitude, my_mass;
;190:	vec3_t	velocity;
;191:	int cont;
;192:
;193:	if( self->client )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
line 194
;194:	{
line 195
;195:		VectorCopy( self->client->ps.velocity, velocity );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 196
;196:		my_mass = self->mass;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ASGNF4
line 197
;197:	}
ADDRGP4 $142
JUMPV
LABELV $141
line 199
;198:	else 
;199:	{
line 200
;200:		VectorCopy( self->s.pos.trDelta, velocity );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 201
;201:		if ( self->s.pos.trType == TR_GRAVITY )
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
NEI4 $143
line 202
;202:		{
line 203
;203:			velocity[2] -= 0.25f * g_gravity.value;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1048576000
ADDRGP4 g_gravity+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 204
;204:		}
LABELV $143
line 205
;205:		if( !self->mass )
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
CNSTF4 0
NEF4 $147
line 206
;206:		{
line 207
;207:			my_mass = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 208
;208:		}
ADDRGP4 $148
JUMPV
LABELV $147
line 209
;209:		else if ( self->mass <= 10 )
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
CNSTF4 1092616192
GTF4 $149
line 210
;210:		{
line 211
;211:			my_mass = 10;
ADDRLP4 16
CNSTF4 1092616192
ASGNF4
line 212
;212:		}
ADDRGP4 $150
JUMPV
LABELV $149
line 214
;213:		else
;214:		{
line 215
;215:			my_mass = self->mass;///10;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ASGNF4
line 216
;216:		}
LABELV $150
LABELV $148
line 217
;217:	}
LABELV $142
line 219
;218:
;219:	magnitude = VectorLength( velocity ) * my_mass / 10;
ADDRLP4 4
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
CNSTF4 1092616192
DIVF4
ASGNF4
line 232
;220:
;221:	/*
;222:	if(pointcontents(self.absmax)==CONTENT_WATER)//FIXME: or other watertypes
;223:		magnitude/=3;							//water absorbs 2/3 velocity
;224:
;225:	if(self.classname=="barrel"&&self.aflag)//rolling barrels are made for impacts!
;226:		magnitude*=3;
;227:
;228:	if(self.frozen>0&&magnitude<300&&self.flags&FL_ONGROUND&&loser==world&&self.velocity_z<-20&&self.last_onground+0.3<time)
;229:		magnitude=300;
;230:	*/
;231:
;232:	if ( !self->client || self->client->ps.lastOnGround+300<level.time || ( self->client->ps.lastOnGround+100 < level.time && other->material >= MAT_GLASS ) )
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 300
ADDI4
ADDRGP4 level+32
INDIRI4
LTI4 $156
ADDRLP4 32
INDIRI4
CNSTI4 100
ADDI4
ADDRGP4 level+32
INDIRI4
GEI4 $151
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 1
LTI4 $151
LABELV $156
line 233
;233:	{
line 235
;234:		vec3_t dir1, dir2;
;235:		float force = 0, dot;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 237
;236:
;237:		if ( other->material >= MAT_GLASS )
ADDRFP4 4
INDIRP4
CNSTI4 684
ADDP4
INDIRI4
CNSTI4 1
LTI4 $157
line 238
;238:			magnitude *= 2;
ADDRLP4 0
CNSTF4 1073741824
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
LABELV $157
line 241
;239:
;240:		//damage them
;241:		if ( magnitude >= 100 && other->s.number < ENTITYNUM_WORLD )
ADDRLP4 0
INDIRF4
CNSTF4 1120403456
LTF4 $159
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1022
GEI4 $159
line 242
;242:		{
line 243
;243:			VectorCopy( velocity, dir1 );
ADDRLP4 52
ADDRLP4 4
INDIRB
ASGNB 12
line 244
;244:			VectorNormalize( dir1 );
ADDRLP4 52
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 245
;245:			if( VectorCompare( other->r.currentOrigin, vec3_origin ) )
ADDRFP4 4
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 68
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $161
line 246
;246:			{//a brush with no origin
line 247
;247:				VectorCopy ( dir1, dir2 );
ADDRLP4 40
ADDRLP4 52
INDIRB
ASGNB 12
line 248
;248:			}
ADDRGP4 $162
JUMPV
LABELV $161
line 250
;249:			else
;250:			{
line 251
;251:				VectorSubtract( other->r.currentOrigin, self->r.currentOrigin, dir2 );
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
CNSTI4 368
ASGNI4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 84
CNSTI4 372
ASGNI4
ADDRLP4 40+4
ADDRLP4 72
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
ADDRLP4 84
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 88
CNSTI4 376
ASGNI4
ADDRLP4 40+8
ADDRFP4 4
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 252
;252:				VectorNormalize( dir2 );
ADDRLP4 40
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 253
;253:			}
LABELV $162
line 255
;254:
;255:			dot = DotProduct( dir1, dir2 );
ADDRLP4 64
ADDRLP4 52
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDRLP4 52+4
INDIRF4
ADDRLP4 40+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52+8
INDIRF4
ADDRLP4 40+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 257
;256:
;257:			if ( dot >= 0.2 )
ADDRLP4 64
INDIRF4
CNSTF4 1045220557
LTF4 $169
line 258
;258:			{
line 259
;259:				force = dot;
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 260
;260:			}
ADDRGP4 $170
JUMPV
LABELV $169
line 262
;261:			else
;262:			{
line 263
;263:				force = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
line 264
;264:			}
LABELV $170
line 266
;265:
;266:			force *= (magnitude/50);
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 1112014848
DIVF4
MULF4
ASGNF4
line 268
;267:
;268:			cont = trap_PointContents( other->r.absmax, other->s.number );
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 76
INDIRI4
ASGNI4
line 269
;269:			if( (cont&CONTENTS_WATER) )//|| (self.classname=="barrel"&&self.aflag))//FIXME: or other watertypes
ADDRLP4 20
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $171
line 270
;270:			{
line 271
;271:				force /= 3;							//water absorbs 2/3 velocity
ADDRLP4 36
ADDRLP4 36
INDIRF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 272
;272:			}
LABELV $171
line 279
;273:
;274:			/*
;275:			if(self.frozen>0&&force>10)
;276:				force=10;
;277:			*/
;278:
;279:			if( ( force >= 1 && other->s.number != 0 ) || force >= 10)
ADDRLP4 36
INDIRF4
CNSTF4 1065353216
LTF4 $176
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $175
LABELV $176
ADDRLP4 36
INDIRF4
CNSTF4 1092616192
LTF4 $173
LABELV $175
line 280
;280:			{
line 288
;281:	/*			
;282:				dprint("Damage other (");
;283:				dprint(loser.classname);
;284:				dprint("): ");
;285:				dprint(ftos(force));
;286:				dprint("\n");
;287:	*/
;288:				if ( other->r.svFlags & SVF_GLASS_BRUSH )
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $177
line 289
;289:				{
line 290
;290:					other->splashRadius = (float)(self->r.maxs[0] - self->r.mins[0])/4.0f;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 700
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 291
;291:				}
LABELV $177
line 292
;292:				if ( other->takedamage )
ADDRFP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $179
line 293
;293:				{
line 294
;294:					G_Damage( other, self, self, velocity, self->r.currentOrigin, force, DAMAGE_NO_ARMOR, MOD_CRUSH);//FIXME: MOD_IMPACT
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 36
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 295
;295:				}
ADDRGP4 $180
JUMPV
LABELV $179
line 297
;296:				else
;297:				{
line 298
;298:					G_ApplyKnockback( other, dir2, force );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 G_ApplyKnockback
CALLV
pop
line 299
;299:				}
LABELV $180
line 300
;300:			}
LABELV $173
line 301
;301:		}
LABELV $159
line 303
;302:
;303:		if ( damageSelf && self->takedamage )
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $181
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
EQI4 $181
line 304
;304:		{
line 307
;305:			//Now damage me
;306:			//FIXME: more lenient falling damage, especially for when driving a vehicle
;307:			if ( self->client && self->client->ps.fd.forceJumpZStart )
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
ADDRLP4 72
INDIRP4
CNSTI4 1080
ADDP4
INDIRF4
CNSTF4 0
EQF4 $183
line 308
;308:			{//we were force-jumping
line 309
;309:				if ( self->r.currentOrigin[2] >= self->client->ps.fd.forceJumpZStart )
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1080
ADDP4
INDIRF4
LTF4 $185
line 310
;310:				{//we landed at same height or higher than we landed
line 311
;311:					magnitude = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 312
;312:				}
ADDRGP4 $186
JUMPV
LABELV $185
line 314
;313:				else
;314:				{//FIXME: take off some of it, at least?
line 315
;315:					magnitude = (self->client->ps.fd.forceJumpZStart-self->r.currentOrigin[2])/3;
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1080
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
CNSTF4 1077936128
DIVF4
ASGNF4
line 316
;316:				}
LABELV $186
line 317
;317:			}
LABELV $183
line 319
;318:			//if(self.classname!="monster_mezzoman"&&self.netname!="spider")//Cats always land on their feet
;319:				if( ( magnitude >= 100 + self->health && self->s.number != 0 && self->s.weapon != WP_SABER ) || ( magnitude >= 700 ) )//&& self.safe_time < level.time ))//health here is used to simulate structural integrity
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
LTF4 $191
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $191
ADDRLP4 76
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
NEI4 $189
LABELV $191
ADDRLP4 0
INDIRF4
CNSTF4 1143930880
LTF4 $187
LABELV $189
line 320
;320:				{
line 321
;321:					if ( (self->s.weapon == WP_SABER || self->s.number == 0) && self->client && self->client->ps.groundEntityNum < ENTITYNUM_NONE && magnitude < 1000 )
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 2
EQI4 $194
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $192
LABELV $194
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 84
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
GEI4 $192
ADDRLP4 0
INDIRF4
CNSTF4 1148846080
GEF4 $192
line 322
;322:					{//players and jedi take less impact damage
line 324
;323:						//allow for some lenience on high falls
;324:						magnitude /= 2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 331
;325:						/*
;326:						if ( self.absorb_time >= time )//crouching on impact absorbs 1/2 the damage
;327:						{
;328:							magnitude/=2;
;329:						}
;330:						*/
;331:					}
LABELV $192
line 332
;332:					magnitude /= 40;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
DIVF4
ASGNF4
line 333
;333:					magnitude = magnitude - force/2;//If damage other, subtract half of that damage off of own injury
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
CNSTF4 1073741824
DIVF4
SUBF4
ASGNF4
line 334
;334:					if ( magnitude >= 1 )
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
LTF4 $195
line 335
;335:					{
line 348
;336:		//FIXME: Put in a thingtype impact sound function
;337:		/*					
;338:						dprint("Damage self (");
;339:						dprint(self.classname);
;340:						dprint("): ");
;341:						dprint(ftos(magnitude));
;342:						dprint("\n");
;343:		*/
;344:						/*
;345:						if ( self.classname=="player_sheep "&& self.flags&FL_ONGROUND && self.velocity_z > -50 )
;346:							return;
;347:						*/
;348:						G_Damage( self, NULL, NULL, NULL, self->r.currentOrigin, magnitude/2, DAMAGE_NO_ARMOR, MOD_FALLING );//FIXME: MOD_IMPACT
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRLP4 92
CNSTP4 0
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
DIVF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 349
;349:					}
LABELV $195
line 350
;350:				}
LABELV $187
line 351
;351:		}
LABELV $181
line 362
;352:
;353:		//FIXME: slow my velocity some?
;354:
;355:		// NOTENOTE We don't use lastimpact as of yet
;356://		self->lastImpact = level.time;
;357:
;358:		/*
;359:		if(self.flags&FL_ONGROUND)
;360:			self.last_onground=time;
;361:		*/
;362:	}
LABELV $151
line 363
;363:}
LABELV $140
endproc DoImpact 96 32
export G_SetClientSound
proc G_SetClientSound 8 0
line 370
;364:
;365:/*
;366:===============
;367:G_SetClientSound
;368:===============
;369:*/
;370:void G_SetClientSound( gentity_t *ent ) {
line 371
;371:	if (ent->waterlevel && (ent->watertype&(CONTENTS_LAVA|CONTENTS_SLIME)) ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $198
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 131074
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $198
line 372
;372:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 476
ADDP4
ADDRGP4 level+220
INDIRI4
ASGNI4
line 373
;373:	} else {
ADDRGP4 $199
JUMPV
LABELV $198
line 374
;374:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 476
ADDP4
CNSTI4 0
ASGNI4
line 375
;375:	}
LABELV $199
line 376
;376:}
LABELV $197
endproc G_SetClientSound 8 0
export ClientImpacts
proc ClientImpacts 1100 12
line 387
;377:
;378:
;379:
;380://==============================================================
;381:
;382:/*
;383:==============
;384:ClientImpacts
;385:==============
;386:*/
;387:void ClientImpacts( gentity_t *ent, pmove_t *pm ) {
line 392
;388:	int		i, j;
;389:	trace_t	trace;
;390:	gentity_t	*other;
;391:
;392:	memset( &trace, 0, sizeof( trace ) );
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 393
;393:	for (i=0 ; i<pm->numtouch ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 394
;394:		for (j=0 ; j<i ; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $206
line 395
;395:			if (pm->touchents[j] == pm->touchents[i] ) {
ADDRLP4 1092
CNSTI4 2
ASGNI4
ADDRLP4 1096
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 1092
INDIRI4
LSHI4
ADDRLP4 1096
INDIRP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1092
INDIRI4
LSHI4
ADDRLP4 1096
INDIRP4
ADDP4
INDIRI4
NEI4 $210
line 396
;396:				break;
ADDRGP4 $208
JUMPV
LABELV $210
line 398
;397:			}
;398:		}
LABELV $207
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $209
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $206
LABELV $208
line 399
;399:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $212
line 400
;400:			continue;	// duplicated
ADDRGP4 $203
JUMPV
LABELV $212
line 402
;401:		}
;402:		other = &g_entities[ pm->touchents[i] ];
ADDRLP4 8
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 404
;403:
;404:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 1092
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1092
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $214
ADDRLP4 1092
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $214
line 405
;405:			ent->touch( ent, other, &trace );
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 406
;406:		}
LABELV $214
line 408
;407:
;408:		if ( !other->touch ) {
ADDRLP4 8
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 409
;409:			continue;
ADDRGP4 $203
JUMPV
LABELV $216
line 412
;410:		}
;411:
;412:		other->touch( other, ent, &trace );
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 413
;413:	}
LABELV $203
line 393
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $205
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
LTI4 $202
line 415
;414:
;415:}
LABELV $201
endproc ClientImpacts 1100 12
data
align 4
LABELV $219
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 5264 16
line 425
;416:
;417:/*
;418:============
;419:G_TouchTriggers
;420:
;421:Find all trigger entities that ent's current position touches.
;422:Spectators will only interact with teleporters.
;423:============
;424:*/
;425:void	G_TouchTriggers( gentity_t *ent ) {
line 433
;426:	int			i, num;
;427:	int			touch[MAX_GENTITIES];
;428:	gentity_t	*hit;
;429:	trace_t		trace;
;430:	vec3_t		mins, maxs;
;431:	static vec3_t	range = { 40, 40, 52 };
;432:
;433:	if ( !ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $220
line 434
;434:		return;
ADDRGP4 $218
JUMPV
LABELV $220
line 438
;435:	}
;436:
;437:	// dead clients don't activate triggers!
;438:	if ( ent->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $222
line 439
;439:		return;
ADDRGP4 $218
JUMPV
LABELV $222
line 442
;440:	}
;441:
;442:	VectorSubtract( ent->client->ps.origin, range, mins );
ADDRLP4 5212
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1088
ADDRLP4 5212
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $219
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 5212
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $219+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $219+8
INDIRF4
SUBF4
ASGNF4
line 443
;443:	VectorAdd( ent->client->ps.origin, range, maxs );
ADDRLP4 5216
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1100
ADDRLP4 5216
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $219
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 5216
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $219+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $219+8
INDIRF4
ADDF4
ASGNF4
line 445
;444:
;445:	num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1116
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5220
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1112
ADDRLP4 5220
INDIRI4
ASGNI4
line 448
;446:
;447:	// can't use ent->r.absmin, because that has a one unit pad
;448:	VectorAdd( ent->client->ps.origin, ent->r.mins, mins );
ADDRLP4 5224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5228
ADDRLP4 5224
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1088
ADDRLP4 5228
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 5224
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 5228
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 5224
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088+8
ADDRLP4 5232
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 5232
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 449
;449:	VectorAdd( ent->client->ps.origin, ent->r.maxs, maxs );
ADDRLP4 5236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5240
ADDRLP4 5236
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 1100
ADDRLP4 5240
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 5236
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 5240
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 5236
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 5244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100+8
ADDRLP4 5244
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 5244
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 451
;450:
;451:	for ( i=0 ; i<num ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $236
line 452
;452:		hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1116
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 454
;453:
;454:		if ( !hit->touch && !ent->touch ) {
ADDRLP4 5248
CNSTI4 648
ASGNI4
ADDRLP4 5252
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
ADDRLP4 5248
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5252
INDIRU4
NEU4 $240
ADDRFP4 0
INDIRP4
ADDRLP4 5248
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 5252
INDIRU4
NEU4 $240
line 455
;455:			continue;
ADDRGP4 $237
JUMPV
LABELV $240
line 457
;456:		}
;457:		if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) {
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $242
line 458
;458:			continue;
ADDRGP4 $237
JUMPV
LABELV $242
line 462
;459:		}
;460:
;461:		// ignore most entities if a spectator
;462:		if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $244
line 463
;463:			if ( hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 11
EQI4 $246
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $246
line 466
;464:				// this is ugly but adding a new ET_? type will
;465:				// most likely cause network incompatibilities
;466:				hit->touch != Touch_DoorTrigger) {
line 467
;467:				continue;
ADDRGP4 $237
JUMPV
LABELV $246
line 469
;468:			}
;469:		}
LABELV $244
line 473
;470:
;471:		// use seperate code for determining if an item is picked up
;472:		// so you don't have to actually contact its bounding box
;473:		if ( hit->s.eType == ET_ITEM ) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $248
line 474
;474:			if ( !BG_PlayerTouchesItem( &ent->client->ps, &hit->s, level.time ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 5256
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 5256
INDIRI4
CNSTI4 0
NEI4 $249
line 475
;475:				continue;
ADDRGP4 $237
JUMPV
line 477
;476:			}
;477:		} else {
LABELV $248
line 478
;478:			if ( !trap_EntityContact( mins, maxs, hit ) ) {
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 5256
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 5256
INDIRI4
CNSTI4 0
NEI4 $253
line 479
;479:				continue;
ADDRGP4 $237
JUMPV
LABELV $253
line 481
;480:			}
;481:		}
LABELV $249
line 483
;482:
;483:		memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 485
;484:
;485:		if ( hit->touch ) {
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $255
line 486
;486:			hit->touch (hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 487
;487:		}
LABELV $255
line 489
;488:
;489:		if ( ( ent->r.svFlags & SVF_BOT ) && ( ent->touch ) ) {
ADDRLP4 5256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5256
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $257
ADDRLP4 5256
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $257
line 490
;490:			ent->touch( ent, hit, &trace );
ADDRLP4 5260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 5260
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 491
;491:		}
LABELV $257
line 492
;492:	}
LABELV $237
line 451
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $239
ADDRLP4 4
INDIRI4
ADDRLP4 1112
INDIRI4
LTI4 $236
line 495
;493:
;494:	// if we didn't touch a jump pad this pmove frame
;495:	if ( ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount ) {
ADDRLP4 5248
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 5248
INDIRP4
CNSTI4 492
ADDP4
INDIRI4
ADDRLP4 5248
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
EQI4 $259
line 496
;496:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 497
;497:		ent->client->ps.jumppad_ent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 480
ADDP4
CNSTI4 0
ASGNI4
line 498
;498:	}
LABELV $259
line 499
;499:}
LABELV $218
endproc G_TouchTriggers 5264 16
lit
align 4
LABELV $262
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_MoverTouchPushTriggers
code
proc G_MoverTouchPushTriggers 5328 16
line 511
;500:
;501:
;502:/*
;503:============
;504:G_MoverTouchTriggers
;505:
;506:Find all trigger entities that ent's current position touches.
;507:Spectators will only interact with teleporters.
;508:============
;509:*/
;510:void G_MoverTouchPushTriggers( gentity_t *ent, vec3_t oldOrg ) 
;511:{
line 518
;512:	int			i, num;
;513:	float		step, stepSize, dist;
;514:	int			touch[MAX_GENTITIES];
;515:	gentity_t	*hit;
;516:	trace_t		trace;
;517:	vec3_t		mins, maxs, dir, size, checkSpot;
;518:	const vec3_t	range = { 40, 40, 52 };
ADDRLP4 5224
ADDRGP4 $262
INDIRB
ASGNB 12
line 521
;519:
;520:	// non-moving movers don't hit triggers!
;521:	if ( !VectorLengthSquared( ent->s.pos.trDelta ) ) 
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 5272
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 5272
INDIRF4
CNSTF4 0
NEF4 $263
line 522
;522:	{
line 523
;523:		return;
ADDRGP4 $261
JUMPV
LABELV $263
line 526
;524:	}
;525:
;526:	VectorSubtract( ent->r.mins, ent->r.maxs, size );
ADDRLP4 5276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260
ADDRLP4 5276
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 5276
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5260+4
ADDRLP4 5276
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 5276
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5260+8
ADDRLP4 5280
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 5280
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
SUBF4
ASGNF4
line 527
;527:	stepSize = VectorLength( size );
ADDRLP4 5260
ARGP4
ADDRLP4 5284
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 5252
ADDRLP4 5284
INDIRF4
ASGNF4
line 528
;528:	if ( stepSize < 1 )
ADDRLP4 5252
INDIRF4
CNSTF4 1065353216
GEF4 $267
line 529
;529:	{
line 530
;530:		stepSize = 1;
ADDRLP4 5252
CNSTF4 1065353216
ASGNF4
line 531
;531:	}
LABELV $267
line 533
;532:
;533:	VectorSubtract( ent->r.currentOrigin, oldOrg, dir );
ADDRLP4 5288
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 5292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 5240
ADDRLP4 5288
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 5292
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5240+4
ADDRLP4 5288
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 5292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 5240+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 534
;534:	dist = VectorNormalize( dir );
ADDRLP4 5240
ARGP4
ADDRLP4 5296
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 5256
ADDRLP4 5296
INDIRF4
ASGNF4
line 535
;535:	for ( step = 0; step <= dist; step += stepSize )
ADDRLP4 5236
CNSTF4 0
ASGNF4
ADDRGP4 $274
JUMPV
LABELV $271
line 536
;536:	{
line 537
;537:		VectorMA( ent->r.currentOrigin, step, dir, checkSpot );
ADDRLP4 5300
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
ADDRLP4 5300
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
ADDRLP4 5240
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+4
ADDRLP4 5300
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ADDRLP4 5240+4
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1112+8
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ADDRLP4 5240+8
INDIRF4
ADDRLP4 5236
INDIRF4
MULF4
ADDF4
ASGNF4
line 538
;538:		VectorSubtract( checkSpot, range, mins );
ADDRLP4 1088
ADDRLP4 1112
INDIRF4
ADDRLP4 5224
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5224+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 5224+8
INDIRF4
SUBF4
ASGNF4
line 539
;539:		VectorAdd( checkSpot, range, maxs );
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 5224
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5224+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRLP4 5224+8
INDIRF4
ADDF4
ASGNF4
line 541
;540:
;541:		num = trap_EntitiesInBox( mins, maxs, touch, MAX_GENTITIES );
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1128
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 5308
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 1124
ADDRLP4 5308
INDIRI4
ASGNI4
line 544
;542:
;543:		// can't use ent->r.absmin, because that has a one unit pad
;544:		VectorAdd( checkSpot, ent->r.mins, mins );
ADDRLP4 5312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1112
INDIRF4
ADDRLP4 5312
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5312
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1088+8
ADDRLP4 1112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 545
;545:		VectorAdd( checkSpot, ent->r.maxs, maxs );
ADDRLP4 5316
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1112
INDIRF4
ADDRLP4 5316
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+4
ADDRLP4 1112+4
INDIRF4
ADDRLP4 5316
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 1100+8
ADDRLP4 1112+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 547
;546:
;547:		for ( i=0 ; i<num ; i++ ) 
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $302
JUMPV
LABELV $299
line 548
;548:		{
line 549
;549:			hit = &g_entities[touch[i]];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1128
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 551
;550:
;551:			if ( hit->s.eType != ET_PUSH_TRIGGER )
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 10
EQI4 $303
line 552
;552:			{
line 553
;553:				continue;
ADDRGP4 $300
JUMPV
LABELV $303
line 556
;554:			}
;555:
;556:			if ( hit->touch == NULL ) 
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $305
line 557
;557:			{
line 558
;558:				continue;
ADDRGP4 $300
JUMPV
LABELV $305
line 561
;559:			}
;560:
;561:			if ( !( hit->r.contents & CONTENTS_TRIGGER ) ) 
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $307
line 562
;562:			{
line 563
;563:				continue;
ADDRGP4 $300
JUMPV
LABELV $307
line 567
;564:			}
;565:
;566:
;567:			if ( !trap_EntityContact( mins, maxs, hit ) ) 
ADDRLP4 1088
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 5320
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 5320
INDIRI4
CNSTI4 0
NEI4 $309
line 568
;568:			{
line 569
;569:				continue;
ADDRGP4 $300
JUMPV
LABELV $309
line 572
;570:			}
;571:
;572:			memset( &trace, 0, sizeof(trace) );
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 574
;573:
;574:			if ( hit->touch != NULL ) 
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $311
line 575
;575:			{
line 576
;576:				hit->touch(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CALLV
pop
line 577
;577:			}
LABELV $311
line 578
;578:		}
LABELV $300
line 547
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $302
ADDRLP4 4
INDIRI4
ADDRLP4 1124
INDIRI4
LTI4 $299
line 579
;579:	}
LABELV $272
line 535
ADDRLP4 5236
ADDRLP4 5236
INDIRF4
ADDRLP4 5252
INDIRF4
ADDF4
ASGNF4
LABELV $274
ADDRLP4 5236
INDIRF4
ADDRLP4 5256
INDIRF4
LEF4 $271
line 580
;580:}
LABELV $261
endproc G_MoverTouchPushTriggers 5328 16
export SpectatorThink
proc SpectatorThink 396 12
line 587
;581:
;582:/*
;583:=================
;584:SpectatorThink
;585:=================
;586:*/
;587:void SpectatorThink( gentity_t *ent, usercmd_t *ucmd ) {
line 591
;588:	pmove_t	pm;
;589:	gclient_t	*client;
;590:
;591:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 593
;592:
;593:	if ( client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 2
EQI4 $314
line 594
;594:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 595
;595:		client->ps.speed = 400;	// faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 400
ASGNI4
line 596
;596:		client->ps.basespeed = 400;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 400
ASGNI4
line 599
;597:
;598:		// set up for pmove
;599:		memset (&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 600
;600:		pm.ps = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 601
;601:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 28
line 602
;602:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;	// spectators can fly through bodies
ADDRLP4 4+32
CNSTI4 17
ASGNI4
line 603
;603:		pm.trace = trap_Trace;
ADDRLP4 4+240
ADDRGP4 trap_Trace
ASGNP4
line 604
;604:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+244
ADDRGP4 trap_PointContents
ASGNP4
line 606
;605:
;606:		pm.animations = NULL;
ADDRLP4 4+224
CNSTP4 0
ASGNP4
line 609
;607:
;608:		// perform a pmove
;609:		Pmove (&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 611
;610:		// save results of pmove
;611:		VectorCopy( client->ps.origin, ent->s.origin );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 613
;612:
;613:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 614
;614:		trap_UnlinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 615
;615:	}
LABELV $314
line 617
;616:
;617:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 1588
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ASGNI4
line 618
;618:	client->buttons = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 1584
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 621
;619:
;620:	// attack button cycles through spectators
;621:	if ( ( client->buttons & BUTTON_ATTACK ) && ! ( client->oldbuttons & BUTTON_ATTACK ) ) {
ADDRLP4 388
CNSTI4 1
ASGNI4
ADDRLP4 392
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ADDRLP4 388
INDIRI4
BANDI4
ADDRLP4 392
INDIRI4
EQI4 $321
ADDRLP4 0
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
ADDRLP4 388
INDIRI4
BANDI4
ADDRLP4 392
INDIRI4
NEI4 $321
line 622
;622:		Cmd_FollowCycle_f( ent, 1 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 623
;623:	}
LABELV $321
line 625
;624:
;625:	if (client->sess.spectatorState == SPECTATOR_FOLLOW && (ucmd->upmove > 0))
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 2
NEI4 $323
ADDRFP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $323
line 626
;626:	{ //jump now removes you from follow mode
line 627
;627:		StopFollowing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 628
;628:	}
LABELV $323
line 629
;629:}
LABELV $313
endproc SpectatorThink 396 12
export ClientInactivityTimer
proc ClientInactivityTimer 12 8
line 640
;630:
;631:
;632:
;633:/*
;634:=================
;635:ClientInactivityTimer
;636:
;637:Returns qfalse if the client is dropped
;638:=================
;639:*/
;640:qboolean ClientInactivityTimer( gclient_t *client ) {
line 641
;641:	if ( ! g_inactivity.integer ) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $326
line 644
;642:		// give everyone some time, so if the operator sets g_inactivity during
;643:		// gameplay, everyone isn't kicked
;644:		client->inactivityTime = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 645
;645:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
CNSTI4 0
ASGNI4
line 646
;646:	} else if ( client->pers.cmd.forwardmove || 
ADDRGP4 $327
JUMPV
LABELV $326
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1396
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $334
ADDRLP4 0
INDIRP4
CNSTI4 1397
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $334
ADDRLP4 0
INDIRP4
CNSTI4 1398
ADDP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI4
NEI4 $334
ADDRLP4 0
INDIRP4
CNSTI4 1388
ADDP4
INDIRI4
CNSTI4 129
BANDI4
ADDRLP4 4
INDIRI4
EQI4 $330
LABELV $334
line 649
;647:		client->pers.cmd.rightmove || 
;648:		client->pers.cmd.upmove ||
;649:		(client->pers.cmd.buttons & (BUTTON_ATTACK|BUTTON_ALT_ATTACK)) ) {
line 650
;650:		client->inactivityTime = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDRGP4 g_inactivity+12
INDIRI4
MULI4
ADDI4
ASGNI4
line 651
;651:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
CNSTI4 0
ASGNI4
line 652
;652:	} else if ( !client->pers.localClient ) {
ADDRGP4 $331
JUMPV
LABELV $330
ADDRFP4 0
INDIRP4
CNSTI4 1400
ADDP4
INDIRI4
CNSTI4 0
NEI4 $337
line 653
;653:		if ( level.time > client->inactivityTime ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 1676
ADDP4
INDIRI4
LEI4 $339
line 654
;654:			trap_DropClient( client - level.clients, "Dropped due to inactivity" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1756
DIVI4
ARGI4
ADDRGP4 $342
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 655
;655:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $325
JUMPV
LABELV $339
line 657
;656:		}
;657:		if ( level.time > client->inactivityTime - 10000 && !client->inactivityWarning ) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 1676
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $343
ADDRLP4 8
INDIRP4
CNSTI4 1680
ADDP4
INDIRI4
CNSTI4 0
NEI4 $343
line 658
;658:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1680
ADDP4
CNSTI4 1
ASGNI4
line 659
;659:			trap_SendServerCommand( client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"" );
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1756
DIVI4
ARGI4
ADDRGP4 $346
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 660
;660:		}
LABELV $343
line 661
;661:	}
LABELV $337
LABELV $331
LABELV $327
line 662
;662:	return qtrue;
CNSTI4 1
RETI4
LABELV $325
endproc ClientInactivityTimer 12 8
export ClientTimerActions
proc ClientTimerActions 20 0
line 672
;663:}
;664:
;665:/*
;666:==================
;667:ClientTimerActions
;668:
;669:Actions that happen once a second
;670:==================
;671:*/
;672:void ClientTimerActions( gentity_t *ent, int msec ) {
line 675
;673:	gclient_t	*client;
;674:
;675:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 676
;676:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1708
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $349
JUMPV
LABELV $348
line 679
;677:
;678:	while ( client->timeResidual >= 1000 ) 
;679:	{
line 680
;680:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1708
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 683
;681:
;682:		// count down health when over max
;683:		if ( ent->health > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $351
line 684
;684:			ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 685
;685:		}
LABELV $351
line 688
;686:
;687:		// count down armor when over max
;688:		if ( client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH] ) {
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $353
line 689
;689:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 690
;690:		}
LABELV $353
line 691
;691:	}
LABELV $349
line 678
ADDRLP4 0
INDIRP4
CNSTI4 1708
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $348
line 692
;692:}
LABELV $347
endproc ClientTimerActions 20 0
export ClientIntermissionThink
proc ClientIntermissionThink 24 0
line 699
;693:
;694:/*
;695:====================
;696:ClientIntermissionThink
;697:====================
;698:*/
;699:void ClientIntermissionThink( gclient_t *client ) {
line 700
;700:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 701
;701:	client->ps.eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 706
;702:
;703:	// the level will exit when everyone wants to or after timeouts
;704:
;705:	// swap and latch button actions
;706:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1588
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ASGNI4
line 707
;707:	client->buttons = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1584
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 1388
ADDP4
INDIRI4
ASGNI4
line 708
;708:	if ( client->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) & ( client->oldbuttons ^ client->buttons ) ) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $356
line 710
;709:		// this used to be an ^1 but once a player says ready, it should stick
;710:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 1572
ADDP4
CNSTI4 1
ASGNI4
line 711
;711:	}
LABELV $356
line 712
;712:}
LABELV $355
endproc ClientIntermissionThink 24 0
export ClientEvents
proc ClientEvents 68 32
line 723
;713:
;714:
;715:/*
;716:================
;717:ClientEvents
;718:
;719:Events will be passed on to the clients for presentation,
;720:but any server game effects are handled here
;721:================
;722:*/
;723:void ClientEvents( gentity_t *ent, int oldEventSequence ) {
line 734
;724:	int		i;//, j;
;725:	int		event;
;726:	gclient_t *client;
;727:	int		damage;
;728:	vec3_t	dir;
;729://	vec3_t	origin, angles;
;730://	qboolean	fired;
;731://	gitem_t *item;
;732://	gentity_t *drop;
;733:
;734:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 736
;735:
;736:	if ( oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS ) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $359
line 737
;737:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 738
;738:	}
LABELV $359
line 739
;739:	for ( i = oldEventSequence ; i < client->ps.eventSequence ; i++ ) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $364
JUMPV
LABELV $361
line 740
;740:		event = client->ps.events[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ASGNI4
line 742
;741:
;742:		switch ( event ) {
ADDRLP4 32
CNSTI4 15
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $367
ADDRLP4 4
INDIRI4
ADDRLP4 32
INDIRI4
GTI4 $393
LABELV $392
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $367
ADDRGP4 $366
JUMPV
LABELV $393
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $380
ADDRLP4 4
INDIRI4
CNSTI4 25
EQI4 $382
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $384
ADDRLP4 4
INDIRI4
ADDRLP4 40
INDIRI4
LTI4 $366
LABELV $394
ADDRLP4 4
INDIRI4
CNSTI4 41
LTI4 $366
ADDRLP4 4
INDIRI4
CNSTI4 46
GTI4 $366
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $395-164
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $395
address $386
address $387
address $388
address $366
address $390
address $391
code
LABELV $367
line 745
;743:		case EV_FALL:
;744:		case EV_ROLL:
;745:			{
line 746
;746:				int delta = client->ps.eventParms[ i & (MAX_PS_EVENTS-1) ];
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 124
ADDP4
ADDP4
INDIRI4
ASGNI4
line 748
;747:
;748:				if (ent->client && ent->client->ps.fallingToDeath)
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $368
ADDRLP4 52
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $368
line 749
;749:				{
line 750
;750:					break;
ADDRGP4 $366
JUMPV
LABELV $368
line 753
;751:				}
;752:
;753:				if ( ent->s.eType != ET_PLAYER )
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $370
line 754
;754:				{
line 755
;755:					break;		// not in the player model
ADDRGP4 $366
JUMPV
LABELV $370
line 758
;756:				}
;757:				
;758:				if ( g_dmflags.integer & DF_NO_FALLING )
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $372
line 759
;759:				{
line 760
;760:					break;
ADDRGP4 $366
JUMPV
LABELV $372
line 763
;761:				}
;762:
;763:				if (delta <= 44)
ADDRLP4 48
INDIRI4
CNSTI4 44
GTI4 $375
line 764
;764:				{
line 765
;765:					break;
ADDRGP4 $366
JUMPV
LABELV $375
line 768
;766:				}
;767:
;768:				damage = delta*0.16; //good enough for now, I guess
ADDRLP4 24
CNSTF4 1042536202
ADDRLP4 48
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 770
;769:
;770:				VectorSet (dir, 0, 0, 1);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 12
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 56
INDIRF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 771
;771:				ent->pain_debounce_time = level.time + 200;	// no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 772
;772:				G_Damage (ent, NULL, NULL, NULL, NULL, damage, DAMAGE_NO_ARMOR, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
CNSTP4 0
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
CNSTP4 0
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 773
;773:			}
line 774
;774:			break;
ADDRGP4 $366
JUMPV
LABELV $380
line 776
;775:		case EV_FIRE_WEAPON:
;776:			FireWeapon( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 FireWeapon
CALLV
pop
line 777
;777:			ent->client->dangerTime = level.time;
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
line 778
;778:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 779
;779:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 780
;780:			break;
ADDRGP4 $366
JUMPV
LABELV $382
line 783
;781:
;782:		case EV_ALT_FIRE:
;783:			FireWeapon( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 FireWeapon
CALLV
pop
line 784
;784:			ent->client->dangerTime = level.time;
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
line 785
;785:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 786
;786:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 787
;787:			break;
ADDRGP4 $366
JUMPV
LABELV $384
line 790
;788:
;789:		case EV_SABER_ATTACK:
;790:			ent->client->dangerTime = level.time;
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
line 791
;791:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 792
;792:			ent->client->invulnerableTimer = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 793
;793:			break;
ADDRGP4 $366
JUMPV
LABELV $386
line 797
;794:
;795:		//rww - Note that these must be in the same order (ITEM#-wise) as they are in holdable_t
;796:		case EV_USE_ITEM1: //seeker droid
;797:			ItemUse_Seeker(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Seeker
CALLV
pop
line 798
;798:			break;
ADDRGP4 $366
JUMPV
LABELV $387
line 800
;799:		case EV_USE_ITEM2: //shield
;800:			ItemUse_Shield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Shield
CALLV
pop
line 801
;801:			break;
ADDRGP4 $366
JUMPV
LABELV $388
line 803
;802:		case EV_USE_ITEM3: //medpack
;803:			ItemUse_MedPack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_MedPack
CALLV
pop
line 804
;804:			break;
ADDRGP4 $366
JUMPV
line 807
;805:		case EV_USE_ITEM4: //datapad
;806:			//G_Printf("Used Datapad\n");
;807:			break;
LABELV $390
line 809
;808:		case EV_USE_ITEM5: //binoculars
;809:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 810
;810:			break;
ADDRGP4 $366
JUMPV
LABELV $391
line 812
;811:		case EV_USE_ITEM6: //sentry gun
;812:			ItemUse_Sentry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Sentry
CALLV
pop
line 813
;813:			break;
line 816
;814:
;815:		default:
;816:			break;
LABELV $366
line 818
;817:		}
;818:	}
LABELV $362
line 739
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $364
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LTI4 $361
line 820
;819:
;820:}
LABELV $358
endproc ClientEvents 68 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 40 12
line 827
;821:
;822:/*
;823:==============
;824:SendPendingPredictableEvents
;825:==============
;826:*/
;827:void SendPendingPredictableEvents( playerState_t *ps ) {
line 833
;828:	gentity_t *t;
;829:	int event, seq;
;830:	int extEvent, number;
;831:
;832:	// if there are still events pending
;833:	if ( ps->entityEventSequence < ps->eventSequence ) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $398
line 836
;834:		// create a temporary entity for this event which is sent to everyone
;835:		// except the client who generated the event
;836:		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 837
;837:		event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 839
;838:		// set external event to zero before calling BG_PlayerStateToEntityState
;839:		extEvent = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 840
;840:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 842
;841:		// create temporary entity for event
;842:		t = G_TempEntity( ps->origin, event );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 843
;843:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 844
;844:		BG_PlayerStateToEntityState( ps, &t->s, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 845
;845:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 846
;846:		t->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 847
;847:		t->s.eFlags |= EF_PLAYER_EVENT;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 848
;848:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 850
;849:		// send to everyone except the client who generated the event
;850:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 851
;851:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 308
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 853
;852:		// set back external event
;853:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 854
;854:	}
LABELV $398
line 855
;855:}
LABELV $397
endproc SendPendingPredictableEvents 40 12
proc G_UpdateForceSightBroadcasts 72 12
line 875
;856:
;857:extern int saberOffSound;
;858:extern int saberOnSound;
;859:
;860:/*
;861:==================
;862:G_UpdateClientBroadcasts
;863:
;864:Determines whether this client should be broadcast to any other clients.  
;865:A client is broadcast when another client is using force sight or is
;866:==================
;867:*/
;868:#define MAX_JEDIMASTER_DISTANCE	2500
;869:#define MAX_JEDIMASTER_FOV		100
;870:
;871:#define MAX_SIGHT_DISTANCE		1500
;872:#define MAX_SIGHT_FOV			100
;873:
;874:static void G_UpdateForceSightBroadcasts ( gentity_t *self )
;875:{
line 879
;876:	int i;
;877:
;878:	// Any clients with force sight on should see this client
;879:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $404
JUMPV
LABELV $401
line 880
;880:	{
line 881
;881:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 885
;882:		float	  dist;
;883:		vec3_t	  angles;
;884:	
;885:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $407
line 886
;886:		{
line 887
;887:			continue;
ADDRGP4 $402
JUMPV
LABELV $407
line 891
;888:		}
;889:
;890:		// Not using force sight so we shouldnt broadcast to this one
;891:		if ( !(ent->client->ps.fd.forcePowersActive & (1<<FP_SEE) ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 836
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $409
line 892
;892:		{
line 893
;893:			continue;
ADDRGP4 $402
JUMPV
LABELV $409
line 896
;894:		}
;895:
;896:		VectorSubtract( self->client->ps.origin, ent->client->ps.origin, angles );
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 897
;897:		dist = VectorLengthSquared ( angles );
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 898
;898:		vectoangles ( angles, angles );
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 901
;899:
;900:		// Too far away then just forget it
;901:		if ( dist > MAX_SIGHT_DISTANCE * MAX_SIGHT_DISTANCE )
ADDRLP4 20
INDIRF4
CNSTF4 1242125376
LEF4 $413
line 902
;902:		{
line 903
;903:			continue;
ADDRGP4 $402
JUMPV
LABELV $413
line 907
;904:		}
;905:		
;906:		// If not within the field of view then forget it
;907:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_SIGHT_FOV, angles ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $415
line 908
;908:		{
line 909
;909:			break;
ADDRGP4 $403
JUMPV
LABELV $415
line 914
;910:		}
;911:
;912:		// Turn on the broadcast bit for the master and since there is only one
;913:		// master we are done
;914:		self->r.broadcastClients[ent->s.clientNum/32] |= (1 << (ent->s.clientNum%32));
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 32
ASGNI4
ADDRLP4 68
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 916
;915:	
;916:		break;
ADDRGP4 $403
JUMPV
LABELV $402
line 879
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $404
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $401
LABELV $403
line 918
;917:	}
;918:}
LABELV $400
endproc G_UpdateForceSightBroadcasts 72 12
proc G_UpdateJediMasterBroadcasts 72 12
line 921
;919:
;920:static void G_UpdateJediMasterBroadcasts ( gentity_t *self )
;921:{
line 925
;922:	int i;
;923:
;924:	// Not jedi master mode then nothing to do
;925:	if ( g_gametype.integer != GT_JEDIMASTER )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $418
line 926
;926:	{
line 927
;927:		return;
ADDRGP4 $417
JUMPV
LABELV $418
line 931
;928:	}
;929:
;930:	// This client isnt the jedi master so it shouldnt broadcast
;931:	if ( !self->client->ps.isJediMaster )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 0
NEI4 $421
line 932
;932:	{
line 933
;933:		return;
ADDRGP4 $417
JUMPV
LABELV $421
line 937
;934:	}
;935:
;936:	// Broadcast ourself to all clients within range
;937:	for ( i = 0; i < level.numConnectedClients; i ++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 938
;938:	{
line 939
;939:		gentity_t *ent = &g_entities[level.sortedClients[i]];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 943
;940:		float	  dist;
;941:		vec3_t	  angles;
;942:
;943:		if ( ent == self )
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $429
line 944
;944:		{
line 945
;945:			continue;
ADDRGP4 $424
JUMPV
LABELV $429
line 948
;946:		}
;947:
;948:		VectorSubtract( self->client->ps.origin, ent->client->ps.origin, angles );
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 32
CNSTI4 20
ASGNI4
ADDRLP4 36
ADDRLP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
CNSTI4 24
ASGNI4
ADDRLP4 8+4
ADDRLP4 28
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 44
CNSTI4 408
ASGNI4
ADDRLP4 48
CNSTI4 28
ASGNI4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 949
;949:		dist = VectorLengthSquared ( angles );
ADDRLP4 8
ARGP4
ADDRLP4 52
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 950
;950:		vectoangles ( angles, angles );
ADDRLP4 8
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 953
;951:
;952:		// Too far away then just forget it
;953:		if ( dist > MAX_JEDIMASTER_DISTANCE * MAX_JEDIMASTER_DISTANCE )
ADDRLP4 20
INDIRF4
CNSTF4 1254013984
LEF4 $433
line 954
;954:		{
line 955
;955:			continue;
ADDRGP4 $424
JUMPV
LABELV $433
line 959
;956:		}
;957:		
;958:		// If not within the field of view then forget it
;959:		if ( !InFieldOfVision ( ent->client->ps.viewangles, MAX_JEDIMASTER_FOV, angles ) )
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
CNSTF4 1120403456
ARGF4
ADDRLP4 8
ARGP4
ADDRLP4 56
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $435
line 960
;960:		{
line 961
;961:			continue;
ADDRGP4 $424
JUMPV
LABELV $435
line 966
;962:		}
;963:
;964:		// Turn on the broadcast bit for the master and since there is only one
;965:		// master we are done
;966:		self->r.broadcastClients[ent->s.clientNum/32] |= (1 << (ent->s.clientNum%32));
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
ASGNI4
ADDRLP4 64
CNSTI4 32
ASGNI4
ADDRLP4 68
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
DIVI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
MODI4
LSHI4
BORI4
ASGNI4
line 967
;967:	}
LABELV $424
line 937
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 0
INDIRI4
ADDRGP4 level+72
INDIRI4
LTI4 $423
line 968
;968:}
LABELV $417
endproc G_UpdateJediMasterBroadcasts 72 12
export G_UpdateClientBroadcasts
proc G_UpdateClientBroadcasts 0 12
line 971
;969:
;970:void G_UpdateClientBroadcasts ( gentity_t *self )
;971:{
line 973
;972:	// Clear all the broadcast bits for this client
;973:	memset ( self->r.broadcastClients, 0, sizeof ( self->r.broadcastClients ) );
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 8
ARGI4
ADDRGP4 memset
CALLP4
pop
line 976
;974:
;975:	// The jedi master is broadcast to everyone in range
;976:	G_UpdateJediMasterBroadcasts ( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateJediMasterBroadcasts
CALLV
pop
line 979
;977:
;978:	// Anyone with force sight on should see this client
;979:	G_UpdateForceSightBroadcasts ( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateForceSightBroadcasts
CALLV
pop
line 980
;980:}
LABELV $437
endproc G_UpdateClientBroadcasts 0 12
export ClientThink_real
proc ClientThink_real 580 32
line 993
;981:
;982:/*
;983:==============
;984:ClientThink
;985:
;986:This will be called once for each client frame, which will
;987:usually be a couple times for each server frame on fast clients.
;988:
;989:If "g_synchronousClients 1" is set, this will be called exactly
;990:once for each server frame, which makes for smooth demo recording.
;991:==============
;992:*/
;993:void ClientThink_real( gentity_t *ent ) {
line 1001
;994:	gclient_t	*client;
;995:	pmove_t		pm;
;996:	int			oldEventSequence;
;997:	int			msec;
;998:	int			i;
;999:	usercmd_t	*ucmd;
;1000:
;1001:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 1004
;1002:
;1003:	// don't think if the client is not yet connected (and thus not yet spawned in)
;1004:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $439
line 1005
;1005:		return;
ADDRGP4 $438
JUMPV
LABELV $439
line 1008
;1006:	}
;1007:	// mark the time, so the connection sprite can be removed
;1008:	ucmd = &ent->client->pers.cmd;
ADDRLP4 384
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1372
ADDP4
ASGNP4
line 1011
;1009:
;1010:	// sanity check the command time to prevent speedup cheating
;1011:	if ( ucmd->serverTime > level.time + 200 ) {
ADDRLP4 384
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $441
line 1012
;1012:		ucmd->serverTime = level.time + 200;
ADDRLP4 384
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1014
;1013://		G_Printf("serverTime <<<<<\n" );
;1014:	}
LABELV $441
line 1015
;1015:	if ( ucmd->serverTime < level.time - 1000 ) {
ADDRLP4 384
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $445
line 1016
;1016:		ucmd->serverTime = level.time - 1000;
ADDRLP4 384
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 1018
;1017://		G_Printf("serverTime >>>>>\n" );
;1018:	} 
LABELV $445
line 1020
;1019:
;1020:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 388
ADDRLP4 384
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1023
;1021:	// following others may result in bad times, but we still want
;1022:	// to check for follow toggles
;1023:	if ( msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW ) {
ADDRLP4 388
INDIRI4
CNSTI4 1
GEI4 $449
ADDRLP4 4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 2
EQI4 $449
line 1024
;1024:		return;
ADDRGP4 $438
JUMPV
LABELV $449
line 1026
;1025:	}
;1026:	if ( msec > 200 ) {
ADDRLP4 388
INDIRI4
CNSTI4 200
LEI4 $451
line 1027
;1027:		msec = 200;
ADDRLP4 388
CNSTI4 200
ASGNI4
line 1028
;1028:	}
LABELV $451
line 1030
;1029:
;1030:	if ( pmove_msec.integer < 8 ) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $453
line 1031
;1031:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $456
ARGP4
ADDRGP4 $457
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1032
;1032:	}
ADDRGP4 $454
JUMPV
LABELV $453
line 1033
;1033:	else if (pmove_msec.integer > 33) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $458
line 1034
;1034:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $456
ARGP4
ADDRGP4 $461
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1035
;1035:	}
LABELV $458
LABELV $454
line 1037
;1036:
;1037:	if ( pmove_fixed.integer || client->pers.pmoveFixed ) {
ADDRLP4 396
CNSTI4 0
ASGNI4
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 396
INDIRI4
NEI4 $465
ADDRLP4 4
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
ADDRLP4 396
INDIRI4
EQI4 $462
LABELV $465
line 1038
;1038:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer-1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 1041
;1039:		//if (ucmd->serverTime - client->ps.commandTime <= 0)
;1040:		//	return;
;1041:	}
LABELV $462
line 1046
;1042:
;1043:	//
;1044:	// check for exiting intermission
;1045:	//
;1046:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $469
line 1047
;1047:		ClientIntermissionThink( client );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 1048
;1048:		return;
ADDRGP4 $438
JUMPV
LABELV $469
line 1052
;1049:	}
;1050:
;1051:	// spectators don't do much
;1052:	if ( client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $472
line 1053
;1053:		if ( client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRLP4 4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 3
NEI4 $474
line 1054
;1054:			return;
ADDRGP4 $438
JUMPV
LABELV $474
line 1056
;1055:		}
;1056:		SpectatorThink( ent, ucmd );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 384
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 1057
;1057:		return;
ADDRGP4 $438
JUMPV
LABELV $472
line 1060
;1058:	}
;1059:
;1060:	if (ent && ent->client && (ent->client->ps.eFlags & EF_INVULNERABLE))
ADDRLP4 400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 404
CNSTU4 0
ASGNU4
ADDRLP4 400
INDIRP4
CVPU4 4
ADDRLP4 404
INDIRU4
EQU4 $476
ADDRLP4 408
ADDRLP4 400
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 408
INDIRP4
CVPU4 4
ADDRLP4 404
INDIRU4
EQU4 $476
ADDRLP4 408
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $476
line 1061
;1061:	{
line 1062
;1062:		if (ent->client->invulnerableTimer <= level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $478
line 1063
;1063:		{
line 1064
;1064:			ent->client->ps.eFlags &= ~EF_INVULNERABLE;
ADDRLP4 412
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 412
INDIRP4
ADDRLP4 412
INDIRP4
INDIRI4
CNSTI4 -67108865
BANDI4
ASGNI4
line 1065
;1065:		}
LABELV $478
line 1066
;1066:	}
LABELV $476
line 1069
;1067:
;1068:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;1069:	if ( !ClientInactivityTimer( client ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 412
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
NEI4 $481
line 1070
;1070:		return;
ADDRGP4 $438
JUMPV
LABELV $481
line 1074
;1071:	}
;1072:
;1073:	// clear the rewards if time
;1074:	if ( level.time > client->rewardTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
LEI4 $483
line 1075
;1075:		client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 416
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 416
INDIRP4
ADDRLP4 416
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 1076
;1076:	}
LABELV $483
line 1078
;1077:
;1078:	if ( client->noclip ) {
ADDRLP4 4
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
line 1079
;1079:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1080
;1080:	} else if ( client->ps.eFlags & EF_DISINTEGRATION ) {
ADDRGP4 $487
JUMPV
LABELV $486
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $488
line 1081
;1081:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1082
;1082:	} else if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 $489
JUMPV
LABELV $488
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $490
line 1083
;1083:		client->ps.pm_type = PM_DEAD;
ADDRLP4 416
CNSTI4 4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 416
INDIRI4
ADDP4
ADDRLP4 416
INDIRI4
ASGNI4
line 1084
;1084:	} else {
ADDRGP4 $491
JUMPV
LABELV $490
line 1085
;1085:		if (client->ps.forceGripChangeMovetype)
ADDRLP4 4
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 1086
;1086:		{
line 1087
;1087:			client->ps.pm_type = client->ps.forceGripChangeMovetype;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1276
ADDP4
INDIRI4
ASGNI4
line 1088
;1088:		}
ADDRGP4 $493
JUMPV
LABELV $492
line 1090
;1089:		else
;1090:		{
line 1091
;1091:			client->ps.pm_type = PM_NORMAL;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1092
;1092:		}
LABELV $493
line 1093
;1093:	}
LABELV $491
LABELV $489
LABELV $487
line 1095
;1094:
;1095:	client->ps.gravity = g_gravity.value;
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 1098
;1096:
;1097:	// set speed
;1098:	client->ps.speed = g_speed.value;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1099
;1099:	client->ps.basespeed = g_speed.value;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 1101
;1100:
;1101:	if (ent->client->ps.duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $497
line 1102
;1102:	{
line 1103
;1103:		gentity_t *duelAgainst = &g_entities[ent->client->ps.duelIndex];
ADDRLP4 416
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1108
;1104:
;1105:		//Keep the time updated, so once this duel ends this player can't engage in a duel for another
;1106:		//10 seconds. This will give other people a chance to engage in duels in case this player wants
;1107:		//to engage again right after he's done fighting and someone else is waiting.
;1108:		ent->client->ps.fd.privateDuelTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1110
;1109:
;1110:		if (ent->client->ps.duelTime < level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $500
line 1111
;1111:		{
line 1113
;1112:			//Bring out the sabers
;1113:			if (ent->client->ps.weapon == WP_SABER && ent->client->ps.saberHolstered &&
ADDRLP4 420
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $503
ADDRLP4 424
CNSTI4 0
ASGNI4
ADDRLP4 420
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 424
INDIRI4
EQI4 $503
ADDRLP4 420
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
ADDRLP4 424
INDIRI4
EQI4 $503
line 1115
;1114:				ent->client->ps.duelTime)
;1115:			{
line 1116
;1116:				if (!saberOffSound || !saberOnSound)
ADDRLP4 428
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 428
INDIRI4
EQI4 $507
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 428
INDIRI4
NEI4 $505
LABELV $507
line 1117
;1117:				{
line 1118
;1118:					saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $508
ARGP4
ADDRLP4 432
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 432
INDIRI4
ASGNI4
line 1119
;1119:					saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $509
ARGP4
ADDRLP4 436
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 436
INDIRI4
ASGNI4
line 1120
;1120:				}
LABELV $505
line 1122
;1121:
;1122:				ent->client->ps.saberHolstered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 1123
;1123:				G_Sound(ent, CHAN_AUTO, saberOnSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOnSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1125
;1124:
;1125:				G_AddEvent(ent, EV_PRIVATE_DUEL, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1127
;1126:
;1127:				ent->client->ps.duelTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 0
ASGNI4
line 1128
;1128:			}
LABELV $503
line 1130
;1129:
;1130:			if (duelAgainst && duelAgainst->client && duelAgainst->inuse &&
ADDRLP4 432
CNSTU4 0
ASGNU4
ADDRLP4 416
INDIRP4
CVPU4 4
ADDRLP4 432
INDIRU4
EQU4 $501
ADDRLP4 436
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 436
INDIRP4
CVPU4 4
ADDRLP4 432
INDIRU4
EQU4 $501
ADDRLP4 440
CNSTI4 0
ASGNI4
ADDRLP4 416
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 440
INDIRI4
EQI4 $501
ADDRLP4 436
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $501
ADDRLP4 436
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 440
INDIRI4
EQI4 $501
ADDRLP4 436
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
ADDRLP4 440
INDIRI4
EQI4 $501
line 1133
;1131:				duelAgainst->client->ps.weapon == WP_SABER && duelAgainst->client->ps.saberHolstered &&
;1132:				duelAgainst->client->ps.duelTime)
;1133:			{
line 1134
;1134:				if (!saberOffSound || !saberOnSound)
ADDRLP4 444
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 444
INDIRI4
EQI4 $514
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 444
INDIRI4
NEI4 $512
LABELV $514
line 1135
;1135:				{
line 1136
;1136:					saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $508
ARGP4
ADDRLP4 448
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 448
INDIRI4
ASGNI4
line 1137
;1137:					saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $509
ARGP4
ADDRLP4 452
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 452
INDIRI4
ASGNI4
line 1138
;1138:				}
LABELV $512
line 1140
;1139:
;1140:				duelAgainst->client->ps.saberHolstered = qfalse;
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 1141
;1141:				G_Sound(duelAgainst, CHAN_AUTO, saberOnSound);
ADDRLP4 416
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 saberOnSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1143
;1142:
;1143:				G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 2);
ADDRLP4 416
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1145
;1144:
;1145:				duelAgainst->client->ps.duelTime = 0;
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
CNSTI4 0
ASGNI4
line 1146
;1146:			}
line 1147
;1147:		}
ADDRGP4 $501
JUMPV
LABELV $500
line 1149
;1148:		else
;1149:		{
line 1150
;1150:			client->ps.speed = 0;
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
CNSTI4 0
ASGNI4
line 1151
;1151:			client->ps.basespeed = 0;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
CNSTI4 0
ASGNI4
line 1152
;1152:			ucmd->forwardmove = 0;
ADDRLP4 384
INDIRP4
CNSTI4 24
ADDP4
CNSTI1 0
ASGNI1
line 1153
;1153:			ucmd->rightmove = 0;
ADDRLP4 384
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 1154
;1154:			ucmd->upmove = 0;
ADDRLP4 384
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1155
;1155:		}
LABELV $501
line 1157
;1156:
;1157:		if (!duelAgainst || !duelAgainst->client || !duelAgainst->inuse ||
ADDRLP4 424
CNSTU4 0
ASGNU4
ADDRLP4 416
INDIRP4
CVPU4 4
ADDRLP4 424
INDIRU4
EQU4 $519
ADDRLP4 428
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 428
INDIRP4
CVPU4 4
ADDRLP4 424
INDIRU4
EQU4 $519
ADDRLP4 416
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $519
ADDRLP4 428
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $515
LABELV $519
line 1159
;1158:			duelAgainst->client->ps.duelIndex != ent->s.number)
;1159:		{
line 1160
;1160:			ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 1161
;1161:			G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1162
;1162:		}
ADDRGP4 $516
JUMPV
LABELV $515
line 1163
;1163:		else if (duelAgainst->health < 1 || duelAgainst->client->ps.stats[STAT_HEALTH] < 1)
ADDRLP4 436
CNSTI4 1
ASGNI4
ADDRLP4 416
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 436
INDIRI4
LTI4 $522
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 436
INDIRI4
GEI4 $520
LABELV $522
line 1164
;1164:		{
line 1165
;1165:			ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 1166
;1166:			duelAgainst->client->ps.duelInProgress = 0;
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 1168
;1167:
;1168:			G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1169
;1169:			G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 0);
ADDRLP4 416
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1172
;1170:
;1171:			//Winner gets full health.. providing he's still alive
;1172:			if (ent->health > 0 && ent->client->ps.stats[STAT_HEALTH] > 0)
ADDRLP4 440
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 444
CNSTI4 0
ASGNI4
ADDRLP4 440
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
LEI4 $523
ADDRLP4 440
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 444
INDIRI4
LEI4 $523
line 1173
;1173:			{
line 1174
;1174:				if (ent->health < ent->client->ps.stats[STAT_MAX_HEALTH])
ADDRLP4 448
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 448
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 448
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $525
line 1175
;1175:				{
line 1176
;1176:					ent->client->ps.stats[STAT_HEALTH] = ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 452
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 456
ADDRLP4 452
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 460
ADDRLP4 456
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 452
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 460
INDIRI4
ASGNI4
ADDRLP4 456
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 460
INDIRI4
ASGNI4
line 1177
;1177:				}
LABELV $525
line 1179
;1178:
;1179:				if (g_spawnInvulnerability.integer)
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
CNSTI4 0
EQI4 $527
line 1180
;1180:				{
line 1181
;1181:					ent->client->ps.eFlags |= EF_INVULNERABLE;
ADDRLP4 452
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 452
INDIRP4
ADDRLP4 452
INDIRP4
INDIRI4
CNSTI4 67108864
BORI4
ASGNI4
line 1182
;1182:					ent->client->invulnerableTimer = level.time + g_spawnInvulnerability.integer;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_spawnInvulnerability+12
INDIRI4
ADDI4
ASGNI4
line 1183
;1183:				}
LABELV $527
line 1184
;1184:			}
LABELV $523
line 1191
;1185:
;1186:			/*
;1187:			trap_SendServerCommand( ent-g_entities, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER")) );
;1188:			trap_SendServerCommand( duelAgainst-g_entities, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER")) );
;1189:			*/
;1190:			//Private duel announcements are now made globally because we only want one duel at a time.
;1191:			if (ent->health > 0 && ent->client->ps.stats[STAT_HEALTH] > 0)
ADDRLP4 448
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 452
CNSTI4 0
ASGNI4
ADDRLP4 448
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 452
INDIRI4
LEI4 $532
ADDRLP4 448
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 452
INDIRI4
LEI4 $532
line 1192
;1192:			{
line 1193
;1193:				trap_SendServerCommand( -1, va("cp \"%s %s %s!\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELWINNER"), duelAgainst->client->pers.netname) );
ADDRGP4 $535
ARGP4
ADDRGP4 $536
ARGP4
ADDRLP4 456
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $534
ARGP4
ADDRLP4 460
CNSTI4 408
ASGNI4
ADDRLP4 464
CNSTI4 1416
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 460
INDIRI4
ADDP4
INDIRP4
ADDRLP4 464
INDIRI4
ADDP4
ARGP4
ADDRLP4 456
INDIRP4
ARGP4
ADDRLP4 416
INDIRP4
ADDRLP4 460
INDIRI4
ADDP4
INDIRP4
ADDRLP4 464
INDIRI4
ADDP4
ARGP4
ADDRLP4 468
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 468
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1194
;1194:			}
ADDRGP4 $521
JUMPV
LABELV $532
line 1196
;1195:			else
;1196:			{ //it was a draw, because we both managed to die in the same frame
line 1197
;1197:				trap_SendServerCommand( -1, va("cp \"%s\n\"", G_GetStripEdString("SVINGAME", "PLDUELTIE")) );
ADDRGP4 $535
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 456
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $537
ARGP4
ADDRLP4 456
INDIRP4
ARGP4
ADDRLP4 460
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1198
;1198:			}
line 1199
;1199:		}
ADDRGP4 $521
JUMPV
LABELV $520
line 1201
;1200:		else
;1201:		{
line 1203
;1202:			vec3_t vSub;
;1203:			float subLen = 0;
ADDRLP4 440
CNSTF4 0
ASGNF4
line 1205
;1204:
;1205:			VectorSubtract(ent->client->ps.origin, duelAgainst->client->ps.origin, vSub);
ADDRLP4 456
CNSTI4 408
ASGNI4
ADDRLP4 460
ADDRFP4 0
INDIRP4
ADDRLP4 456
INDIRI4
ADDP4
ASGNP4
ADDRLP4 464
CNSTI4 20
ASGNI4
ADDRLP4 468
ADDRLP4 416
INDIRP4
ADDRLP4 456
INDIRI4
ADDP4
ASGNP4
ADDRLP4 444
ADDRLP4 460
INDIRP4
INDIRP4
ADDRLP4 464
INDIRI4
ADDP4
INDIRF4
ADDRLP4 468
INDIRP4
INDIRP4
ADDRLP4 464
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 472
CNSTI4 24
ASGNI4
ADDRLP4 444+4
ADDRLP4 460
INDIRP4
INDIRP4
ADDRLP4 472
INDIRI4
ADDP4
INDIRF4
ADDRLP4 468
INDIRP4
INDIRP4
ADDRLP4 472
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 476
CNSTI4 408
ASGNI4
ADDRLP4 480
CNSTI4 28
ASGNI4
ADDRLP4 444+8
ADDRFP4 0
INDIRP4
ADDRLP4 476
INDIRI4
ADDP4
INDIRP4
ADDRLP4 480
INDIRI4
ADDP4
INDIRF4
ADDRLP4 416
INDIRP4
ADDRLP4 476
INDIRI4
ADDP4
INDIRP4
ADDRLP4 480
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1206
;1206:			subLen = VectorLength(vSub);
ADDRLP4 444
ARGP4
ADDRLP4 484
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 440
ADDRLP4 484
INDIRF4
ASGNF4
line 1208
;1207:
;1208:			if (subLen >= 1024)
ADDRLP4 440
INDIRF4
CNSTF4 1149239296
LTF4 $541
line 1209
;1209:			{
line 1210
;1210:				ent->client->ps.duelInProgress = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 1211
;1211:				duelAgainst->client->ps.duelInProgress = 0;
ADDRLP4 416
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 0
ASGNI4
line 1213
;1212:
;1213:				G_AddEvent(ent, EV_PRIVATE_DUEL, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1214
;1214:				G_AddEvent(duelAgainst, EV_PRIVATE_DUEL, 0);
ADDRLP4 416
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1216
;1215:
;1216:				trap_SendServerCommand( -1, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLDUELSTOP")) );
ADDRGP4 $535
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 488
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $543
ARGP4
ADDRLP4 488
INDIRP4
ARGP4
ADDRLP4 492
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 492
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1217
;1217:			}
LABELV $541
line 1218
;1218:		}
LABELV $521
LABELV $516
line 1219
;1219:	}
LABELV $497
line 1227
;1220:
;1221:	/*
;1222:	if ( client->ps.powerups[PW_HASTE] ) {
;1223:		client->ps.speed *= 1.3;
;1224:	}
;1225:	*/
;1226:
;1227:	if (client->ps.usingATST && ent->health > 0)
ADDRLP4 416
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
ADDRLP4 416
INDIRI4
EQI4 $545
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 416
INDIRI4
LEI4 $545
line 1228
;1228:	{ //we have special shot clip boxes as an ATST
line 1229
;1229:		ent->r.contents |= CONTENTS_NOSHOT;
ADDRLP4 420
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 420
INDIRP4
ADDRLP4 420
INDIRP4
INDIRI4
CNSTI4 2097152
BORI4
ASGNI4
line 1230
;1230:		ATST_ManageDamageBoxes(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ATST_ManageDamageBoxes
CALLV
pop
line 1231
;1231:	}
ADDRGP4 $546
JUMPV
LABELV $545
line 1233
;1232:	else
;1233:	{
line 1234
;1234:		ent->r.contents &= ~CONTENTS_NOSHOT;
ADDRLP4 420
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
ASGNP4
ADDRLP4 420
INDIRP4
ADDRLP4 420
INDIRP4
INDIRI4
CNSTI4 -2097153
BANDI4
ASGNI4
line 1235
;1235:		client->damageBoxHandle_Head = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1636
ADDP4
CNSTI4 0
ASGNI4
line 1236
;1236:		client->damageBoxHandle_RLeg = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1640
ADDP4
CNSTI4 0
ASGNI4
line 1237
;1237:		client->damageBoxHandle_LLeg = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1644
ADDP4
CNSTI4 0
ASGNI4
line 1238
;1238:	}
LABELV $546
line 1244
;1239:
;1240:	//rww - moved this stuff into the pmove code so that it's predicted properly
;1241:	//BG_AdjustClientSpeed(&client->ps, &client->pers.cmd, level.time);
;1242:
;1243:	// set up for pmove
;1244:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 392
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ASGNI4
line 1246
;1245:
;1246:	memset (&pm, 0, sizeof(pm));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 376
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1248
;1247:
;1248:	if ( ent->flags & FL_FORCE_GESTURE ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $547
line 1249
;1249:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 420
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 420
INDIRP4
ADDRLP4 420
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 1250
;1250:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 424
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1388
ADDP4
ASGNP4
ADDRLP4 424
INDIRP4
ADDRLP4 424
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1251
;1251:	}
LABELV $547
line 1253
;1252:
;1253:	if (ent->client && ent->client->ps.fallingToDeath &&
ADDRLP4 420
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $549
ADDRLP4 424
ADDRLP4 420
INDIRP4
CNSTI4 1340
ADDP4
INDIRI4
ASGNI4
ADDRLP4 424
INDIRI4
CNSTI4 0
EQI4 $549
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
SUBI4
ADDRLP4 424
INDIRI4
LEI4 $549
line 1255
;1254:		(level.time - FALL_FADE_TIME) > ent->client->ps.fallingToDeath)
;1255:	{ //die!
line 1256
;1256:		player_die(ent, ent, ent, 100000, MOD_FALLING);
ADDRLP4 428
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
ADDRLP4 428
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 34
ARGI4
ADDRGP4 player_die
CALLV
pop
line 1257
;1257:		respawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1258
;1258:		ent->client->ps.fallingToDeath = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1340
ADDP4
CNSTI4 0
ASGNI4
line 1260
;1259:
;1260:		G_MuteSound(ent->s.number, CHAN_VOICE); //stop screaming, because you are dead!
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_MuteSound
CALLV
pop
line 1261
;1261:	}
LABELV $549
line 1263
;1262:
;1263:	if (ent->client->ps.otherKillerTime > level.time &&
ADDRLP4 428
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 428
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $552
ADDRLP4 428
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $552
ADDRLP4 428
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $552
line 1266
;1264:		ent->client->ps.groundEntityNum != ENTITYNUM_NONE &&
;1265:		ent->client->ps.otherKillerDebounceTime < level.time)
;1266:	{
line 1267
;1267:		ent->client->ps.otherKillerTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 0
ASGNI4
line 1268
;1268:		ent->client->ps.otherKiller = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1023
ASGNI4
line 1269
;1269:	}
ADDRGP4 $553
JUMPV
LABELV $552
line 1270
;1270:	else if (ent->client->ps.otherKillerTime > level.time &&
ADDRLP4 432
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 432
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $556
ADDRLP4 432
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $556
line 1272
;1271:		ent->client->ps.groundEntityNum == ENTITYNUM_NONE)
;1272:	{
line 1273
;1273:		if (ent->client->ps.otherKillerDebounceTime < (level.time + 100))
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
GEI4 $559
line 1274
;1274:		{
line 1275
;1275:			ent->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1276
;1276:		}
LABELV $559
line 1277
;1277:	}
LABELV $556
LABELV $553
line 1282
;1278:
;1279://	WP_ForcePowersUpdate( ent, msec, ucmd); //update any active force powers
;1280://	WP_SaberPositionUpdate(ent, ucmd); //check the server-side saber point, do apprioriate server-side actions (effects are cs-only)
;1281:
;1282:	if ((ent->client->pers.cmd.buttons & BUTTON_USE) && ent->client->ps.useDelay < level.time)
ADDRLP4 436
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 436
INDIRP4
CNSTI4 1388
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $563
ADDRLP4 436
INDIRP4
CNSTI4 1344
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $563
line 1283
;1283:	{
line 1284
;1284:		TryUse(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 TryUse
CALLV
pop
line 1285
;1285:		ent->client->ps.useDelay = level.time + 100;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1344
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1286
;1286:	}
LABELV $563
line 1288
;1287:
;1288:	pm.ps = &client->ps;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1289
;1289:	pm.cmd = *ucmd;
ADDRLP4 8+4
ADDRLP4 384
INDIRP4
INDIRB
ASGNB 28
line 1290
;1290:	if ( pm.ps->pm_type == PM_DEAD ) {
ADDRLP4 440
CNSTI4 4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 440
INDIRI4
ADDP4
INDIRI4
ADDRLP4 440
INDIRI4
NEI4 $568
line 1291
;1291:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 8+32
CNSTI4 17
ASGNI4
line 1292
;1292:	}
ADDRGP4 $569
JUMPV
LABELV $568
line 1293
;1293:	else if ( ent->r.svFlags & SVF_BOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $571
line 1294
;1294:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 8+32
CNSTI4 337
ASGNI4
line 1295
;1295:	}
ADDRGP4 $572
JUMPV
LABELV $571
line 1296
;1296:	else {
line 1297
;1297:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 8+32
CNSTI4 273
ASGNI4
line 1298
;1298:	}
LABELV $572
LABELV $569
line 1299
;1299:	pm.trace = trap_Trace;
ADDRLP4 8+240
ADDRGP4 trap_Trace
ASGNP4
line 1300
;1300:	pm.pointcontents = trap_PointContents;
ADDRLP4 8+244
ADDRGP4 trap_PointContents
ASGNP4
line 1301
;1301:	pm.debugLevel = g_debugMove.integer;
ADDRLP4 8+36
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 1302
;1302:	pm.noFootsteps = ( g_dmflags.integer & DF_NO_FOOTSTEPS ) > 0;
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
LEI4 $582
ADDRLP4 444
CNSTI4 1
ASGNI4
ADDRGP4 $583
JUMPV
LABELV $582
ADDRLP4 444
CNSTI4 0
ASGNI4
LABELV $583
ADDRLP4 8+40
ADDRLP4 444
INDIRI4
ASGNI4
line 1304
;1303:
;1304:	pm.pmove_fixed = pmove_fixed.integer | client->pers.pmoveFixed;
ADDRLP4 8+232
ADDRGP4 pmove_fixed+12
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1412
ADDP4
INDIRI4
BORI4
ASGNI4
line 1305
;1305:	pm.pmove_msec = pmove_msec.integer;
ADDRLP4 8+236
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 1307
;1306:
;1307:	pm.animations = bgGlobalAnimations;//NULL;
ADDRLP4 8+224
ADDRGP4 bgGlobalAnimations
ASGNP4
line 1309
;1308:
;1309:	pm.gametype = g_gametype.integer;
ADDRLP4 8+220
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
line 1311
;1310:
;1311:	VectorCopy( client->ps.origin, client->oldOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 1596
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1313
;1312:
;1313:	if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
ADDRLP4 452
CNSTI4 0
ASGNI4
ADDRGP4 level+9004
INDIRI4
ADDRLP4 452
INDIRI4
EQI4 $591
ADDRGP4 g_singlePlayer+12
INDIRI4
ADDRLP4 452
INDIRI4
EQI4 $591
line 1314
;1314:		if ( level.time - level.intermissionQueued >= 1000  ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $595
line 1315
;1315:			pm.cmd.buttons = 0;
ADDRLP4 8+4+16
CNSTI4 0
ASGNI4
line 1316
;1316:			pm.cmd.forwardmove = 0;
ADDRLP4 8+4+24
CNSTI1 0
ASGNI1
line 1317
;1317:			pm.cmd.rightmove = 0;
ADDRLP4 8+4+25
CNSTI1 0
ASGNI1
line 1318
;1318:			pm.cmd.upmove = 0;
ADDRLP4 8+4+26
CNSTI1 0
ASGNI1
line 1319
;1319:			if ( level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500 ) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
CNSTI4 2000
LTI4 $607
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+9004
INDIRI4
SUBI4
CNSTI4 2500
GTI4 $607
line 1320
;1320:				trap_SendConsoleCommand( EXEC_APPEND, "centerview\n");
CNSTI4 2
ARGI4
ADDRGP4 $613
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1321
;1321:			}
LABELV $607
line 1322
;1322:			ent->client->ps.pm_type = PM_SPINTERMISSION;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 7
ASGNI4
line 1323
;1323:		}
LABELV $595
line 1324
;1324:	}
LABELV $591
line 1326
;1325:
;1326:	for ( i = 0 ; i < MAX_CLIENTS ; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $614
line 1327
;1327:	{
line 1328
;1328:		if (g_entities[i].inuse && g_entities[i].client)
ADDRLP4 456
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 456
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $618
ADDRLP4 456
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $618
line 1329
;1329:		{
line 1330
;1330:			pm.bgClients[i] = &g_entities[i].client->ps;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8+248
ADDP4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
ASGNP4
line 1331
;1331:		}
LABELV $618
line 1332
;1332:	}
LABELV $615
line 1326
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $614
line 1334
;1333:
;1334:	if (ent->client->ps.saberLockTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $624
line 1335
;1335:	{
line 1336
;1336:		gentity_t *blockOpp = &g_entities[ent->client->ps.saberLockEnemy];
ADDRLP4 456
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1338
;1337:
;1338:		if (blockOpp && blockOpp->inuse && blockOpp->client)
ADDRLP4 464
CNSTU4 0
ASGNU4
ADDRLP4 456
INDIRP4
CVPU4 4
ADDRLP4 464
INDIRU4
EQU4 $627
ADDRLP4 456
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $627
ADDRLP4 456
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 464
INDIRU4
EQU4 $627
line 1339
;1339:		{
line 1343
;1340:			vec3_t lockDir, lockAng;
;1341:
;1342:			//VectorClear( ent->client->ps.velocity );
;1343:			VectorSubtract( blockOpp->r.currentOrigin, ent->r.currentOrigin, lockDir );
ADDRLP4 496
CNSTI4 368
ASGNI4
ADDRLP4 500
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
ADDRLP4 456
INDIRP4
ADDRLP4 496
INDIRI4
ADDP4
INDIRF4
ADDRLP4 500
INDIRP4
ADDRLP4 496
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 504
CNSTI4 372
ASGNI4
ADDRLP4 468+4
ADDRLP4 456
INDIRP4
ADDRLP4 504
INDIRI4
ADDP4
INDIRF4
ADDRLP4 500
INDIRP4
ADDRLP4 504
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 508
CNSTI4 376
ASGNI4
ADDRLP4 468+8
ADDRLP4 456
INDIRP4
ADDRLP4 508
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 508
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1345
;1344:			//lockAng[YAW] = vectoyaw( defDir );
;1345:			vectoangles(lockDir, lockAng);
ADDRLP4 468
ARGP4
ADDRLP4 480
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1346
;1346:			SetClientViewAngle( ent, lockAng );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 480
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1347
;1347:		}
LABELV $627
line 1349
;1348:
;1349:		if ( ( ent->client->buttons & BUTTON_ATTACK ) && ! ( ent->client->oldbuttons & BUTTON_ATTACK ) )
ADDRLP4 468
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 472
CNSTI4 1
ASGNI4
ADDRLP4 476
CNSTI4 0
ASGNI4
ADDRLP4 468
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ADDRLP4 472
INDIRI4
BANDI4
ADDRLP4 476
INDIRI4
EQI4 $631
ADDRLP4 468
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
ADDRLP4 472
INDIRI4
BANDI4
ADDRLP4 476
INDIRI4
NEI4 $631
line 1350
;1350:		{
line 1351
;1351:			ent->client->ps.saberLockHits++;
ADDRLP4 480
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 480
INDIRP4
ADDRLP4 480
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1352
;1352:		}
LABELV $631
line 1353
;1353:		if (ent->client->ps.saberLockHits > 2)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2
LEI4 $625
line 1354
;1354:		{
line 1355
;1355:			if (!ent->client->ps.saberLockAdvance)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
NEI4 $635
line 1356
;1356:			{
line 1357
;1357:				ent->client->ps.saberLockHits -= 3;
ADDRLP4 480
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 480
INDIRP4
ADDRLP4 480
INDIRP4
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 1358
;1358:			}
LABELV $635
line 1359
;1359:			ent->client->ps.saberLockAdvance = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1360
;1360:		}
line 1361
;1361:	}
ADDRGP4 $625
JUMPV
LABELV $624
line 1363
;1362:	else
;1363:	{
line 1364
;1364:		ent->client->ps.saberLockFrame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 1365
;1365:	}
LABELV $625
line 1367
;1366:
;1367:	Pmove (&pm);
ADDRLP4 8
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1369
;1368:
;1369:	switch(pm.cmd.generic_cmd)
ADDRLP4 456
ADDRLP4 8+4+23
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
LTI4 $638
ADDRLP4 456
INDIRI4
CNSTI4 20
GTI4 $638
ADDRLP4 456
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $679
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $679
address $638
address $643
address $644
address $645
address $646
address $647
address $648
address $649
address $650
address $651
address $652
address $653
address $654
address $655
address $656
address $659
address $662
address $665
address $670
address $675
address $678
code
line 1370
;1370:	{
line 1372
;1371:	case 0:
;1372:		break;
LABELV $643
line 1374
;1373:	case GENCMD_SABERSWITCH:
;1374:		Cmd_ToggleSaber_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 1375
;1375:		break;
ADDRGP4 $638
JUMPV
LABELV $644
line 1377
;1376:	case GENCMD_ENGAGE_DUEL:
;1377:		Cmd_EngageDuel_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_EngageDuel_f
CALLV
pop
line 1378
;1378:		break;
ADDRGP4 $638
JUMPV
LABELV $645
line 1380
;1379:	case GENCMD_FORCE_HEAL:
;1380:		ForceHeal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceHeal
CALLV
pop
line 1381
;1381:		break;
ADDRGP4 $638
JUMPV
LABELV $646
line 1383
;1382:	case GENCMD_FORCE_SPEED:
;1383:		ForceSpeed(ent, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceSpeed
CALLV
pop
line 1384
;1384:		break;
ADDRGP4 $638
JUMPV
LABELV $647
line 1386
;1385:	case GENCMD_FORCE_THROW:
;1386:		ForceThrow(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 1387
;1387:		break;
ADDRGP4 $638
JUMPV
LABELV $648
line 1389
;1388:	case GENCMD_FORCE_PULL:
;1389:		ForceThrow(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 ForceThrow
CALLV
pop
line 1390
;1390:		break;
ADDRGP4 $638
JUMPV
LABELV $649
line 1392
;1391:	case GENCMD_FORCE_DISTRACT:
;1392:		ForceTelepathy(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTelepathy
CALLV
pop
line 1393
;1393:		break;
ADDRGP4 $638
JUMPV
LABELV $650
line 1395
;1394:	case GENCMD_FORCE_RAGE:
;1395:		ForceRage(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceRage
CALLV
pop
line 1396
;1396:		break;
ADDRGP4 $638
JUMPV
LABELV $651
line 1398
;1397:	case GENCMD_FORCE_PROTECT:
;1398:		ForceProtect(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceProtect
CALLV
pop
line 1399
;1399:		break;
ADDRGP4 $638
JUMPV
LABELV $652
line 1401
;1400:	case GENCMD_FORCE_ABSORB:
;1401:		ForceAbsorb(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceAbsorb
CALLV
pop
line 1402
;1402:		break;
ADDRGP4 $638
JUMPV
LABELV $653
line 1404
;1403:	case GENCMD_FORCE_HEALOTHER:
;1404:		ForceTeamHeal(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamHeal
CALLV
pop
line 1405
;1405:		break;
ADDRGP4 $638
JUMPV
LABELV $654
line 1407
;1406:	case GENCMD_FORCE_FORCEPOWEROTHER:
;1407:		ForceTeamForceReplenish(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceTeamForceReplenish
CALLV
pop
line 1408
;1408:		break;
ADDRGP4 $638
JUMPV
LABELV $655
line 1410
;1409:	case GENCMD_FORCE_SEEING:
;1410:		ForceSeeing(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ForceSeeing
CALLV
pop
line 1411
;1411:		break;
ADDRGP4 $638
JUMPV
LABELV $656
line 1413
;1412:	case GENCMD_USE_SEEKER:
;1413:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SEEKER)) &&
ADDRLP4 464
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 464
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $638
ADDRLP4 464
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 468
INDIRI4
CNSTI4 0
EQI4 $638
line 1415
;1414:			G_ItemUsable(&ent->client->ps, HI_SEEKER) )
;1415:		{
line 1416
;1416:			ItemUse_Seeker(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Seeker
CALLV
pop
line 1417
;1417:			G_AddEvent(ent, EV_USE_ITEM0+HI_SEEKER, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 41
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1418
;1418:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SEEKER);
ADDRLP4 472
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 472
INDIRP4
ADDRLP4 472
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1419
;1419:		}
line 1420
;1420:		break;
ADDRGP4 $638
JUMPV
LABELV $659
line 1422
;1421:	case GENCMD_USE_FIELD:
;1422:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SHIELD)) &&
ADDRLP4 472
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 472
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $638
ADDRLP4 472
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 476
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 476
INDIRI4
CNSTI4 0
EQI4 $638
line 1424
;1423:			G_ItemUsable(&ent->client->ps, HI_SHIELD) )
;1424:		{
line 1425
;1425:			ItemUse_Shield(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Shield
CALLV
pop
line 1426
;1426:			G_AddEvent(ent, EV_USE_ITEM0+HI_SHIELD, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 42
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1427
;1427:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SHIELD);
ADDRLP4 480
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 480
INDIRP4
ADDRLP4 480
INDIRP4
INDIRI4
CNSTI4 -5
BANDI4
ASGNI4
line 1428
;1428:		}
line 1429
;1429:		break;
ADDRGP4 $638
JUMPV
LABELV $662
line 1431
;1430:	case GENCMD_USE_BACTA:
;1431:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_MEDPAC)) &&
ADDRLP4 480
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 480
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $638
ADDRLP4 480
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 484
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 484
INDIRI4
CNSTI4 0
EQI4 $638
line 1433
;1432:			G_ItemUsable(&ent->client->ps, HI_MEDPAC) )
;1433:		{
line 1434
;1434:			ItemUse_MedPack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_MedPack
CALLV
pop
line 1435
;1435:			G_AddEvent(ent, EV_USE_ITEM0+HI_MEDPAC, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 43
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1436
;1436:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_MEDPAC);
ADDRLP4 488
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 488
INDIRP4
ADDRLP4 488
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1437
;1437:		}
line 1438
;1438:		break;
ADDRGP4 $638
JUMPV
LABELV $665
line 1440
;1439:	case GENCMD_USE_ELECTROBINOCULARS:
;1440:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_BINOCULARS)) &&
ADDRLP4 488
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 488
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $638
ADDRLP4 488
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 492
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 492
INDIRI4
CNSTI4 0
EQI4 $638
line 1442
;1441:			G_ItemUsable(&ent->client->ps, HI_BINOCULARS) )
;1442:		{
line 1443
;1443:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 1444
;1444:			if (ent->client->ps.zoomMode == 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
NEI4 $668
line 1445
;1445:			{
line 1446
;1446:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1447
;1447:			}
ADDRGP4 $638
JUMPV
LABELV $668
line 1449
;1448:			else
;1449:			{
line 1450
;1450:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1451
;1451:			}
line 1452
;1452:		}
line 1453
;1453:		break;
ADDRGP4 $638
JUMPV
LABELV $670
line 1455
;1454:	case GENCMD_ZOOM:
;1455:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_BINOCULARS)) &&
ADDRLP4 496
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 496
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $638
ADDRLP4 496
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 500
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 500
INDIRI4
CNSTI4 0
EQI4 $638
line 1457
;1456:			G_ItemUsable(&ent->client->ps, HI_BINOCULARS) )
;1457:		{
line 1458
;1458:			ItemUse_Binoculars(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Binoculars
CALLV
pop
line 1459
;1459:			if (ent->client->ps.zoomMode == 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1320
ADDP4
INDIRI4
CNSTI4 0
NEI4 $673
line 1460
;1460:			{
line 1461
;1461:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1462
;1462:			}
ADDRGP4 $638
JUMPV
LABELV $673
line 1464
;1463:			else
;1464:			{
line 1465
;1465:				G_AddEvent(ent, EV_USE_ITEM0+HI_BINOCULARS, 2);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 45
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1466
;1466:			}
line 1467
;1467:		}
line 1468
;1468:		break;
ADDRGP4 $638
JUMPV
LABELV $675
line 1470
;1469:	case GENCMD_USE_SENTRY:
;1470:		if ( (ent->client->ps.stats[STAT_HOLDABLE_ITEMS] & (1 << HI_SENTRY_GUN)) &&
ADDRLP4 504
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 504
INDIRP4
CNSTI4 224
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $638
ADDRLP4 504
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 508
ADDRGP4 G_ItemUsable
CALLI4
ASGNI4
ADDRLP4 508
INDIRI4
CNSTI4 0
EQI4 $638
line 1472
;1471:			G_ItemUsable(&ent->client->ps, HI_SENTRY_GUN) )
;1472:		{
line 1473
;1473:			ItemUse_Sentry(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ItemUse_Sentry
CALLV
pop
line 1474
;1474:			G_AddEvent(ent, EV_USE_ITEM0+HI_SENTRY_GUN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 46
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1475
;1475:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] &= ~(1 << HI_SENTRY_GUN);
ADDRLP4 512
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 512
INDIRP4
ADDRLP4 512
INDIRP4
INDIRI4
CNSTI4 -65
BANDI4
ASGNI4
line 1476
;1476:		}
line 1477
;1477:		break;
ADDRGP4 $638
JUMPV
LABELV $678
line 1479
;1478:	case GENCMD_SABERATTACKCYCLE:
;1479:		Cmd_SaberAttackCycle_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_SaberAttackCycle_f
CALLV
pop
line 1480
;1480:		break;
line 1482
;1481:	default:
;1482:		break;
LABELV $638
line 1486
;1483:	}
;1484:
;1485:	// save results of pmove
;1486:	if ( ent->client->ps.eventSequence != oldEventSequence ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 392
INDIRI4
EQI4 $680
line 1487
;1487:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1488
;1488:	}
LABELV $680
line 1489
;1489:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $683
line 1490
;1490:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
ADDRLP4 464
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
ARGP4
ADDRLP4 464
INDIRP4
ARGP4
ADDRLP4 468
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 1491
;1491:	}
ADDRGP4 $684
JUMPV
LABELV $683
line 1492
;1492:	else {
line 1493
;1493:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 464
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 464
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1494
;1494:	}
LABELV $684
line 1495
;1495:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1497
;1496:
;1497:	if ( !( ent->client->ps.eFlags & EF_FIRING ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $686
line 1498
;1498:		client->fireHeld = qfalse;		// for grapple
ADDRLP4 4
INDIRP4
CNSTI4 1696
ADDP4
CNSTI4 0
ASGNI4
line 1499
;1499:	}
LABELV $686
line 1502
;1500:
;1501:	// use the snapped origin for linking so it matches client predicted versions
;1502:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 464
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 464
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1504
;1503:
;1504:	VectorCopy (pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8+188
INDIRB
ASGNB 12
line 1505
;1505:	VectorCopy (pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 8+200
INDIRB
ASGNB 12
line 1507
;1506:
;1507:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
ADDRLP4 8+216
INDIRI4
ASGNI4
line 1508
;1508:	ent->watertype = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 8+212
INDIRI4
ASGNI4
line 1511
;1509:
;1510:	// execute client events
;1511:	ClientEvents( ent, oldEventSequence );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 392
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 1513
;1512:
;1513:	if ( pm.useEvent )
ADDRLP4 8+184
INDIRI4
CNSTI4 0
EQI4 $692
line 1514
;1514:	{
line 1517
;1515:		//TODO: Use
;1516://		TryUse( ent );
;1517:	}
LABELV $692
line 1520
;1518:
;1519:	// link entity now, after any personal teleporters have been used
;1520:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1521
;1521:	if ( !ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $695
line 1522
;1522:		G_TouchTriggers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 1523
;1523:	}
LABELV $695
line 1526
;1524:
;1525:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;1526:	VectorCopy( ent->client->ps.origin, ent->r.currentOrigin );
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 468
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1532
;1527:
;1528:	//test for solid areas in the AAS file
;1529://	BotTestAAS(ent->r.currentOrigin);
;1530:
;1531:	// touch other objects
;1532:	ClientImpacts( ent, &pm );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 1535
;1533:
;1534:	// save results of triggers and client events
;1535:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 392
INDIRI4
EQI4 $697
line 1536
;1536:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1537
;1537:	}
LABELV $697
line 1540
;1538:
;1539:	// swap and latch button actions
;1540:	client->oldbuttons = client->buttons;
ADDRLP4 4
INDIRP4
CNSTI4 1588
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ASGNI4
line 1541
;1541:	client->buttons = ucmd->buttons;
ADDRLP4 4
INDIRP4
CNSTI4 1584
ADDP4
ADDRLP4 384
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 1542
;1542:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 480
ADDRLP4 4
INDIRP4
CNSTI4 1592
ADDP4
ASGNP4
ADDRLP4 480
INDIRP4
ADDRLP4 480
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1584
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1588
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 1545
;1543:
;1544:	// Did we kick someone in our pmove sequence?
;1545:	if (client->ps.forceKickFlip)
ADDRLP4 4
INDIRP4
CNSTI4 1280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $700
line 1546
;1546:	{
line 1547
;1547:		gentity_t *faceKicked = &g_entities[client->ps.forceKickFlip-1];
ADDRLP4 484
CNSTI4 828
ADDRLP4 4
INDIRP4
CNSTI4 1280
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities-828
ADDP4
ASGNP4
line 1549
;1548:
;1549:		if (faceKicked && faceKicked->client && (!OnSameTeam(ent, faceKicked) || g_friendlyFire.integer) &&
ADDRLP4 492
CNSTU4 0
ASGNU4
ADDRLP4 484
INDIRP4
CVPU4 4
ADDRLP4 492
INDIRU4
EQU4 $703
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 492
INDIRU4
EQU4 $703
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 484
INDIRP4
ARGP4
ADDRLP4 496
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 500
CNSTI4 0
ASGNI4
ADDRLP4 496
INDIRI4
ADDRLP4 500
INDIRI4
EQI4 $706
ADDRGP4 g_friendlyFire+12
INDIRI4
ADDRLP4 500
INDIRI4
EQI4 $703
LABELV $706
ADDRLP4 504
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 504
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $707
ADDRLP4 504
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $703
LABELV $707
ADDRLP4 508
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 508
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $708
ADDRLP4 508
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRLP4 484
INDIRP4
INDIRI4
NEI4 $703
LABELV $708
line 1552
;1550:			(!faceKicked->client->ps.duelInProgress || faceKicked->client->ps.duelIndex == ent->s.number) &&
;1551:			(!ent->client->ps.duelInProgress || ent->client->ps.duelIndex == faceKicked->s.number))
;1552:		{
line 1553
;1553:			if ( faceKicked && faceKicked->client && faceKicked->health && faceKicked->takedamage )
ADDRLP4 516
CNSTU4 0
ASGNU4
ADDRLP4 484
INDIRP4
CVPU4 4
ADDRLP4 516
INDIRU4
EQU4 $709
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 516
INDIRU4
EQU4 $709
ADDRLP4 520
CNSTI4 0
ASGNI4
ADDRLP4 484
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 520
INDIRI4
EQI4 $709
ADDRLP4 484
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 520
INDIRI4
EQI4 $709
line 1554
;1554:			{//push them away and do pain
line 1556
;1555:				vec3_t oppDir;
;1556:				int strength = (int)VectorNormalize2( client->ps.velocity, oppDir );
ADDRLP4 4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 528
ARGP4
ADDRLP4 540
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 540
INDIRF4
CVFI4 4
ASGNI4
line 1558
;1557:
;1558:				strength *= 0.05;
ADDRLP4 524
CNSTF4 1028443341
ADDRLP4 524
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 1560
;1559:
;1560:				VectorScale( oppDir, -1, oppDir );
ADDRLP4 544
CNSTF4 3212836864
ASGNF4
ADDRLP4 528
ADDRLP4 544
INDIRF4
ADDRLP4 528
INDIRF4
MULF4
ASGNF4
ADDRLP4 528+4
ADDRLP4 544
INDIRF4
ADDRLP4 528+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 528+8
CNSTF4 3212836864
ADDRLP4 528+8
INDIRF4
MULF4
ASGNF4
line 1562
;1561:
;1562:				G_Damage( faceKicked, ent, ent, oppDir, client->ps.origin, strength, DAMAGE_NO_ARMOR, MOD_MELEE );
ADDRLP4 484
INDIRP4
ARGP4
ADDRLP4 548
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 548
INDIRP4
ARGP4
ADDRLP4 548
INDIRP4
ARGP4
ADDRLP4 528
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 524
INDIRI4
ARGI4
ADDRLP4 552
CNSTI4 2
ASGNI4
ADDRLP4 552
INDIRI4
ARGI4
ADDRLP4 552
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1564
;1563:
;1564:				if (faceKicked->health > 0 &&
ADDRLP4 560
CNSTI4 0
ASGNI4
ADDRLP4 484
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 560
INDIRI4
LEI4 $715
ADDRLP4 564
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 564
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 560
INDIRI4
LEI4 $715
ADDRLP4 564
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 8
EQI4 $715
line 1567
;1565:					faceKicked->client->ps.stats[STAT_HEALTH] > 0 &&
;1566:					faceKicked->client->ps.forceHandExtend != HANDEXTEND_KNOCKDOWN)
;1567:				{
line 1568
;1568:					if (Q_irand(1, 10) <= 3)
CNSTI4 1
ARGI4
CNSTI4 10
ARGI4
ADDRLP4 568
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 568
INDIRI4
CNSTI4 3
GTI4 $717
line 1569
;1569:					{ //only actually knock over sometimes, but always do velocity hit
line 1570
;1570:						faceKicked->client->ps.forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 8
ASGNI4
line 1571
;1571:						faceKicked->client->ps.forceHandExtendTime = level.time + 1100;
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1240
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 1572
;1572:						faceKicked->client->ps.forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 0
ASGNI4
line 1573
;1573:					}
LABELV $717
line 1575
;1574:
;1575:					faceKicked->client->ps.otherKiller = ent->s.number;
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 748
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1576
;1576:					faceKicked->client->ps.otherKillerTime = level.time + 5000;
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 1577
;1577:					faceKicked->client->ps.otherKillerDebounceTime = level.time + 100;
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1579
;1578:
;1579:					faceKicked->client->ps.velocity[0] = oppDir[0]*(strength*40);
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 528
INDIRF4
CNSTI4 40
ADDRLP4 524
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 1580
;1580:					faceKicked->client->ps.velocity[1] = oppDir[1]*(strength*40);
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 528+4
INDIRF4
CNSTI4 40
ADDRLP4 524
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 1581
;1581:					faceKicked->client->ps.velocity[2] = 200;
ADDRLP4 484
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 1582
;1582:				}
LABELV $715
line 1584
;1583:
;1584:				G_Sound( faceKicked, CHAN_AUTO, G_SoundIndex( va("sound/weapons/melee/punch%d", Q_irand(1, 4)) ) );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 568
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRGP4 $723
ARGP4
ADDRLP4 568
INDIRI4
ARGI4
ADDRLP4 572
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 572
INDIRP4
ARGP4
ADDRLP4 576
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 484
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 576
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1585
;1585:			}
LABELV $709
line 1586
;1586:		}
LABELV $703
line 1588
;1587:
;1588:		client->ps.forceKickFlip = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1280
ADDP4
CNSTI4 0
ASGNI4
line 1589
;1589:	}
LABELV $700
line 1592
;1590:
;1591:	// check for respawning
;1592:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $724
line 1594
;1593:		// wait for the attack button to be pressed
;1594:		if ( level.time > client->respawnTime ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1672
ADDP4
INDIRI4
LEI4 $438
line 1596
;1595:			// forcerespawn is to prevent users from waiting out powerups
;1596:			if ( g_forcerespawn.integer > 0 && 
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $729
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1672
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_forcerespawn+12
INDIRI4
MULI4
LEI4 $729
line 1597
;1597:				( level.time - client->respawnTime ) > g_forcerespawn.integer * 1000 ) {
line 1598
;1598:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1599
;1599:				return;
ADDRGP4 $438
JUMPV
LABELV $729
line 1603
;1600:			}
;1601:		
;1602:			// pressing attack or use is the normal respawn method
;1603:			if ( ucmd->buttons & ( BUTTON_ATTACK | BUTTON_USE_HOLDABLE ) ) {
ADDRLP4 384
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $438
line 1604
;1604:				respawn( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1605
;1605:			}
line 1606
;1606:		}
line 1607
;1607:		return;
ADDRGP4 $438
JUMPV
LABELV $724
line 1611
;1608:	}
;1609:
;1610:	// perform once-a-second actions
;1611:	ClientTimerActions( ent, msec );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 388
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1613
;1612:
;1613:	G_UpdateClientBroadcasts ( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UpdateClientBroadcasts
CALLV
pop
line 1614
;1614:}
LABELV $438
endproc ClientThink_real 580 32
export G_CheckClientTimeouts
proc G_CheckClientTimeouts 0 8
line 1624
;1615:
;1616:/*
;1617:==================
;1618:G_CheckClientTimeouts
;1619:
;1620:Checks whether a client has exceded any timeouts and act accordingly
;1621:==================
;1622:*/
;1623:void G_CheckClientTimeouts ( gentity_t *ent )
;1624:{
line 1626
;1625:	// Only timeout supported right now is the timeout to spectator mode
;1626:	if ( !g_timeouttospec.integer )
ADDRGP4 g_timeouttospec+12
INDIRI4
CNSTI4 0
NEI4 $737
line 1627
;1627:	{
line 1628
;1628:		return;
ADDRGP4 $736
JUMPV
LABELV $737
line 1632
;1629:	}
;1630:
;1631:	// Already a spectator, no need to boot them to spectator
;1632:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $740
line 1633
;1633:	{
line 1634
;1634:		return;
ADDRGP4 $736
JUMPV
LABELV $740
line 1639
;1635:	}
;1636:
;1637:	// See how long its been since a command was received by the client and if its 
;1638:	// longer than the timeout to spectator then force this client into spectator mode
;1639:	if ( level.time - ent->client->pers.cmd.serverTime > g_timeouttospec.integer * 1000 )
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1372
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
ADDRGP4 g_timeouttospec+12
INDIRI4
MULI4
LEI4 $742
line 1640
;1640:	{
line 1641
;1641:		SetTeam ( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $746
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 1642
;1642:	}
LABELV $742
line 1643
;1643:}
LABELV $736
endproc G_CheckClientTimeouts 0 8
export ClientThink
proc ClientThink 8 8
line 1652
;1644:
;1645:/*
;1646:==================
;1647:ClientThink
;1648:
;1649:A new command has arrived from the client
;1650:==================
;1651:*/
;1652:void ClientThink( int clientNum ) {
line 1655
;1653:	gentity_t *ent;
;1654:
;1655:	ent = g_entities + clientNum;
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1656
;1656:	trap_GetUsercmd( clientNum, &ent->client->pers.cmd );
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1372
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1660
;1657:
;1658:	// mark the time we got info, so we can display the
;1659:	// phone jack if they don't get any for a while
;1660:	ent->client->lastCmdTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1662
;1661:
;1662:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 4
INDIRI4
NEI4 $749
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $749
line 1663
;1663:		ClientThink_real( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1664
;1664:	}
LABELV $749
line 1665
;1665:}
LABELV $747
endproc ClientThink 8 8
export G_RunClient
proc G_RunClient 4 4
line 1668
;1666:
;1667:
;1668:void G_RunClient( gentity_t *ent ) {
line 1669
;1669:	if ( !(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $753
ADDRGP4 g_synchronousClients+12
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $753
line 1670
;1670:		return;
ADDRGP4 $752
JUMPV
LABELV $753
line 1672
;1671:	}
;1672:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1372
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1673
;1673:	ClientThink_real( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1674
;1674:}
LABELV $752
endproc G_RunClient 4 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 24 8
line 1683
;1675:
;1676:
;1677:/*
;1678:==================
;1679:SpectatorClientEndFrame
;1680:
;1681:==================
;1682:*/
;1683:void SpectatorClientEndFrame( gentity_t *ent ) {
line 1687
;1684:	gclient_t	*cl;
;1685:
;1686:	// if we are doing a chase cam or a remote view, grab the latest info
;1687:	if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 2
NEI4 $758
line 1690
;1688:		int		clientNum, flags;
;1689:
;1690:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 1693
;1691:
;1692:		// team follow1 and team follow2 go to whatever clients are playing
;1693:		if ( clientNum == -1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $760
line 1694
;1694:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+212
INDIRI4
ASGNI4
line 1695
;1695:		} else if ( clientNum == -2 ) {
ADDRGP4 $761
JUMPV
LABELV $760
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $763
line 1696
;1696:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+216
INDIRI4
ASGNI4
line 1697
;1697:		}
LABELV $763
LABELV $761
line 1698
;1698:		if ( clientNum >= 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $766
line 1699
;1699:			cl = &level.clients[ clientNum ];
ADDRLP4 0
CNSTI4 1756
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1700
;1700:			if ( cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
NEI4 $768
ADDRLP4 12
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
EQI4 $768
line 1701
;1701:				flags = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 16
CNSTI4 108
ASGNI4
ADDRLP4 8
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 16
INDIRI4
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1702
;1702:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 1368
line 1703
;1703:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1704
;1704:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1705
;1705:				return;
ADDRGP4 $757
JUMPV
LABELV $768
line 1706
;1706:			} else {
line 1708
;1707:				// drop them to free spectators unless they are dedicated camera followers
;1708:				if ( ent->client->sess.spectatorClient >= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
CNSTI4 0
LTI4 $770
line 1709
;1709:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 1710
;1710:					ClientBegin( ent->client - level.clients, qtrue );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1756
DIVI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1711
;1711:				}
LABELV $770
line 1712
;1712:			}
line 1713
;1713:		}
LABELV $766
line 1714
;1714:	}
LABELV $758
line 1716
;1715:
;1716:	if ( ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 3
NEI4 $772
line 1717
;1717:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1718
;1718:	} else {
ADDRGP4 $773
JUMPV
LABELV $772
line 1719
;1719:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1720
;1720:	}
LABELV $773
line 1721
;1721:}
LABELV $757
endproc SpectatorClientEndFrame 24 8
export ClientEndFrame
proc ClientEndFrame 20 16
line 1732
;1722:
;1723:/*
;1724:==============
;1725:ClientEndFrame
;1726:
;1727:Called at the end of each server frame for each connected client
;1728:A fast client will have multiple ClientThink for each ClientEdFrame,
;1729:while a slow client may have multiple ClientEndFrame between ClientThink.
;1730:==============
;1731:*/
;1732:void ClientEndFrame( gentity_t *ent ) {
line 1736
;1733:	int			i;
;1734:	clientPersistant_t	*pers;
;1735:
;1736:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $775
line 1737
;1737:		SpectatorClientEndFrame( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1738
;1738:		return;
ADDRGP4 $774
JUMPV
LABELV $775
line 1741
;1739:	}
;1740:
;1741:	pers = &ent->client->pers;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
ASGNP4
line 1744
;1742:
;1743:	// turn off any expired powerups
;1744:	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $777
line 1745
;1745:		if ( ent->client->ps.powerups[ i ] < level.time ) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $781
line 1746
;1746:			ent->client->ps.powerups[ i ] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1747
;1747:		}
LABELV $781
line 1748
;1748:	}
LABELV $778
line 1744
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $777
line 1762
;1749:
;1750:	// save network bandwidth
;1751:#if 0
;1752:	if ( !g_synchronousClients->integer && (ent->client->ps.pm_type == PM_NORMAL || ent->client->ps.pm_type == PM_FLOAT) ) {
;1753:		// FIXME: this must change eventually for non-sync demo recording
;1754:		VectorClear( ent->client->ps.viewangles );
;1755:	}
;1756:#endif
;1757:
;1758:	//
;1759:	// If the end of unit layout is displayed, don't give
;1760:	// the player any normal movement attributes
;1761:	//
;1762:	if ( level.intermissiontime ) {
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $784
line 1763
;1763:		return;
ADDRGP4 $774
JUMPV
LABELV $784
line 1767
;1764:	}
;1765:
;1766:	// burn from lava, etc
;1767:	P_WorldEffects (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1770
;1768:
;1769:	// apply all the damage taken this frame
;1770:	P_DamageFeedback (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1773
;1771:
;1772:	// add the EF_CONNECTION flag if we haven't gotten commands recently
;1773:	if ( level.time - ent->client->lastCmdTime > 1000 ) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1580
ADDP4
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $787
line 1774
;1774:		ent->s.eFlags |= EF_CONNECTION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1775
;1775:	} else {
ADDRGP4 $788
JUMPV
LABELV $787
line 1776
;1776:		ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1777
;1777:	}
LABELV $788
line 1779
;1778:
;1779:	ent->client->ps.stats[STAT_HEALTH] = ent->health;	// FIXME: get rid of ent->health...
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
line 1781
;1780:
;1781:	G_SetClientSound (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1784
;1782:
;1783:	// set the latest infor
;1784:	if (g_smoothClients.integer) {
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $790
line 1785
;1785:		BG_PlayerStateToEntityStateExtraPolate( &ent->client->ps, &ent->s, ent->client->ps.commandTime, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityStateExtraPolate
CALLV
pop
line 1786
;1786:	}
ADDRGP4 $791
JUMPV
LABELV $790
line 1787
;1787:	else {
line 1788
;1788:		BG_PlayerStateToEntityState( &ent->client->ps, &ent->s, qtrue );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1789
;1789:	}
LABELV $791
line 1790
;1790:	SendPendingPredictableEvents( &ent->client->ps );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1795
;1791:
;1792:	// set the bit for the reachability area the client is currently in
;1793://	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1794://	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1795:}
LABELV $774
endproc ClientEndFrame 20 16
import saberOnSound
import saberOffSound
import G_ApplyKnockback
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
import WP_SaberInitBladeData
import WP_SaberCanBlock
import WP_SaberPositionUpdate
import WP_ForcePowerStop
import HasSetSaberOnly
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
LABELV $746
char 1 115
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 0
align 1
LABELV $723
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
char 1 109
char 1 101
char 1 108
char 1 101
char 1 101
char 1 47
char 1 112
char 1 117
char 1 110
char 1 99
char 1 104
char 1 37
char 1 100
char 1 0
align 1
LABELV $613
char 1 99
char 1 101
char 1 110
char 1 116
char 1 101
char 1 114
char 1 118
char 1 105
char 1 101
char 1 119
char 1 10
char 1 0
align 1
LABELV $544
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 83
char 1 84
char 1 79
char 1 80
char 1 0
align 1
LABELV $543
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $538
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 84
char 1 73
char 1 69
char 1 0
align 1
LABELV $537
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $536
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 87
char 1 73
char 1 78
char 1 78
char 1 69
char 1 82
char 1 0
align 1
LABELV $535
char 1 83
char 1 86
char 1 73
char 1 78
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $534
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $509
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
LABELV $508
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
LABELV $461
char 1 51
char 1 51
char 1 0
align 1
LABELV $457
char 1 56
char 1 0
align 1
LABELV $456
char 1 112
char 1 109
char 1 111
char 1 118
char 1 101
char 1 95
char 1 109
char 1 115
char 1 101
char 1 99
char 1 0
align 1
LABELV $346
char 1 99
char 1 112
char 1 32
char 1 34
char 1 84
char 1 101
char 1 110
char 1 32
char 1 115
char 1 101
char 1 99
char 1 111
char 1 110
char 1 100
char 1 115
char 1 32
char 1 117
char 1 110
char 1 116
char 1 105
char 1 108
char 1 32
char 1 105
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 105
char 1 116
char 1 121
char 1 32
char 1 100
char 1 114
char 1 111
char 1 112
char 1 33
char 1 10
char 1 34
char 1 0
align 1
LABELV $342
char 1 68
char 1 114
char 1 111
char 1 112
char 1 112
char 1 101
char 1 100
char 1 32
char 1 100
char 1 117
char 1 101
char 1 32
char 1 116
char 1 111
char 1 32
char 1 105
char 1 110
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $126
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 103
char 1 117
char 1 114
char 1 112
char 1 50
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
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 47
char 1 103
char 1 117
char 1 114
char 1 112
char 1 49
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
