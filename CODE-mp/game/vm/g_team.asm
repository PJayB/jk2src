export Team_InitGame
code
proc Team_InitGame 8 12
file "../g_team.c"
line 22
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:#include "bg_saga.h"
;6:
;7:
;8:typedef struct teamgame_s {
;9:	float			last_flag_capture;
;10:	int				last_capture_team;
;11:	flagStatus_t	redStatus;	// CTF
;12:	flagStatus_t	blueStatus;	// CTF
;13:	flagStatus_t	flagStatus;	// One Flag CTF
;14:	int				redTakenTime;
;15:	int				blueTakenTime;
;16:} teamgame_t;
;17:
;18:teamgame_t teamgame;
;19:
;20:void Team_SetFlagStatus( int team, flagStatus_t status );
;21:
;22:void Team_InitGame( void ) {
line 23
;23:	memset(&teamgame, 0, sizeof teamgame);
ADDRGP4 teamgame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 28
ARGI4
ADDRGP4 memset
CALLP4
pop
line 25
;24:
;25:	switch( g_gametype.integer ) {
ADDRLP4 0
ADDRGP4 g_gametype+12
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $82
ADDRGP4 $80
JUMPV
LABELV $82
line 28
;26:	case GT_CTF:
;27:	case GT_CTY:
;28:		teamgame.redStatus = teamgame.blueStatus = -1; // Invalid to force update
ADDRLP4 4
CNSTI4 -1
ASGNI4
ADDRGP4 teamgame+12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 teamgame+8
ADDRLP4 4
INDIRI4
ASGNI4
line 29
;29:		Team_SetFlagStatus( TEAM_RED, FLAG_ATBASE );
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 30
;30:		Team_SetFlagStatus( TEAM_BLUE, FLAG_ATBASE );
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 31
;31:		break;
line 33
;32:	default:
;33:		break;
LABELV $80
line 35
;34:	}
;35:}
LABELV $78
endproc Team_InitGame 8 12
export OtherTeam
proc OtherTeam 0 0
line 37
;36:
;37:int OtherTeam(int team) {
line 38
;38:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $86
line 39
;39:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $85
JUMPV
LABELV $86
line 40
;40:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $88
line 41
;41:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $85
JUMPV
LABELV $88
line 42
;42:	return team;
ADDRFP4 0
INDIRI4
RETI4
LABELV $85
endproc OtherTeam 0 0
export TeamName
proc TeamName 0 0
line 45
;43:}
;44:
;45:const char *TeamName(int team)  {
line 46
;46:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $91
line 47
;47:		return "RED";
ADDRGP4 $93
RETP4
ADDRGP4 $90
JUMPV
LABELV $91
line 48
;48:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $94
line 49
;49:		return "BLUE";
ADDRGP4 $96
RETP4
ADDRGP4 $90
JUMPV
LABELV $94
line 50
;50:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $97
line 51
;51:		return "SPECTATOR";
ADDRGP4 $99
RETP4
ADDRGP4 $90
JUMPV
LABELV $97
line 52
;52:	return "FREE";
ADDRGP4 $100
RETP4
LABELV $90
endproc TeamName 0 0
export OtherTeamName
proc OtherTeamName 0 0
line 55
;53:}
;54:
;55:const char *OtherTeamName(int team) {
line 56
;56:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $102
line 57
;57:		return "BLUE";
ADDRGP4 $96
RETP4
ADDRGP4 $101
JUMPV
LABELV $102
line 58
;58:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $104
line 59
;59:		return "RED";
ADDRGP4 $93
RETP4
ADDRGP4 $101
JUMPV
LABELV $104
line 60
;60:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $106
line 61
;61:		return "SPECTATOR";
ADDRGP4 $99
RETP4
ADDRGP4 $101
JUMPV
LABELV $106
line 62
;62:	return "FREE";
ADDRGP4 $100
RETP4
LABELV $101
endproc OtherTeamName 0 0
export TeamColorString
proc TeamColorString 0 0
line 65
;63:}
;64:
;65:const char *TeamColorString(int team) {
line 66
;66:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $109
line 67
;67:		return S_COLOR_RED;
ADDRGP4 $111
RETP4
ADDRGP4 $108
JUMPV
LABELV $109
line 68
;68:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $112
line 69
;69:		return S_COLOR_BLUE;
ADDRGP4 $114
RETP4
ADDRGP4 $108
JUMPV
LABELV $112
line 70
;70:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $115
line 71
;71:		return S_COLOR_YELLOW;
ADDRGP4 $117
RETP4
ADDRGP4 $108
JUMPV
LABELV $115
line 72
;72:	return S_COLOR_WHITE;
ADDRGP4 $118
RETP4
LABELV $108
endproc TeamColorString 0 0
export PrintCTFMessage
proc PrintCTFMessage 12 8
line 101
;73:}
;74:
;75:// NULL for everyone
;76:/*
;77:void QDECL PrintMsg( gentity_t *ent, const char *fmt, ... ) {
;78:	char		msg[1024];
;79:	va_list		argptr;
;80:	char		*p;
;81:	
;82:	va_start (argptr,fmt);
;83:	if (vsprintf (msg, fmt, argptr) > sizeof(msg)) {
;84:		G_Error ( "PrintMsg overrun" );
;85:	}
;86:	va_end (argptr);
;87:
;88:	// double quotes are bad
;89:	while ((p = strchr(msg, '"')) != NULL)
;90:		*p = '\'';
;91:
;92:	trap_SendServerCommand ( ( (ent == NULL) ? -1 : ent-g_entities ), va("print \"%s\"", msg ));
;93:}
;94:*/
;95://Printing messages to players via this method is no longer done, StripEd stuff is client only.
;96:
;97:
;98://plIndex used to print pl->client->pers.netname
;99://teamIndex used to print team name
;100:void PrintCTFMessage(int plIndex, int teamIndex, int ctfMessage)
;101:{
line 104
;102:	gentity_t *te;
;103:
;104:	if (plIndex == -1)
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $120
line 105
;105:	{
line 106
;106:		plIndex = MAX_CLIENTS+1;
ADDRFP4 0
CNSTI4 33
ASGNI4
line 107
;107:	}
LABELV $120
line 108
;108:	if (teamIndex == -1)
ADDRFP4 4
INDIRI4
CNSTI4 -1
NEI4 $122
line 109
;109:	{
line 110
;110:		teamIndex = 50;
ADDRFP4 4
CNSTI4 50
ASGNI4
line 111
;111:	}
LABELV $122
line 113
;112:
;113:	te = G_TempEntity(vec3_origin, EV_CTFMESSAGE);
ADDRGP4 vec3_origin
ARGP4
CNSTI4 87
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 114
;114:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 115
;115:	te->s.eventParm = ctfMessage;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 116
;116:	te->s.trickedentindex = plIndex;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 117
;117:	if (ctfMessage == CTFMESSAGE_PLAYER_CAPTURED_FLAG)
ADDRFP4 8
INDIRI4
CNSTI4 3
NEI4 $124
line 118
;118:	{
line 119
;119:		if (teamIndex == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $126
line 120
;120:		{
line 121
;121:			te->s.trickedentindex2 = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 2
ASGNI4
line 122
;122:		}
ADDRGP4 $125
JUMPV
LABELV $126
line 124
;123:		else
;124:		{
line 125
;125:			te->s.trickedentindex2 = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 1
ASGNI4
line 126
;126:		}
line 127
;127:	}
ADDRGP4 $125
JUMPV
LABELV $124
line 129
;128:	else
;129:	{
line 130
;130:		te->s.trickedentindex2 = teamIndex;
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 131
;131:	}
LABELV $125
line 132
;132:}
LABELV $119
endproc PrintCTFMessage 12 8
export AddTeamScore
proc AddTeamScore 16 8
line 142
;133:
;134:/*
;135:==============
;136:AddTeamScore
;137:
;138: used for gametype > GT_TEAM
;139: for gametype GT_TEAM the level.teamScores is updated in AddScore in g_combat.c
;140:==============
;141:*/
;142:void AddTeamScore(vec3_t origin, int team, int score) {
line 145
;143:	gentity_t	*te;
;144:
;145:	te = G_TempEntity(origin, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 146
;146:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 148
;147:
;148:	if ( team == TEAM_RED ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $129
line 149
;149:		if ( level.teamScores[ TEAM_RED ] + score == level.teamScores[ TEAM_BLUE ] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $131
line 151
;150:			//teams are tied sound
;151:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 10
ASGNI4
line 152
;152:		}
ADDRGP4 $130
JUMPV
LABELV $131
line 153
;153:		else if ( level.teamScores[ TEAM_RED ] <= level.teamScores[ TEAM_BLUE ] &&
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
GTI4 $137
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $137
line 154
;154:					level.teamScores[ TEAM_RED ] + score > level.teamScores[ TEAM_BLUE ]) {
line 156
;155:			// red took the lead sound
;156:			te->s.eventParm = GTS_REDTEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 8
ASGNI4
line 157
;157:		}
ADDRGP4 $130
JUMPV
LABELV $137
line 158
;158:		else {
line 160
;159:			// red scored sound
;160:			te->s.eventParm = GTS_REDTEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 6
ASGNI4
line 161
;161:		}
line 162
;162:	}
ADDRGP4 $130
JUMPV
LABELV $129
line 163
;163:	else {
line 164
;164:		if ( level.teamScores[ TEAM_BLUE ] + score == level.teamScores[ TEAM_RED ] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
NEI4 $147
line 166
;165:			//teams are tied sound
;166:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 10
ASGNI4
line 167
;167:		}
ADDRGP4 $148
JUMPV
LABELV $147
line 168
;168:		else if ( level.teamScores[ TEAM_BLUE ] <= level.teamScores[ TEAM_RED ] &&
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
GTI4 $153
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $153
line 169
;169:					level.teamScores[ TEAM_BLUE ] + score > level.teamScores[ TEAM_RED ]) {
line 171
;170:			// blue took the lead sound
;171:			te->s.eventParm = GTS_BLUETEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 9
ASGNI4
line 172
;172:		}
ADDRGP4 $154
JUMPV
LABELV $153
line 173
;173:		else {
line 175
;174:			// blue scored sound
;175:			te->s.eventParm = GTS_BLUETEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 7
ASGNI4
line 176
;176:		}
LABELV $154
LABELV $148
line 177
;177:	}
LABELV $130
line 178
;178:	level.teamScores[ team ] += score;
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 179
;179:}
LABELV $128
endproc AddTeamScore 16 8
export OnSameTeam
proc OnSameTeam 16 0
line 186
;180:
;181:/*
;182:==============
;183:OnSameTeam
;184:==============
;185:*/
;186:qboolean OnSameTeam( gentity_t *ent1, gentity_t *ent2 ) {
line 187
;187:	if ( !ent1->client || !ent2->client ) {
ADDRLP4 0
CNSTI4 408
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $167
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $165
LABELV $167
line 188
;188:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $164
JUMPV
LABELV $165
line 191
;189:	}
;190:
;191:	if ( g_gametype.integer < GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $168
line 192
;192:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $164
JUMPV
LABELV $168
line 195
;193:	}
;194:
;195:	if ( ent1->client->sess.sessionTeam == ent2->client->sess.sessionTeam ) {
ADDRLP4 8
CNSTI4 408
ASGNI4
ADDRLP4 12
CNSTI4 1520
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $171
line 196
;196:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $164
JUMPV
LABELV $171
line 199
;197:	}
;198:
;199:	return qfalse;
CNSTI4 0
RETI4
LABELV $164
endproc OnSameTeam 16 0
data
align 1
LABELV ctfFlagStatusRemap
char 1 48
char 1 49
char 1 42
char 1 42
char 1 50
export Team_SetFlagStatus
code
proc Team_SetFlagStatus 12 8
line 205
;200:}
;201:
;202:
;203:static char ctfFlagStatusRemap[] = { '0', '1', '*', '*', '2' };
;204:
;205:void Team_SetFlagStatus( int team, flagStatus_t status ) {
line 206
;206:	qboolean modified = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 208
;207:
;208:	switch( team ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $186
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $176
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $181
ADDRGP4 $174
JUMPV
LABELV $176
line 210
;209:	case TEAM_RED:	// CTF
;210:		if( teamgame.redStatus != status ) {
ADDRGP4 teamgame+8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $175
line 211
;211:			teamgame.redStatus = status;
ADDRGP4 teamgame+8
ADDRFP4 4
INDIRI4
ASGNI4
line 212
;212:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 213
;213:		}
line 214
;214:		break;
ADDRGP4 $175
JUMPV
LABELV $181
line 217
;215:
;216:	case TEAM_BLUE:	// CTF
;217:		if( teamgame.blueStatus != status ) {
ADDRGP4 teamgame+12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $175
line 218
;218:			teamgame.blueStatus = status;
ADDRGP4 teamgame+12
ADDRFP4 4
INDIRI4
ASGNI4
line 219
;219:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 220
;220:		}
line 221
;221:		break;
ADDRGP4 $175
JUMPV
LABELV $186
line 224
;222:
;223:	case TEAM_FREE:	// One Flag CTF
;224:		if( teamgame.flagStatus != status ) {
ADDRGP4 teamgame+16
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $175
line 225
;225:			teamgame.flagStatus = status;
ADDRGP4 teamgame+16
ADDRFP4 4
INDIRI4
ASGNI4
line 226
;226:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 227
;227:		}
line 228
;228:		break;
LABELV $174
LABELV $175
line 231
;229:	}
;230:
;231:	if( modified ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $191
line 234
;232:		char st[4];
;233:
;234:		if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $197
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $193
LABELV $197
line 235
;235:			st[0] = ctfFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 236
;236:			st[1] = ctfFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 237
;237:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 238
;238:		}
LABELV $193
line 240
;239:
;240:		trap_SetConfigstring( CS_FLAGSTATUS, st );
CNSTI4 23
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 241
;241:	}
LABELV $191
line 242
;242:}
LABELV $173
endproc Team_SetFlagStatus 12 8
export Team_CheckDroppedItem
proc Team_CheckDroppedItem 0 8
line 244
;243:
;244:void Team_CheckDroppedItem( gentity_t *dropped ) {
line 245
;245:	if( dropped->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $203
line 246
;246:		Team_SetFlagStatus( TEAM_RED, FLAG_DROPPED );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 247
;247:	}
ADDRGP4 $204
JUMPV
LABELV $203
line 248
;248:	else if( dropped->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $205
line 249
;249:		Team_SetFlagStatus( TEAM_BLUE, FLAG_DROPPED );
CNSTI4 2
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 250
;250:	}
ADDRGP4 $206
JUMPV
LABELV $205
line 251
;251:	else if( dropped->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $207
line 252
;252:		Team_SetFlagStatus( TEAM_FREE, FLAG_DROPPED );
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 253
;253:	}
LABELV $207
LABELV $206
LABELV $204
line 254
;254:}
LABELV $202
endproc Team_CheckDroppedItem 0 8
export Team_ForceGesture
proc Team_ForceGesture 12 0
line 261
;255:
;256:/*
;257:================
;258:Team_ForceGesture
;259:================
;260:*/
;261:void Team_ForceGesture(int team) {
line 265
;262:	int i;
;263:	gentity_t *ent;
;264:
;265:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $210
line 266
;266:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 267
;267:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $214
line 268
;268:			continue;
ADDRGP4 $211
JUMPV
LABELV $214
line 269
;269:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $216
line 270
;270:			continue;
ADDRGP4 $211
JUMPV
LABELV $216
line 271
;271:		if (ent->client->sess.sessionTeam != team)
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $218
line 272
;272:			continue;
ADDRGP4 $211
JUMPV
LABELV $218
line 274
;273:		//
;274:		ent->flags |= FL_FORCE_GESTURE;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 275
;275:	}
LABELV $211
line 265
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $210
line 276
;276:}
LABELV $209
endproc Team_ForceGesture 12 0
export Team_FragBonuses
proc Team_FragBonuses 276 12
line 288
;277:
;278:/*
;279:================
;280:Team_FragBonuses
;281:
;282:Calculate the bonuses for flag defense, flag carrier defense, etc.
;283:Note that bonuses are not cumulative.  You get one, they are in importance
;284:order.
;285:================
;286:*/
;287:void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker)
;288:{
line 294
;289:	int i;
;290:	gentity_t *ent;
;291:	int flag_pw, enemy_flag_pw;
;292:	int otherteam;
;293:	int tokens;
;294:	gentity_t *flag, *carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 300
;295:	char *c;
;296:	vec3_t v1, v2;
;297:	int team;
;298:
;299:	// no bonus for fragging yourself or team mates
;300:	if (!targ->client || !attacker->client || targ == attacker || OnSameTeam(targ, attacker))
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 408
ASGNI4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $225
ADDRLP4 76
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $225
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
EQU4 $225
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $221
LABELV $225
line 301
;301:		return;
ADDRGP4 $220
JUMPV
LABELV $221
line 303
;302:
;303:	team = targ->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 304
;304:	otherteam = OtherTeam(targ->client->sess.sessionTeam);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 84
INDIRI4
ASGNI4
line 305
;305:	if (otherteam < 0)
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $226
line 306
;306:		return; // whoever died isn't on a team
ADDRGP4 $220
JUMPV
LABELV $226
line 309
;307:
;308:	// same team, if the flag at base, check to he has the enemy flag
;309:	if (team == TEAM_RED) {
ADDRLP4 52
INDIRI4
CNSTI4 1
NEI4 $228
line 310
;310:		flag_pw = PW_REDFLAG;
ADDRLP4 16
CNSTI4 4
ASGNI4
line 311
;311:		enemy_flag_pw = PW_BLUEFLAG;
ADDRLP4 60
CNSTI4 5
ASGNI4
line 312
;312:	} else {
ADDRGP4 $229
JUMPV
LABELV $228
line 313
;313:		flag_pw = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 5
ASGNI4
line 314
;314:		enemy_flag_pw = PW_REDFLAG;
ADDRLP4 60
CNSTI4 4
ASGNI4
line 315
;315:	}
LABELV $229
line 318
;316:
;317:	// did the attacker frag the flag carrier?
;318:	tokens = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 319
;319:	if (targ->client->ps.powerups[enemy_flag_pw]) {
ADDRLP4 60
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
CNSTI4 0
EQI4 $230
line 320
;320:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 321
;321:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 322
;322:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1484
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 325
;323:		//PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's flag carrier!\n",
;324:		//	attacker->client->pers.netname, TeamName(team));
;325:		PrintCTFMessage(attacker->s.number, team, CTFMESSAGE_FRAGGED_FLAG_CARRIER);
ADDRFP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 329
;326:
;327:		// the target had the flag, clear the hurt carrier
;328:		// field on the other team
;329:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $233
line 330
;330:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 331
;331:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $238
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $238
line 332
;332:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
CNSTF4 0
ASGNF4
LABELV $238
line 333
;333:		}
LABELV $234
line 329
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $236
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $233
line 334
;334:		return;
ADDRGP4 $220
JUMPV
LABELV $230
line 338
;335:	}
;336:
;337:	// did the attacker frag a head carrier? other->client->ps.generic1
;338:	if (tokens) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $240
line 339
;339:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 340
;340:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS * tokens * tokens);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 20
ADDRLP4 56
INDIRI4
MULI4
ADDRLP4 56
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 341
;341:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1484
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 347
;342:		//PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's skull carrier!\n",
;343:		//	attacker->client->pers.netname, TeamName(team));
;344:
;345:		// the target had the flag, clear the hurt carrier
;346:		// field on the other team
;347:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $246
JUMPV
LABELV $243
line 348
;348:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 349
;349:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $248
line 350
;350:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
CNSTF4 0
ASGNF4
LABELV $248
line 351
;351:		}
LABELV $244
line 347
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $246
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $243
line 352
;352:		return;
ADDRGP4 $220
JUMPV
LABELV $240
line 355
;353:	}
;354:
;355:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 88
CNSTI4 408
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
INDIRF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
EQF4 $250
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $250
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $250
line 357
;356:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT &&
;357:		!attacker->client->ps.powerups[flag_pw]) {
line 360
;358:		// attacker is on the same team as the flag carrier and
;359:		// fragged a guy who hurt our flag carrier
;360:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 362
;361:
;362:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1476
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 363
;363:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
CNSTF4 0
ASGNF4
line 365
;364:
;365:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 366
;366:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 368
;367:		// add the sprite over the player's head
;368:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 369
;369:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 370
;370:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 372
;371:
;372:		return;
ADDRGP4 $220
JUMPV
LABELV $250
line 375
;373:	}
;374:
;375:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 0
EQF4 $254
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 96
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $254
line 376
;376:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT) {
line 378
;377:		// attacker is on the same team as the skull carrier and
;378:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 380
;379:
;380:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1476
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 381
;381:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
CNSTF4 0
ASGNF4
line 383
;382:
;383:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 384
;384:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 386
;385:		// add the sprite over the player's head
;386:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 387
;387:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 388
;388:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 390
;389:
;390:		return;
ADDRGP4 $220
JUMPV
LABELV $254
line 398
;391:	}
;392:
;393:	// flag and flag carrier area defense bonuses
;394:
;395:	// we have to find the flag and carrier entities
;396:
;397:	// find the flag
;398:	switch (attacker->client->sess.sessionTeam) {
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $261
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $263
ADDRGP4 $220
JUMPV
LABELV $261
line 400
;399:	case TEAM_RED:
;400:		c = "team_CTF_redflag";
ADDRLP4 24
ADDRGP4 $262
ASGNP4
line 401
;401:		break;
ADDRGP4 $259
JUMPV
LABELV $263
line 403
;402:	case TEAM_BLUE:
;403:		c = "team_CTF_blueflag";
ADDRLP4 24
ADDRGP4 $264
ASGNP4
line 404
;404:		break;		
line 406
;405:	default:
;406:		return;
LABELV $259
line 409
;407:	}
;408:	// find attacker's team's flag carrier
;409:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $268
JUMPV
LABELV $265
line 410
;410:		carrier = g_entities + i;
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 411
;411:		if (carrier->inuse && carrier->client->ps.powerups[flag_pw])
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $270
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $270
line 412
;412:			break;
ADDRGP4 $267
JUMPV
LABELV $270
line 413
;413:		carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 414
;414:	}
LABELV $266
line 409
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $268
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $265
LABELV $267
line 415
;415:	flag = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 $273
JUMPV
LABELV $272
line 416
;416:	while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 417
;417:		if (!(flag->flags & FL_DROPPED_ITEM))
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $275
line 418
;418:			break;
ADDRGP4 $274
JUMPV
LABELV $275
line 419
;419:	}
LABELV $273
line 416
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 108
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $272
LABELV $274
line 421
;420:
;421:	if (!flag)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $277
line 422
;422:		return; // can't find attacker's flag
ADDRGP4 $220
JUMPV
LABELV $277
line 427
;423:
;424:	// ok we have the attackers flag and a pointer to the carrier
;425:
;426:	// check to see if we are defending the base's flag
;427:	VectorSubtract(targ->r.currentOrigin, flag->r.currentOrigin, v1);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 112
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 128
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 428
;428:	VectorSubtract(attacker->r.currentOrigin, flag->r.currentOrigin, v2);
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 136
CNSTI4 368
ASGNI4
ADDRLP4 40
ADDRLP4 132
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144
CNSTI4 372
ASGNI4
ADDRLP4 40+4
ADDRLP4 132
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148
CNSTI4 376
ASGNI4
ADDRLP4 40+8
ADDRFP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 430
;429:
;430:	if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 1148846080
GEF4 $286
ADDRLP4 156
CNSTI4 368
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $285
LABELV $286
ADDRLP4 40
ARGP4
ADDRLP4 164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 1148846080
GEF4 $283
ADDRLP4 168
CNSTI4 368
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $283
LABELV $285
ADDRLP4 176
CNSTI4 408
ASGNI4
ADDRLP4 180
CNSTI4 1520
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
EQI4 $283
line 434
;431:		trap_InPVS(flag->r.currentOrigin, targ->r.currentOrigin ) ) ||
;432:		( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;433:		trap_InPVS(flag->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;434:		attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 437
;435:
;436:		// we defended the base flag
;437:		AddScore(attacker, targ->r.currentOrigin, CTF_FLAG_DEFENSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 438
;438:		attacker->client->pers.teamState.basedefense++;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1472
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 440
;439:
;440:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 442
;441:		// add the sprite over the player's head
;442:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 443
;443:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 444
;444:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 446
;445:
;446:		return;
ADDRGP4 $220
JUMPV
LABELV $283
line 449
;447:	}
;448:
;449:	if (carrier && carrier != attacker) {
ADDRLP4 184
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 184
INDIRU4
CNSTU4 0
EQU4 $288
ADDRLP4 184
INDIRU4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $288
line 450
;450:		VectorSubtract(targ->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 188
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 188
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 204
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 451
;451:		VectorSubtract(attacker->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 208
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 212
CNSTI4 368
ASGNI4
ADDRLP4 28
ADDRLP4 208
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220
CNSTI4 372
ASGNI4
ADDRLP4 28+4
ADDRLP4 208
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 224
CNSTI4 376
ASGNI4
ADDRLP4 28+8
ADDRFP4 8
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 453
;452:
;453:		if ( ( ( VectorLength(v1) < CTF_ATTACKER_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 228
INDIRF4
CNSTF4 1148846080
GEF4 $297
ADDRLP4 232
CNSTI4 368
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRLP4 236
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $296
LABELV $297
ADDRLP4 40
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 240
INDIRF4
CNSTF4 1148846080
GEF4 $294
ADDRLP4 244
CNSTI4 368
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRLP4 248
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $294
LABELV $296
ADDRLP4 252
CNSTI4 408
ASGNI4
ADDRLP4 256
CNSTI4 1520
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
EQI4 $294
line 457
;454:			trap_InPVS(carrier->r.currentOrigin, targ->r.currentOrigin ) ) ||
;455:			( VectorLength(v2) < CTF_ATTACKER_PROTECT_RADIUS &&
;456:				trap_InPVS(carrier->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;457:			attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 458
;458:			AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 459
;459:			attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 260
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1476
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 461
;460:
;461:			attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 264
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 463
;462:			// add the sprite over the player's head
;463:			attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 268
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 464
;464:			attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 272
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 465
;465:			attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 467
;466:
;467:			return;
LABELV $294
line 469
;468:		}
;469:	}
LABELV $288
line 470
;470:}
LABELV $220
endproc Team_FragBonuses 276 12
export Team_CheckHurtCarrier
proc Team_CheckHurtCarrier 36 0
line 481
;471:
;472:/*
;473:================
;474:Team_CheckHurtCarrier
;475:
;476:Check to see if attacker hurt the flag carrier.  Needed when handing out bonuses for assistance to flag
;477:carrier defense.
;478:================
;479:*/
;480:void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker)
;481:{
line 484
;482:	int flag_pw;
;483:
;484:	if (!targ->client || !attacker->client)
ADDRLP4 4
CNSTI4 408
ASGNI4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $302
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $300
LABELV $302
line 485
;485:		return;
ADDRGP4 $299
JUMPV
LABELV $300
line 487
;486:
;487:	if (targ->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 1
NEI4 $303
line 488
;488:		flag_pw = PW_BLUEFLAG;
ADDRLP4 0
CNSTI4 5
ASGNI4
ADDRGP4 $304
JUMPV
LABELV $303
line 490
;489:	else
;490:		flag_pw = PW_REDFLAG;
ADDRLP4 0
CNSTI4 4
ASGNI4
LABELV $304
line 493
;491:
;492:	// flags
;493:	if (targ->client->ps.powerups[flag_pw] &&
ADDRLP4 12
CNSTI4 408
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
ADDRLP4 20
CNSTI4 1520
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $305
line 495
;494:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;495:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $305
line 498
;496:
;497:	// skulls
;498:	if (targ->client->ps.generic1 &&
ADDRLP4 24
CNSTI4 408
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 0
EQI4 $308
ADDRLP4 32
CNSTI4 1520
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $308
line 500
;499:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;500:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $308
line 501
;501:}
LABELV $299
endproc Team_CheckHurtCarrier 36 0
export Team_ResetFlag
proc Team_ResetFlag 20 12
line 504
;502:
;503:
;504:gentity_t *Team_ResetFlag( int team ) {
line 506
;505:	char *c;
;506:	gentity_t *ent, *rent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 508
;507:
;508:	switch (team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $316
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $314
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $315
ADDRGP4 $312
JUMPV
LABELV $314
line 510
;509:	case TEAM_RED:
;510:		c = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $262
ASGNP4
line 511
;511:		break;
ADDRGP4 $313
JUMPV
LABELV $315
line 513
;512:	case TEAM_BLUE:
;513:		c = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $264
ASGNP4
line 514
;514:		break;
ADDRGP4 $313
JUMPV
LABELV $316
line 516
;515:	case TEAM_FREE:
;516:		c = "team_CTF_neutralflag";
ADDRLP4 4
ADDRGP4 $317
ASGNP4
line 517
;517:		break;
ADDRGP4 $313
JUMPV
LABELV $312
line 519
;518:	default:
;519:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $311
JUMPV
LABELV $313
line 522
;520:	}
;521:
;522:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $319
JUMPV
LABELV $318
line 523
;523:	while ((ent = G_Find (ent, FOFS(classname), c)) != NULL) {
line 524
;524:		if (ent->flags & FL_DROPPED_ITEM)
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $321
line 525
;525:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $322
JUMPV
LABELV $321
line 526
;526:		else {
line 527
;527:			rent = ent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 528
;528:			RespawnItem(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 529
;529:		}
LABELV $322
line 530
;530:	}
LABELV $319
line 523
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $318
line 532
;531:
;532:	Team_SetFlagStatus( team, FLAG_ATBASE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 534
;533:
;534:	return rent;
ADDRLP4 8
INDIRP4
RETP4
LABELV $311
endproc Team_ResetFlag 20 12
export Team_ResetFlags
proc Team_ResetFlags 0 4
line 537
;535:}
;536:
;537:void Team_ResetFlags( void ) {
line 538
;538:	if( g_gametype.integer == GT_CTF || g_gametype.integer == GT_CTY ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 7
EQI4 $328
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 8
NEI4 $324
LABELV $328
line 539
;539:		Team_ResetFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 540
;540:		Team_ResetFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 541
;541:	}
LABELV $324
line 542
;542:}
LABELV $323
endproc Team_ResetFlags 0 4
export Team_ReturnFlagSound
proc Team_ReturnFlagSound 12 8
line 544
;543:
;544:void Team_ReturnFlagSound( gentity_t *ent, int team ) {
line 547
;545:	gentity_t	*te;
;546:
;547:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $330
line 548
;548:		G_Printf ("Warning:  NULL passed to Team_ReturnFlagSound\n");
ADDRGP4 $332
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 549
;549:		return;
ADDRGP4 $329
JUMPV
LABELV $330
line 552
;550:	}
;551:
;552:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 553
;553:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $333
line 554
;554:		te->s.eventParm = GTS_RED_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 555
;555:	}
ADDRGP4 $334
JUMPV
LABELV $333
line 556
;556:	else {
line 557
;557:		te->s.eventParm = GTS_BLUE_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 3
ASGNI4
line 558
;558:	}
LABELV $334
line 559
;559:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 560
;560:}
LABELV $329
endproc Team_ReturnFlagSound 12 8
export Team_TakeFlagSound
proc Team_TakeFlagSound 16 8
line 562
;561:
;562:void Team_TakeFlagSound( gentity_t *ent, int team ) {
line 565
;563:	gentity_t	*te;
;564:
;565:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $336
line 566
;566:		G_Printf ("Warning:  NULL passed to Team_TakeFlagSound\n");
ADDRGP4 $338
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 567
;567:		return;
ADDRGP4 $335
JUMPV
LABELV $336
line 572
;568:	}
;569:
;570:	// only play sound when the flag was at the base
;571:	// or not picked up the last 10 seconds
;572:	switch(team) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $341
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $351
ADDRGP4 $339
JUMPV
LABELV $341
line 574
;573:		case TEAM_RED:
;574:			if( teamgame.blueStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+12
INDIRI4
CNSTI4 0
EQI4 $342
line 575
;575:				if (teamgame.blueTakenTime > level.time - 10000)
ADDRGP4 teamgame+24
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $345
line 576
;576:					return;
ADDRGP4 $335
JUMPV
LABELV $345
line 577
;577:			}
LABELV $342
line 578
;578:			teamgame.blueTakenTime = level.time;
ADDRGP4 teamgame+24
ADDRGP4 level+32
INDIRI4
ASGNI4
line 579
;579:			break;
ADDRGP4 $340
JUMPV
LABELV $351
line 582
;580:
;581:		case TEAM_BLUE:	// CTF
;582:			if( teamgame.redStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+8
INDIRI4
CNSTI4 0
EQI4 $352
line 583
;583:				if (teamgame.redTakenTime > level.time - 10000)
ADDRGP4 teamgame+20
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $355
line 584
;584:					return;
ADDRGP4 $335
JUMPV
LABELV $355
line 585
;585:			}
LABELV $352
line 586
;586:			teamgame.redTakenTime = level.time;
ADDRGP4 teamgame+20
ADDRGP4 level+32
INDIRI4
ASGNI4
line 587
;587:			break;
LABELV $339
LABELV $340
line 590
;588:	}
;589:
;590:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 591
;591:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $361
line 592
;592:		te->s.eventParm = GTS_RED_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 4
ASGNI4
line 593
;593:	}
ADDRGP4 $362
JUMPV
LABELV $361
line 594
;594:	else {
line 595
;595:		te->s.eventParm = GTS_BLUE_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 5
ASGNI4
line 596
;596:	}
LABELV $362
line 597
;597:	te->r.svFlags |= SVF_BROADCAST;
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
CNSTI4 32
BORI4
ASGNI4
line 598
;598:}
LABELV $335
endproc Team_TakeFlagSound 16 8
export Team_CaptureFlagSound
proc Team_CaptureFlagSound 12 8
line 600
;599:
;600:void Team_CaptureFlagSound( gentity_t *ent, int team ) {
line 603
;601:	gentity_t	*te;
;602:
;603:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $364
line 604
;604:		G_Printf ("Warning:  NULL passed to Team_CaptureFlagSound\n");
ADDRGP4 $366
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 605
;605:		return;
ADDRGP4 $363
JUMPV
LABELV $364
line 608
;606:	}
;607:
;608:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 68
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 609
;609:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $367
line 610
;610:		te->s.eventParm = GTS_BLUE_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 611
;611:	}
ADDRGP4 $368
JUMPV
LABELV $367
line 612
;612:	else {
line 613
;613:		te->s.eventParm = GTS_RED_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 614
;614:	}
LABELV $368
line 615
;615:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 616
;616:}
LABELV $363
endproc Team_CaptureFlagSound 12 8
export Team_ReturnFlag
proc Team_ReturnFlag 4 12
line 618
;617:
;618:void Team_ReturnFlag( int team ) {
line 619
;619:	Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 620
;620:	if( team == TEAM_FREE ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $370
line 622
;621:		//PrintMsg(NULL, "The flag has returned!\n" );
;622:	}
ADDRGP4 $371
JUMPV
LABELV $370
line 623
;623:	else { //flag should always have team in normal CTF
line 625
;624:		//PrintMsg(NULL, "The %s flag has returned!\n", TeamName(team));
;625:		PrintCTFMessage(-1, team, CTFMESSAGE_FLAG_RETURNED);
CNSTI4 -1
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 626
;626:	}
LABELV $371
line 627
;627:}
LABELV $369
endproc Team_ReturnFlag 4 12
export Team_FreeEntity
proc Team_FreeEntity 0 4
line 629
;628:
;629:void Team_FreeEntity( gentity_t *ent ) {
line 630
;630:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $373
line 631
;631:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 632
;632:	}
ADDRGP4 $374
JUMPV
LABELV $373
line 633
;633:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $375
line 634
;634:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 635
;635:	}
ADDRGP4 $376
JUMPV
LABELV $375
line 636
;636:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $377
line 637
;637:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 638
;638:	}
LABELV $377
LABELV $376
LABELV $374
line 639
;639:}
LABELV $372
endproc Team_FreeEntity 0 4
export Team_DroppedFlagThink
proc Team_DroppedFlagThink 8 8
line 650
;640:
;641:/*
;642:==============
;643:Team_DroppedFlagThink
;644:
;645:Automatically set in Launch_Item if the item is one of the flags
;646:
;647:Flags are unique in that if they are dropped, the base flag must be respawned when they time out
;648:==============
;649:*/
;650:void Team_DroppedFlagThink(gentity_t *ent) {
line 651
;651:	int		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 653
;652:
;653:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 4
NEI4 $380
line 654
;654:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 655
;655:	}
ADDRGP4 $381
JUMPV
LABELV $380
line 656
;656:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 5
NEI4 $382
line 657
;657:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 658
;658:	}
ADDRGP4 $383
JUMPV
LABELV $382
line 659
;659:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
NEI4 $384
line 660
;660:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 661
;661:	}
LABELV $384
LABELV $383
LABELV $381
line 663
;662:
;663:	Team_ReturnFlagSound( Team_ResetFlag( team ), team );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 665
;664:	// Reset Flag will delete this entity
;665:}
LABELV $379
endproc Team_DroppedFlagThink 8 8
export Team_TouchOurFlag
proc Team_TouchOurFlag 56 12
line 673
;666:
;667:
;668:/*
;669:==============
;670:Team_DroppedFlagThink
;671:==============
;672:*/
;673:int Team_TouchOurFlag( gentity_t *ent, gentity_t *other, int team ) {
line 676
;674:	int			i;
;675:	gentity_t	*player;
;676:	gclient_t	*cl = other->client;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 679
;677:	int			enemy_flag;
;678:
;679:	if (cl->sess.sessionTeam == TEAM_RED) {
ADDRLP4 8
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 1
NEI4 $387
line 680
;680:		enemy_flag = PW_BLUEFLAG;
ADDRLP4 12
CNSTI4 5
ASGNI4
line 681
;681:	} else {
ADDRGP4 $388
JUMPV
LABELV $387
line 682
;682:		enemy_flag = PW_REDFLAG;
ADDRLP4 12
CNSTI4 4
ASGNI4
line 683
;683:	}
LABELV $388
line 685
;684:
;685:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $389
line 689
;686:		// hey, its not home.  return it by teleporting it back
;687:		//PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
;688:		//	cl->pers.netname, TeamName(team));
;689:		PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_RETURNED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 691
;690:
;691:		AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 692
;692:		other->client->pers.teamState.flagrecovery++;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1480
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 693
;693:		other->client->pers.teamState.lastreturnedflag = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1496
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 695
;694:		//ResetFlag will remove this entity!  We must return zero
;695:		Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 696
;696:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $386
JUMPV
LABELV $389
line 701
;697:	}
;698:
;699:	// the flag is at home base.  if the player has the enemy
;700:	// flag, he's just won!
;701:	if (!cl->ps.powerups[enemy_flag])
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $392
line 702
;702:		return 0; // We don't have the flag
CNSTI4 0
RETI4
ADDRGP4 $386
JUMPV
LABELV $392
line 704
;703:	//PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the %s flag!\n", cl->pers.netname, TeamName(OtherTeam(team)));
;704:	PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_CAPTURED_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 706
;705:
;706:	cl->ps.powerups[enemy_flag] = 0;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 708
;707:
;708:	teamgame.last_flag_capture = level.time;
ADDRGP4 teamgame
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 709
;709:	teamgame.last_capture_team = team;
ADDRGP4 teamgame+4
ADDRFP4 8
INDIRI4
ASGNI4
line 712
;710:
;711:	// Increase the team's score
;712:	AddTeamScore(ent->s.pos.trBase, other->client->sess.sessionTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 716
;713://	Team_ForceGesture(other->client->sess.sessionTeam);
;714:	//rww - don't really want to do this now. Mainly because performing a gesture disables your upper torso animations until it's done and you can't fire
;715:
;716:	other->client->pers.teamState.captures++;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1468
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 718
;717:	// add the sprite over the player's head
;718:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 719
;719:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 720
;720:	other->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 721
;721:	other->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 336
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 724
;722:
;723:	// other gets another 10 frag bonus
;724:	AddScore(other, ent->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 100
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 726
;725:
;726:	Team_CaptureFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 729
;727:
;728:	// Ok, let's do the player loop, hand out the bonuses
;729:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $400
JUMPV
LABELV $397
line 730
;730:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 731
;731:		if (!player->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $402
line 732
;732:			continue;
ADDRGP4 $398
JUMPV
LABELV $402
line 734
;733:
;734:		if (player->client->sess.sessionTeam !=
ADDRLP4 32
CNSTI4 1520
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $404
line 735
;735:			cl->sess.sessionTeam) {
line 736
;736:			player->client->pers.teamState.lasthurtcarrier = -5;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1492
ADDP4
CNSTF4 3231711232
ASGNF4
line 737
;737:		} else if (player->client->sess.sessionTeam ==
ADDRGP4 $405
JUMPV
LABELV $404
ADDRLP4 36
CNSTI4 1520
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRI4
NEI4 $406
line 738
;738:			cl->sess.sessionTeam) {
line 739
;739:			if (player != other)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $408
line 740
;740:				AddScore(player, ent->r.currentOrigin, CTF_TEAM_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 25
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $408
line 742
;741:			// award extra points for capture assists
;742:			if (player->client->pers.teamState.lastreturnedflag + 
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1496
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $410
line 743
;743:				CTF_RETURN_FLAG_ASSIST_TIMEOUT > level.time) {
line 744
;744:				AddScore (player, ent->r.currentOrigin, CTF_RETURN_FLAG_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 745
;745:				other->client->pers.teamState.assists++;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1488
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 747
;746:
;747:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 749
;748:				// add the sprite over the player's head
;749:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 48
ADDRLP4 0
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
CNSTI4 -231497
BANDI4
ASGNI4
line 750
;750:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 52
ADDRLP4 0
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
CNSTI4 131072
BORI4
ASGNI4
line 751
;751:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 753
;752:
;753:			} else if (player->client->pers.teamState.lastfraggedcarrier + 
ADDRGP4 $411
JUMPV
LABELV $410
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $414
line 754
;754:				CTF_FRAG_CARRIER_ASSIST_TIMEOUT > level.time) {
line 755
;755:				AddScore(player, ent->r.currentOrigin, CTF_FRAG_CARRIER_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 756
;756:				other->client->pers.teamState.assists++;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1488
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 757
;757:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 759
;758:				// add the sprite over the player's head
;759:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 48
ADDRLP4 0
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
CNSTI4 -231497
BANDI4
ASGNI4
line 760
;760:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 52
ADDRLP4 0
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
CNSTI4 131072
BORI4
ASGNI4
line 761
;761:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 762
;762:			}
LABELV $414
LABELV $411
line 763
;763:		}
LABELV $406
LABELV $405
line 764
;764:	}
LABELV $398
line 729
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $400
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $397
line 765
;765:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 767
;766:
;767:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 769
;768:
;769:	return 0; // Do not respawn this automatically
CNSTI4 0
RETI4
LABELV $386
endproc Team_TouchOurFlag 56 12
export Team_TouchEnemyFlag
proc Team_TouchEnemyFlag 4 12
line 772
;770:}
;771:
;772:int Team_TouchEnemyFlag( gentity_t *ent, gentity_t *other, int team ) {
line 773
;773:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 777
;774:
;775:	//PrintMsg (NULL, "%s" S_COLOR_WHITE " got the %s flag!\n",
;776:	//	other->client->pers.netname, TeamName(team));
;777:	PrintCTFMessage(other->s.number, team, CTFMESSAGE_PLAYER_GOT_FLAG);
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 PrintCTFMessage
CALLV
pop
line 779
;778:
;779:	if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $419
line 780
;780:		cl->ps.powerups[PW_REDFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 360
ADDP4
CNSTI4 2147483647
ASGNI4
ADDRGP4 $420
JUMPV
LABELV $419
line 782
;781:	else
;782:		cl->ps.powerups[PW_BLUEFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 364
ADDP4
CNSTI4 2147483647
ASGNI4
LABELV $420
line 784
;783:
;784:	Team_SetFlagStatus( team, FLAG_TAKEN );
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 786
;785:
;786:	AddScore(other, ent->r.currentOrigin, CTF_FLAG_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 787
;787:	cl->pers.teamState.flagsince = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1500
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 788
;788:	Team_TakeFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_TakeFlagSound
CALLV
pop
line 790
;789:
;790:	return -1; // Do not respawn this automatically, but do delete it if it was FL_DROPPED
CNSTI4 -1
RETI4
LABELV $418
endproc Team_TouchEnemyFlag 4 12
export Pickup_Team
proc Pickup_Team 24 12
line 793
;791:}
;792:
;793:int Pickup_Team( gentity_t *ent, gentity_t *other ) {
line 795
;794:	int team;
;795:	gclient_t *cl = other->client;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 798
;796:
;797:	// figure out what team this flag is
;798:	if( strcmp(ent->classname, "team_CTF_redflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $423
line 799
;799:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 800
;800:	}
ADDRGP4 $424
JUMPV
LABELV $423
line 801
;801:	else if( strcmp(ent->classname, "team_CTF_blueflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $264
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $425
line 802
;802:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 803
;803:	}
ADDRGP4 $426
JUMPV
LABELV $425
line 804
;804:	else if( strcmp(ent->classname, "team_CTF_neutralflag") == 0  ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 16
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $427
line 805
;805:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 806
;806:	}
ADDRGP4 $428
JUMPV
LABELV $427
line 807
;807:	else {
line 809
;808://		PrintMsg ( other, "Don't know what team the flag is on.\n");
;809:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $422
JUMPV
LABELV $428
LABELV $426
LABELV $424
line 812
;810:	}
;811:	// GT_CTF
;812:	if( team == cl->sess.sessionTeam) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
NEI4 $429
line 813
;813:		return Team_TouchOurFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $422
JUMPV
LABELV $429
line 815
;814:	}
;815:	return Team_TouchEnemyFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $422
endproc Pickup_Team 24 12
export Team_GetLocation
proc Team_GetLocation 48 8
line 826
;816:}
;817:
;818:/*
;819:===========
;820:Team_GetLocation
;821:
;822:Report a location for the player. Uses placed nearby target_location entities
;823:============
;824:*/
;825:gentity_t *Team_GetLocation(gentity_t *ent)
;826:{
line 831
;827:	gentity_t		*eloc, *best;
;828:	float			bestlen, len;
;829:	vec3_t			origin;
;830:
;831:	best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 832
;832:	bestlen = 3*8192.0*8192.0;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 834
;833:
;834:	VectorCopy( ent->r.currentOrigin, origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 836
;835:
;836:	for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+9052
INDIRP4
ASGNP4
ADDRGP4 $435
JUMPV
LABELV $432
line 837
;837:		len = ( origin[0] - eloc->r.currentOrigin[0] ) * ( origin[0] - eloc->r.currentOrigin[0] )
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 841
;838:			+ ( origin[1] - eloc->r.currentOrigin[1] ) * ( origin[1] - eloc->r.currentOrigin[1] )
;839:			+ ( origin[2] - eloc->r.currentOrigin[2] ) * ( origin[2] - eloc->r.currentOrigin[2] );
;840:
;841:		if ( len > bestlen ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $441
line 842
;842:			continue;
ADDRGP4 $433
JUMPV
LABELV $441
line 845
;843:		}
;844:
;845:		if ( !trap_InPVS( origin, eloc->r.currentOrigin ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $443
line 846
;846:			continue;
ADDRGP4 $433
JUMPV
LABELV $443
line 849
;847:		}
;848:
;849:		bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 850
;850:		best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 851
;851:	}
LABELV $433
line 836
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
LABELV $435
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $432
line 853
;852:
;853:	return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $431
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 865
;854:}
;855:
;856:
;857:/*
;858:===========
;859:Team_GetLocation
;860:
;861:Report a location for the player. Uses placed nearby target_location entities
;862:============
;863:*/
;864:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen)
;865:{
line 868
;866:	gentity_t *best;
;867:
;868:	best = Team_GetLocation( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 870
;869:	
;870:	if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $446
line 871
;871:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $445
JUMPV
LABELV $446
line 873
;872:
;873:	if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $448
line 874
;874:		if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
GEI4 $450
line 875
;875:			best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
LABELV $450
line 876
;876:		if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 7
LEI4 $452
line 877
;877:			best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 7
ASGNI4
LABELV $452
line 878
;878:		Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $454
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 879
;879:	} else
ADDRGP4 $449
JUMPV
LABELV $448
line 880
;880:		Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $455
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $449
line 882
;881:
;882:	return qtrue;
CNSTI4 1
RETI4
LABELV $445
endproc Team_GetLocationMsg 12 24
export SelectRandomTeamSpawnPoint
proc SelectRandomTeamSpawnPoint 152 12
line 896
;883:}
;884:
;885:
;886:/*---------------------------------------------------------------------------*/
;887:
;888:/*
;889:================
;890:SelectRandomDeathmatchSpawnPoint
;891:
;892:go to a random point that doesn't telefrag
;893:================
;894:*/
;895:#define	MAX_TEAM_SPAWN_POINTS	32
;896:gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ) {
line 903
;897:	gentity_t	*spot;
;898:	int			count;
;899:	int			selection;
;900:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;901:	char		*classname;
;902:
;903:	if (g_gametype.integer == GT_SAGA)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 6
NEI4 $457
line 904
;904:	{
line 905
;905:		if (team == SAGATEAM_IMPERIAL)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $460
line 906
;906:		{
line 907
;907:			classname = "info_player_imperial";
ADDRLP4 8
ADDRGP4 $462
ASGNP4
line 908
;908:		}
ADDRGP4 $458
JUMPV
LABELV $460
line 910
;909:		else
;910:		{
line 911
;911:			classname = "info_player_rebel";
ADDRLP4 8
ADDRGP4 $463
ASGNP4
line 912
;912:		}
line 913
;913:	}
ADDRGP4 $458
JUMPV
LABELV $457
line 915
;914:	else
;915:	{
line 916
;916:		if (teamstate == TEAM_BEGIN) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $464
line 917
;917:			if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $466
line 918
;918:				classname = "team_CTF_redplayer";
ADDRLP4 8
ADDRGP4 $468
ASGNP4
ADDRGP4 $465
JUMPV
LABELV $466
line 919
;919:			else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $469
line 920
;920:				classname = "team_CTF_blueplayer";
ADDRLP4 8
ADDRGP4 $471
ASGNP4
ADDRGP4 $465
JUMPV
LABELV $469
line 922
;921:			else
;922:				return NULL;
CNSTP4 0
RETP4
ADDRGP4 $456
JUMPV
line 923
;923:		} else {
LABELV $464
line 924
;924:			if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $472
line 925
;925:				classname = "team_CTF_redspawn";
ADDRLP4 8
ADDRGP4 $474
ASGNP4
ADDRGP4 $473
JUMPV
LABELV $472
line 926
;926:			else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $475
line 927
;927:				classname = "team_CTF_bluespawn";
ADDRLP4 8
ADDRGP4 $477
ASGNP4
ADDRGP4 $476
JUMPV
LABELV $475
line 929
;928:			else
;929:				return NULL;
CNSTP4 0
RETP4
ADDRGP4 $456
JUMPV
LABELV $476
LABELV $473
line 930
;930:		}
LABELV $465
line 931
;931:	}
LABELV $458
line 932
;932:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 934
;933:
;934:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $479
JUMPV
LABELV $478
line 936
;935:
;936:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 937
;937:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $481
line 938
;938:			continue;
ADDRGP4 $479
JUMPV
LABELV $481
line 940
;939:		}
;940:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 941
;941:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $483
line 942
;942:			break;
ADDRGP4 $480
JUMPV
LABELV $483
line 943
;943:	}
LABELV $479
line 936
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $478
LABELV $480
line 945
;944:
;945:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $485
line 946
;946:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 416
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $456
JUMPV
LABELV $485
line 949
;947:	}
;948:
;949:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 950
;950:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $456
endproc SelectRandomTeamSpawnPoint 152 12
export SelectCTFSpawnPoint
proc SelectCTFSpawnPoint 12 12
line 960
;951:}
;952:
;953:
;954:/*
;955:===========
;956:SelectCTFSpawnPoint
;957:
;958:============
;959:*/
;960:gentity_t *SelectCTFSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 963
;961:	gentity_t	*spot;
;962:
;963:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 965
;964:
;965:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $488
line 966
;966:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $487
JUMPV
LABELV $488
line 969
;967:	}
;968:
;969:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 970
;970:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 971
;971:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 973
;972:
;973:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $487
endproc SelectCTFSpawnPoint 12 12
export SelectSagaSpawnPoint
proc SelectSagaSpawnPoint 12 12
line 982
;974:}
;975:
;976:/*
;977:===========
;978:SelectSagaSpawnPoint
;979:
;980:============
;981:*/
;982:gentity_t *SelectSagaSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 985
;983:	gentity_t	*spot;
;984:
;985:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 987
;986:
;987:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $491
line 988
;988:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $490
JUMPV
LABELV $491
line 991
;989:	}
;990:
;991:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 992
;992:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 993
;993:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 995
;994:
;995:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $490
endproc SelectSagaSpawnPoint 12 12
proc SortClients 0 0
line 1000
;996:}
;997:
;998:/*---------------------------------------------------------------------------*/
;999:
;1000:static int QDECL SortClients( const void *a, const void *b ) {
line 1001
;1001:	return *(int *)a - *(int *)b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $493
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9404 36
line 1014
;1002:}
;1003:
;1004:
;1005:/*
;1006:==================
;1007:TeamplayLocationsMessage
;1008:
;1009:Format:
;1010:	clientNum location health armor weapon powerups
;1011:
;1012:==================
;1013:*/
;1014:void TeamplayInfoMessage( gentity_t *ent ) {
line 1024
;1015:	char		entry[1024];
;1016:	char		string[8192];
;1017:	int			stringlength;
;1018:	int			i, j;
;1019:	gentity_t	*player;
;1020:	int			cnt;
;1021:	int			h, a;
;1022:	int			clients[TEAM_MAXOVERLAY];
;1023:
;1024:	if ( ! ent->client->pers.teamInfo )
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1516
ADDP4
INDIRI4
CNSTI4 0
NEI4 $495
line 1025
;1025:		return;
ADDRGP4 $494
JUMPV
LABELV $495
line 1030
;1026:
;1027:	// figure out what client should be on the display
;1028:	// we are limited to 8, but we want to use the top eight players
;1029:	// but in client order (so they don't keep changing position on the overlay)
;1030:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9372
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRGP4 $500
JUMPV
LABELV $497
line 1031
;1031:		player = g_entities + level.sortedClients[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
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
line 1032
;1032:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $503
ADDRLP4 9380
CNSTI4 408
ASGNI4
ADDRLP4 9384
CNSTI4 1520
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
NEI4 $503
line 1033
;1033:			ent->client->sess.sessionTeam ) {
line 1034
;1034:			clients[cnt++] = level.sortedClients[i];
ADDRLP4 9388
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9388
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9392
CNSTI4 2
ASGNI4
ADDRLP4 9388
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRLP4 9244
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 1035
;1035:		}
LABELV $503
line 1036
;1036:	}
LABELV $498
line 1030
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $500
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $506
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $497
LABELV $506
line 1039
;1037:
;1038:	// We have the top eight players, sort them by clientNum
;1039:	qsort( clients, cnt, sizeof( clients[0] ), SortClients );
ADDRLP4 9244
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1042
;1040:
;1041:	// send the latest information on all clients
;1042:	string[0] = 0;
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 1043
;1043:	stringlength = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 1045
;1044:
;1045:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9376
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRGP4 $510
JUMPV
LABELV $507
line 1046
;1046:		player = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1047
;1047:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $512
ADDRLP4 9384
CNSTI4 408
ASGNI4
ADDRLP4 9388
CNSTI4 1520
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
NEI4 $512
line 1048
;1048:			ent->client->sess.sessionTeam ) {
line 1050
;1049:
;1050:			h = player->client->ps.stats[STAT_HEALTH];
ADDRLP4 1036
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
line 1051
;1051:			a = player->client->ps.stats[STAT_ARMOR];
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 1052
;1052:			if (h < 0) h = 0;
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $514
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $514
line 1053
;1053:			if (a < 0) a = 0;
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $516
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $516
line 1055
;1054:
;1055:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $518
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 9396
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9396
INDIRP4
CNSTI4 1464
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 9396
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1060
;1056:				" %i %i %i %i %i %i", 
;1057://				level.sortedClients[i], player->client->pers.teamState.location, h, a, 
;1058:				i, player->client->pers.teamState.location, h, a, 
;1059:				player->client->ps.weapon, player->s.powerups);
;1060:			j = strlen(entry);
ADDRLP4 12
ARGP4
ADDRLP4 9400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 9400
INDIRI4
ASGNI4
line 1061
;1061:			if (stringlength + j > sizeof(string))
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
CVIU4 4
CNSTU4 8192
LEU4 $519
line 1062
;1062:				break;
ADDRGP4 $509
JUMPV
LABELV $519
line 1063
;1063:			strcpy (string + stringlength, entry);
ADDRLP4 1044
INDIRI4
ADDRLP4 1052
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1064
;1064:			stringlength += j;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
ASGNI4
line 1065
;1065:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1066
;1066:		}
LABELV $512
line 1067
;1067:	}
LABELV $508
line 1045
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $510
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $521
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $507
LABELV $521
LABELV $509
line 1069
;1068:
;1069:	trap_SendServerCommand( ent-g_entities, va("tinfo %i %s", cnt, string) );
ADDRGP4 $522
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 9380
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 9380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1070
;1070:}
LABELV $494
endproc TeamplayInfoMessage 9404 36
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 1072
;1071:
;1072:void CheckTeamStatus(void) {
line 1076
;1073:	int i;
;1074:	gentity_t *loc, *ent;
;1075:
;1076:	if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+60
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $524
line 1078
;1077:
;1078:		level.lastTeamLocationTime = level.time;
ADDRGP4 level+60
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1080
;1079:
;1080:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $533
JUMPV
LABELV $530
line 1081
;1081:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1083
;1082:
;1083:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $535
line 1084
;1084:				continue;
ADDRGP4 $531
JUMPV
LABELV $535
line 1087
;1085:			}
;1086:
;1087:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $537
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $539
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $537
LABELV $539
line 1088
;1088:				loc = Team_GetLocation( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1089
;1089:				if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $540
line 1090
;1090:					ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $541
JUMPV
LABELV $540
line 1092
;1091:				else
;1092:					ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1464
ADDP4
CNSTI4 0
ASGNI4
LABELV $541
line 1093
;1093:			}
LABELV $537
line 1094
;1094:		}
LABELV $531
line 1080
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $533
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $530
line 1096
;1095:
;1096:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $545
JUMPV
LABELV $542
line 1097
;1097:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1099
;1098:
;1099:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $547
line 1100
;1100:				continue;
ADDRGP4 $543
JUMPV
LABELV $547
line 1103
;1101:			}
;1102:
;1103:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $549
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $551
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $549
LABELV $551
line 1104
;1104:				TeamplayInfoMessage( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
line 1105
;1105:			}
LABELV $549
line 1106
;1106:		}
LABELV $543
line 1096
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $545
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $542
line 1107
;1107:	}
LABELV $524
line 1108
;1108:}
LABELV $523
endproc CheckTeamStatus 24 4
export SP_team_CTF_redplayer
proc SP_team_CTF_redplayer 0 0
line 1115
;1109:
;1110:/*-----------------------------------------------------------------*/
;1111:
;1112:/*QUAKED team_CTF_redplayer (1 0 0) (-16 -16 -16) (16 16 32)
;1113:Only in CTF games.  Red players spawn here at game start.
;1114:*/
;1115:void SP_team_CTF_redplayer( gentity_t *ent ) {
line 1116
;1116:}
LABELV $552
endproc SP_team_CTF_redplayer 0 0
export SP_team_CTF_blueplayer
proc SP_team_CTF_blueplayer 0 0
line 1122
;1117:
;1118:
;1119:/*QUAKED team_CTF_blueplayer (0 0 1) (-16 -16 -16) (16 16 32)
;1120:Only in CTF games.  Blue players spawn here at game start.
;1121:*/
;1122:void SP_team_CTF_blueplayer( gentity_t *ent ) {
line 1123
;1123:}
LABELV $553
endproc SP_team_CTF_blueplayer 0 0
export SP_team_CTF_redspawn
proc SP_team_CTF_redspawn 0 0
line 1130
;1124:
;1125:
;1126:/*QUAKED team_CTF_redspawn (1 0 0) (-16 -16 -24) (16 16 32)
;1127:potential spawning position for red team in CTF games.
;1128:Targets will be fired when someone spawns in on them.
;1129:*/
;1130:void SP_team_CTF_redspawn(gentity_t *ent) {
line 1131
;1131:}
LABELV $554
endproc SP_team_CTF_redspawn 0 0
export SP_team_CTF_bluespawn
proc SP_team_CTF_bluespawn 0 0
line 1137
;1132:
;1133:/*QUAKED team_CTF_bluespawn (0 0 1) (-16 -16 -24) (16 16 32)
;1134:potential spawning position for blue team in CTF games.
;1135:Targets will be fired when someone spawns in on them.
;1136:*/
;1137:void SP_team_CTF_bluespawn(gentity_t *ent) {
line 1138
;1138:}
LABELV $555
endproc SP_team_CTF_bluespawn 0 0
bss
export teamgame
align 4
LABELV teamgame
skip 28
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
LABELV $522
char 1 116
char 1 105
char 1 110
char 1 102
char 1 111
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $518
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $477
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $474
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 115
char 1 112
char 1 97
char 1 119
char 1 110
char 1 0
align 1
LABELV $471
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $468
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $463
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 114
char 1 101
char 1 98
char 1 101
char 1 108
char 1 0
align 1
LABELV $462
char 1 105
char 1 110
char 1 102
char 1 111
char 1 95
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 95
char 1 105
char 1 109
char 1 112
char 1 101
char 1 114
char 1 105
char 1 97
char 1 108
char 1 0
align 1
LABELV $455
char 1 37
char 1 115
char 1 0
align 1
LABELV $454
char 1 37
char 1 99
char 1 37
char 1 99
char 1 37
char 1 115
char 1 94
char 1 55
char 1 0
align 1
LABELV $366
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 112
char 1 97
char 1 115
char 1 115
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 70
char 1 108
char 1 97
char 1 103
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $338
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 112
char 1 97
char 1 115
char 1 115
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 95
char 1 84
char 1 97
char 1 107
char 1 101
char 1 70
char 1 108
char 1 97
char 1 103
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $332
char 1 87
char 1 97
char 1 114
char 1 110
char 1 105
char 1 110
char 1 103
char 1 58
char 1 32
char 1 32
char 1 78
char 1 85
char 1 76
char 1 76
char 1 32
char 1 112
char 1 97
char 1 115
char 1 115
char 1 101
char 1 100
char 1 32
char 1 116
char 1 111
char 1 32
char 1 84
char 1 101
char 1 97
char 1 109
char 1 95
char 1 82
char 1 101
char 1 116
char 1 117
char 1 114
char 1 110
char 1 70
char 1 108
char 1 97
char 1 103
char 1 83
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $317
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 110
char 1 101
char 1 117
char 1 116
char 1 114
char 1 97
char 1 108
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $264
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 98
char 1 108
char 1 117
char 1 101
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $262
char 1 116
char 1 101
char 1 97
char 1 109
char 1 95
char 1 67
char 1 84
char 1 70
char 1 95
char 1 114
char 1 101
char 1 100
char 1 102
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $118
char 1 94
char 1 55
char 1 0
align 1
LABELV $117
char 1 94
char 1 51
char 1 0
align 1
LABELV $114
char 1 94
char 1 52
char 1 0
align 1
LABELV $111
char 1 94
char 1 49
char 1 0
align 1
LABELV $100
char 1 70
char 1 82
char 1 69
char 1 69
char 1 0
align 1
LABELV $99
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 65
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $96
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $93
char 1 82
char 1 69
char 1 68
char 1 0
