export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 2484 68
file "../g_cmds.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#include "../../ui/menudef.h"			// for the voice chats
;6:
;7://rww - for getting bot commands...
;8:int AcceptBotCommand(char *cmd, gentity_t *pl);
;9://end rww
;10:
;11:void BG_CycleInven(playerState_t *ps, int direction);
;12:void BG_CycleForce(playerState_t *ps, int direction);
;13:
;14:/*
;15:==================
;16:DeathmatchScoreboardMessage
;17:
;18:==================
;19:*/
;20:void DeathmatchScoreboardMessage( gentity_t *ent ) {
line 29
;21:	char		entry[1024];
;22:	char		string[1400];
;23:	int			stringlength;
;24:	int			i, j;
;25:	gclient_t	*cl;
;26:	int			numSorted, scoreFlags, accuracy, perfect;
;27:
;28:	// send the latest information on all clients
;29:	string[0] = 0;
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 30
;30:	stringlength = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
line 31
;31:	scoreFlags = 0;
ADDRLP4 2452
CNSTI4 0
ASGNI4
line 33
;32:
;33:	numSorted = level.numConnectedClients;
ADDRLP4 1048
ADDRGP4 level+72
INDIRI4
ASGNI4
line 35
;34:	
;35:	if (numSorted > MAX_CLIENT_SCORE_SEND)
ADDRLP4 1048
INDIRI4
CNSTI4 20
LEI4 $80
line 36
;36:	{
line 37
;37:		numSorted = MAX_CLIENT_SCORE_SEND;
ADDRLP4 1048
CNSTI4 20
ASGNI4
line 38
;38:	}
LABELV $80
line 40
;39:
;40:	for (i=0 ; i < numSorted ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $82
line 43
;41:		int		ping;
;42:
;43:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
CNSTI4 1756
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 45
;44:
;45:		if ( cl->pers.connected == CON_CONNECTING ) {
ADDRLP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 1
NEI4 $87
line 46
;46:			ping = -1;
ADDRLP4 2456
CNSTI4 -1
ASGNI4
line 47
;47:		} else {
ADDRGP4 $88
JUMPV
LABELV $87
line 48
;48:			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 999
GEI4 $90
ADDRLP4 2460
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $90
ADDRLP4 2460
CNSTI4 999
ASGNI4
LABELV $91
ADDRLP4 2456
ADDRLP4 2460
INDIRI4
ASGNI4
line 49
;49:		}
LABELV $88
line 51
;50:
;51:		if( cl->accuracy_shots ) {
ADDRLP4 0
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $92
line 52
;52:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1040
CNSTI4 100
ADDRLP4 0
INDIRP4
CNSTI4 1656
ADDP4
INDIRI4
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 1652
ADDP4
INDIRI4
DIVI4
ASGNI4
line 53
;53:		}
ADDRGP4 $93
JUMPV
LABELV $92
line 54
;54:		else {
line 55
;55:			accuracy = 0;
ADDRLP4 1040
CNSTI4 0
ASGNI4
line 56
;56:		}
LABELV $93
line 57
;57:		perfect = ( cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0 ) ? 1 : 0;
ADDRLP4 2468
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $95
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
INDIRI4
ADDRLP4 2468
INDIRI4
NEI4 $95
ADDRLP4 2460
CNSTI4 1
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 2460
CNSTI4 0
ASGNI4
LABELV $96
ADDRLP4 1044
ADDRLP4 2460
INDIRI4
ASGNI4
line 59
;58:
;59:		Com_sprintf (entry, sizeof(entry),
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $97
ARGP4
ADDRLP4 2472
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 2472
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
ARGI4
ADDRLP4 2456
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1456
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 2452
INDIRI4
ARGI4
CNSTI4 828
ADDRLP4 2472
INDIRI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities+272
ADDP4
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRI4
ARGI4
ADDRLP4 1044
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 70
;60:			" %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i],
;61:			cl->ps.persistant[PERS_SCORE], ping, (level.time - cl->pers.enterTime)/60000,
;62:			scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy, 
;63:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT],
;64:			cl->ps.persistant[PERS_EXCELLENT_COUNT],
;65:			cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT], 
;66:			cl->ps.persistant[PERS_DEFEND_COUNT], 
;67:			cl->ps.persistant[PERS_ASSIST_COUNT], 
;68:			perfect,
;69:			cl->ps.persistant[PERS_CAPTURES]);
;70:		j = strlen(entry);
ADDRLP4 8
ARGP4
ADDRLP4 2480
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 2480
INDIRI4
ASGNI4
line 71
;71:		if (stringlength + j > 1022)
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
CNSTI4 1022
LEI4 $102
line 72
;72:			break;
ADDRGP4 $84
JUMPV
LABELV $102
line 73
;73:		strcpy (string + stringlength, entry);
ADDRLP4 1032
INDIRI4
ADDRLP4 1052
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 74
;74:		stringlength += j;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
ADDRLP4 1036
INDIRI4
ADDI4
ASGNI4
line 75
;75:	}
LABELV $83
line 40
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $85
ADDRLP4 4
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $82
LABELV $84
line 78
;76:
;77:	//still want to know the total # of clients
;78:	i = level.numConnectedClients;
ADDRLP4 4
ADDRGP4 level+72
INDIRI4
ASGNI4
line 80
;79:
;80:	trap_SendServerCommand( ent-g_entities, va("scores %i %i %i%s", i, 
ADDRGP4 $105
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+44+4
INDIRI4
ARGI4
ADDRGP4 level+44+8
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 2456
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
ADDRLP4 2456
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 83
;81:		level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE],
;82:		string ) );
;83:}
LABELV $78
endproc DeathmatchScoreboardMessage 2484 68
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 93
;84:
;85:
;86:/*
;87:==================
;88:Cmd_Score_f
;89:
;90:Request current scoreboard information
;91:==================
;92:*/
;93:void Cmd_Score_f( gentity_t *ent ) {
line 94
;94:	DeathmatchScoreboardMessage( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 95
;95:}
LABELV $110
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 8 8
line 104
;96:
;97:
;98:
;99:/*
;100:==================
;101:CheatsOk
;102:==================
;103:*/
;104:qboolean	CheatsOk( gentity_t *ent ) {
line 105
;105:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $112
line 106
;106:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOCHEATS")));
ADDRGP4 $116
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 107
;107:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $112
line 109
;108:	}
;109:	if ( ent->health <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $118
line 110
;110:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBEALIVE")));
ADDRGP4 $116
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 111
;111:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $111
JUMPV
LABELV $118
line 113
;112:	}
;113:	return qtrue;
CNSTI4 1
RETI4
LABELV $111
endproc CheatsOk 8 8
bss
align 1
LABELV $122
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 122
;114:}
;115:
;116:
;117:/*
;118:==================
;119:ConcatArgs
;120:==================
;121:*/
;122:char	*ConcatArgs( int start ) {
line 128
;123:	int		i, c, tlen;
;124:	static char	line[MAX_STRING_CHARS];
;125:	int		len;
;126:	char	arg[MAX_STRING_CHARS];
;127:
;128:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 129
;129:	c = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 130
;130:	for ( i = start ; i < c ; i++ ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
line 131
;131:		trap_Argv( i, arg, sizeof( arg ) );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 132
;132:		tlen = strlen( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1044
INDIRI4
ASGNI4
line 133
;133:		if ( len + tlen >= MAX_STRING_CHARS - 1 ) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
CNSTI4 1023
LTI4 $127
line 134
;134:			break;
ADDRGP4 $125
JUMPV
LABELV $127
line 136
;135:		}
;136:		memcpy( line + len, arg, tlen );
ADDRLP4 0
INDIRI4
ADDRGP4 $122
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 137
;137:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 138
;138:		if ( i != c - 1 ) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $129
line 139
;139:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $122
ADDP4
CNSTI1 32
ASGNI1
line 140
;140:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 141
;141:		}
LABELV $129
line 142
;142:	}
LABELV $124
line 130
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $126
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $123
LABELV $125
line 144
;143:
;144:	line[len] = 0;
ADDRLP4 0
INDIRI4
ADDRGP4 $122
ADDP4
CNSTI1 0
ASGNI1
line 146
;145:
;146:	return line;
ADDRGP4 $122
RETP4
LABELV $121
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 16 4
line 156
;147:}
;148:
;149:/*
;150:==================
;151:SanitizeString
;152:
;153:Remove case and control characters
;154:==================
;155:*/
;156:void SanitizeString( char *in, char *out ) {
ADDRGP4 $133
JUMPV
LABELV $132
line 157
;157:	while ( *in ) {
line 158
;158:		if ( *in == 27 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $135
line 159
;159:			in += 2;		// skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 160
;160:			continue;
ADDRGP4 $133
JUMPV
LABELV $135
line 162
;161:		}
;162:		if ( *in < 32 ) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $137
line 163
;163:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 164
;164:			continue;
ADDRGP4 $133
JUMPV
LABELV $137
line 166
;165:		}
;166:		*out++ = tolower( *in++ );
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 12
INDIRI4
CVII1 4
ASGNI1
line 167
;167:	}
LABELV $133
line 157
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $132
line 169
;168:
;169:	*out = 0;
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 170
;170:}
LABELV $131
endproc SanitizeString 16 4
export ClientNumberFromString
proc ClientNumberFromString 2072 8
line 180
;171:
;172:/*
;173:==================
;174:ClientNumberFromString
;175:
;176:Returns a player number for either a number or name string
;177:Returns -1 if invalid
;178:==================
;179:*/
;180:int ClientNumberFromString( gentity_t *to, char *s ) {
line 187
;181:	gclient_t	*cl;
;182:	int			idnum;
;183:	char		s2[MAX_STRING_CHARS];
;184:	char		n2[MAX_STRING_CHARS];
;185:
;186:	// numeric values are just slot numbers
;187:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $140
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $140
line 188
;188:		idnum = atoi( s );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 189
;189:		if ( idnum < 0 || idnum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $145
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $142
LABELV $145
line 190
;190:			trap_SendServerCommand( to-g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $146
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
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
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 191
;191:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $139
JUMPV
LABELV $142
line 194
;192:		}
;193:
;194:		cl = &level.clients[idnum];
ADDRLP4 0
CNSTI4 1756
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 195
;195:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $147
line 196
;196:			trap_SendServerCommand( to-g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $149
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2068
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
ADDRLP4 2068
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 197
;197:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $139
JUMPV
LABELV $147
line 199
;198:		}
;199:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $139
JUMPV
LABELV $140
line 203
;200:	}
;201:
;202:	// check for a name match
;203:	SanitizeString( s, s2 );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 204
;204:	for ( idnum=0,cl=level.clients ; idnum < level.maxclients ; idnum++,cl++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $153
JUMPV
LABELV $150
line 205
;205:		if ( cl->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $155
line 206
;206:			continue;
ADDRGP4 $151
JUMPV
LABELV $155
line 208
;207:		}
;208:		SanitizeString( cl->pers.netname, n2 );
ADDRLP4 0
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 209
;209:		if ( !strcmp( n2, s2 ) ) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $157
line 210
;210:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $139
JUMPV
LABELV $157
line 212
;211:		}
;212:	}
LABELV $151
line 204
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1756
ADDP4
ASGNP4
LABELV $153
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $150
line 214
;213:
;214:	trap_SendServerCommand( to-g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $159
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
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
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 215
;215:	return -1;
CNSTI4 -1
RETI4
LABELV $139
endproc ClientNumberFromString 2072 8
export Cmd_Give_f
proc Cmd_Give_f 3200 12
line 226
;216:}
;217:
;218:/*
;219:==================
;220:Cmd_Give_f
;221:
;222:Give items to a client
;223:==================
;224:*/
;225:void Cmd_Give_f (gentity_t *ent)
;226:{
line 235
;227:	char		name[MAX_TOKEN_CHARS];
;228:	gitem_t		*it;
;229:	int			i;
;230:	qboolean	give_all;
;231:	gentity_t		*it_ent;
;232:	trace_t		trace;
;233:	char		arg[MAX_TOKEN_CHARS];
;234:
;235:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 3144
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 3144
INDIRI4
CNSTI4 0
NEI4 $161
line 236
;236:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 239
;237:	}
;238:
;239:	trap_Argv( 1, name, sizeof( name ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 241
;240:
;241:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 3148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3148
INDIRI4
CNSTI4 0
NEI4 $163
line 242
;242:		give_all = qtrue;
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
line 244
;243:	else
;244:		give_all = qfalse;
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $164
line 246
;245:
;246:	if (give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $166
line 247
;247:	{
line 248
;248:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $168
line 250
;249:		while (i < HI_NUM_HOLDABLE)
;250:		{
line 251
;251:			ent->client->ps.stats[STAT_HOLDABLE_ITEMS] |= (1 << i);
ADDRLP4 3152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 224
ADDP4
ASGNP4
ADDRLP4 3152
INDIRP4
ADDRLP4 3152
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 252
;252:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 253
;253:		}
LABELV $169
line 249
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $168
line 254
;254:		i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 255
;255:	}
LABELV $166
line 257
;256:
;257:	if (give_all || Q_stricmp( name, "health") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $174
ADDRLP4 4
ARGP4
ADDRGP4 $173
ARGP4
ADDRLP4 3152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3152
INDIRI4
CNSTI4 0
NEI4 $171
LABELV $174
line 258
;258:	{
line 259
;259:		if (trap_Argc() == 3) {
ADDRLP4 3156
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3156
INDIRI4
CNSTI4 3
NEI4 $175
line 260
;260:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 261
;261:			ent->health = atoi(arg);
ADDRLP4 1036
ARGP4
ADDRLP4 3160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 3160
INDIRI4
ASGNI4
line 262
;262:			if (ent->health > ent->client->ps.stats[STAT_MAX_HEALTH]) {
ADDRLP4 3164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3164
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 3164
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $176
line 263
;263:				ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 3168
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3168
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 3168
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 264
;264:			}
line 265
;265:		}
ADDRGP4 $176
JUMPV
LABELV $175
line 266
;266:		else {
line 267
;267:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 3160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3160
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 3160
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 268
;268:		}
LABELV $176
line 269
;269:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $179
line 270
;270:			return;
ADDRGP4 $160
JUMPV
LABELV $179
line 271
;271:	}
LABELV $171
line 273
;272:
;273:	if (give_all || Q_stricmp(name, "weapons") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $184
ADDRLP4 4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 3156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3156
INDIRI4
CNSTI4 0
NEI4 $181
LABELV $184
line 274
;274:	{
line 275
;275:		ent->client->ps.stats[STAT_WEAPONS] = (1 << (WP_DET_PACK+1))  - ( 1 << WP_NONE );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
CNSTI4 16383
ASGNI4
line 276
;276:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $185
line 277
;277:			return;
ADDRGP4 $160
JUMPV
LABELV $185
line 278
;278:	}
LABELV $181
line 280
;279:	
;280:	if ( !give_all && Q_stricmp(name, "weaponnum") == 0 )
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $187
ADDRLP4 4
ARGP4
ADDRGP4 $189
ARGP4
ADDRLP4 3160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3160
INDIRI4
CNSTI4 0
NEI4 $187
line 281
;281:	{
line 282
;282:		trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 283
;283:		ent->client->ps.stats[STAT_WEAPONS] |= (1 << atoi(arg));
ADDRLP4 1036
ARGP4
ADDRLP4 3164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3168
INDIRP4
ADDRLP4 3168
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 3164
INDIRI4
LSHI4
BORI4
ASGNI4
line 284
;284:		return;
ADDRGP4 $160
JUMPV
LABELV $187
line 287
;285:	}
;286:
;287:	if (give_all || Q_stricmp(name, "ammo") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $193
ADDRLP4 4
ARGP4
ADDRGP4 $192
ARGP4
ADDRLP4 3164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3164
INDIRI4
CNSTI4 0
NEI4 $190
LABELV $193
line 288
;288:	{
line 289
;289:		int num = 999;
ADDRLP4 3168
CNSTI4 999
ASGNI4
line 290
;290:		if (trap_Argc() == 3) {
ADDRLP4 3172
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3172
INDIRI4
CNSTI4 3
NEI4 $194
line 291
;291:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 292
;292:			num = atoi(arg);
ADDRLP4 1036
ARGP4
ADDRLP4 3176
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3168
ADDRLP4 3176
INDIRI4
ASGNI4
line 293
;293:		}
LABELV $194
line 294
;294:		for ( i = 0 ; i < MAX_WEAPONS ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $196
line 295
;295:			ent->client->ps.ammo[i] = num;
ADDRLP4 3176
CNSTI4 408
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDRLP4 3176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 3176
INDIRI4
ADDP4
ADDP4
ADDRLP4 3168
INDIRI4
ASGNI4
line 296
;296:		}
LABELV $197
line 294
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $196
line 297
;297:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $200
line 298
;298:			return;
ADDRGP4 $160
JUMPV
LABELV $200
line 299
;299:	}
LABELV $190
line 301
;300:
;301:	if (give_all || Q_stricmp(name, "armor") == 0)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $205
ADDRLP4 4
ARGP4
ADDRGP4 $204
ARGP4
ADDRLP4 3168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3168
INDIRI4
CNSTI4 0
NEI4 $202
LABELV $205
line 302
;302:	{
line 303
;303:		if (trap_Argc() == 3) {
ADDRLP4 3172
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 3172
INDIRI4
CNSTI4 3
NEI4 $206
line 304
;304:			trap_Argv( 2, arg, sizeof( arg ) );
CNSTI4 2
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 305
;305:			ent->client->ps.stats[STAT_ARMOR] = atoi(arg);
ADDRLP4 1036
ARGP4
ADDRLP4 3176
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 3176
INDIRI4
ASGNI4
line 306
;306:		} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 307
;307:			ent->client->ps.stats[STAT_ARMOR] = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 3176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 3176
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 3176
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 308
;308:		}
LABELV $207
line 310
;309:
;310:		if (!give_all)
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $208
line 311
;311:			return;
ADDRGP4 $160
JUMPV
LABELV $208
line 312
;312:	}
LABELV $202
line 314
;313:
;314:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 3172
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3172
INDIRI4
CNSTI4 0
NEI4 $210
line 315
;315:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 3176
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 3176
INDIRP4
ADDRLP4 3176
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 316
;316:		return;
ADDRGP4 $160
JUMPV
LABELV $210
line 318
;317:	}
;318:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 3176
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3176
INDIRI4
CNSTI4 0
NEI4 $213
line 319
;319:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 3180
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 316
ADDP4
ASGNP4
ADDRLP4 3180
INDIRP4
ADDRLP4 3180
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 320
;320:		return;
ADDRGP4 $160
JUMPV
LABELV $213
line 322
;321:	}
;322:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $218
ARGP4
ADDRLP4 3180
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3180
INDIRI4
CNSTI4 0
NEI4 $216
line 323
;323:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 3184
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 332
ADDP4
ASGNP4
ADDRLP4 3184
INDIRP4
ADDRLP4 3184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 324
;324:		return;
ADDRGP4 $160
JUMPV
LABELV $216
line 326
;325:	}
;326:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $221
ARGP4
ADDRLP4 3184
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3184
INDIRI4
CNSTI4 0
NEI4 $219
line 327
;327:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 3188
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 324
ADDP4
ASGNP4
ADDRLP4 3188
INDIRP4
ADDRLP4 3188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 328
;328:		return;
ADDRGP4 $160
JUMPV
LABELV $219
line 330
;329:	}
;330:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
ARGP4
ADDRGP4 $224
ARGP4
ADDRLP4 3188
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 3188
INDIRI4
CNSTI4 0
NEI4 $222
line 331
;331:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 3192
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 328
ADDP4
ASGNP4
ADDRLP4 3192
INDIRP4
ADDRLP4 3192
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 332
;332:		return;
ADDRGP4 $160
JUMPV
LABELV $222
line 336
;333:	}
;334:
;335:	// spawn a specific item right on the player
;336:	if ( !give_all ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $225
line 337
;337:		it = BG_FindItem (name);
ADDRLP4 4
ARGP4
ADDRLP4 3192
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 2060
ADDRLP4 3192
INDIRP4
ASGNP4
line 338
;338:		if (!it) {
ADDRLP4 2060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $227
line 339
;339:			return;
ADDRGP4 $160
JUMPV
LABELV $227
line 342
;340:		}
;341:
;342:		it_ent = G_Spawn();
ADDRLP4 3196
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 3196
INDIRP4
ASGNP4
line 343
;343:		VectorCopy( ent->r.currentOrigin, it_ent->s.origin );
ADDRLP4 1032
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRB
ASGNB 12
line 344
;344:		it_ent->classname = it->classname;
ADDRLP4 1032
INDIRP4
CNSTI4 416
ADDP4
ADDRLP4 2060
INDIRP4
INDIRP4
ASGNP4
line 345
;345:		G_SpawnItem (it_ent, it);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 346
;346:		FinishSpawningItem(it_ent );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 347
;347:		memset( &trace, 0, sizeof( trace ) );
ADDRLP4 2064
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1080
ARGI4
ADDRGP4 memset
CALLP4
pop
line 348
;348:		Touch_Item (it_ent, ent, &trace);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 2064
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 349
;349:		if (it_ent->inuse) {
ADDRLP4 1032
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 350
;350:			G_FreeEntity( it_ent );
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 351
;351:		}
LABELV $229
line 352
;352:	}
LABELV $225
line 353
;353:}
LABELV $160
endproc Cmd_Give_f 3200 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 366
;354:
;355:
;356:/*
;357:==================
;358:Cmd_God_f
;359:
;360:Sets client to godmode
;361:
;362:argv(0) god
;363:==================
;364:*/
;365:void Cmd_God_f (gentity_t *ent)
;366:{
line 369
;367:	char	*msg;
;368:
;369:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $232
line 370
;370:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 373
;371:	}
;372:
;373:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 374
;374:	if (!(ent->flags & FL_GODMODE) )
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $234
line 375
;375:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $236
ASGNP4
ADDRGP4 $235
JUMPV
LABELV $234
line 377
;376:	else
;377:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $237
ASGNP4
LABELV $235
line 379
;378:
;379:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 380
;380:}
LABELV $231
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 392
;381:
;382:
;383:/*
;384:==================
;385:Cmd_Notarget_f
;386:
;387:Sets client to notarget
;388:
;389:argv(0) notarget
;390:==================
;391:*/
;392:void Cmd_Notarget_f( gentity_t *ent ) {
line 395
;393:	char	*msg;
;394:
;395:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $240
line 396
;396:		return;
ADDRGP4 $239
JUMPV
LABELV $240
line 399
;397:	}
;398:
;399:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 400
;400:	if (!(ent->flags & FL_NOTARGET) )
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $242
line 401
;401:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $244
ASGNP4
ADDRGP4 $243
JUMPV
LABELV $242
line 403
;402:	else
;403:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $245
ASGNP4
LABELV $243
line 405
;404:
;405:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
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
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 406
;406:}
LABELV $239
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 416
;407:
;408:
;409:/*
;410:==================
;411:Cmd_Noclip_f
;412:
;413:argv(0) noclip
;414:==================
;415:*/
;416:void Cmd_Noclip_f( gentity_t *ent ) {
line 419
;417:	char	*msg;
;418:
;419:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $247
line 420
;420:		return;
ADDRGP4 $246
JUMPV
LABELV $247
line 423
;421:	}
;422:
;423:	if ( ent->client->noclip ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 424
;424:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $251
ASGNP4
line 425
;425:	} else {
ADDRGP4 $250
JUMPV
LABELV $249
line 426
;426:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $252
ASGNP4
line 427
;427:	}
LABELV $250
line 428
;428:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1576
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $254
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $255
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 430
;429:
;430:	trap_SendServerCommand( ent-g_entities, va("print \"%s\"", msg));
ADDRGP4 $238
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 431
;431:}
LABELV $246
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 444
;432:
;433:
;434:/*
;435:==================
;436:Cmd_LevelShot_f
;437:
;438:This is just to help generate the level pictures
;439:for the menus.  It goes to the intermission immediately
;440:and sends over a command to the client to resize the view,
;441:hide the scoreboard, and take a special screenshot
;442:==================
;443:*/
;444:void Cmd_LevelShot_f( gentity_t *ent ) {
line 445
;445:	if ( !CheatsOk( ent ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $257
line 446
;446:		return;
ADDRGP4 $256
JUMPV
LABELV $257
line 450
;447:	}
;448:
;449:	// doesn't work in single player
;450:	if ( g_gametype.integer != 0 ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
EQI4 $259
line 451
;451:		trap_SendServerCommand( ent-g_entities, 
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
ADDRGP4 $262
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 453
;452:			"print \"Must be in g_gametype 0 for levelshot\n\"" );
;453:		return;
ADDRGP4 $256
JUMPV
LABELV $259
line 456
;454:	}
;455:
;456:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 457
;457:	trap_SendServerCommand( ent-g_entities, "clientLevelShot" );
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
ADDRGP4 $263
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 458
;458:}
LABELV $256
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 471
;459:
;460:
;461:/*
;462:==================
;463:Cmd_LevelShot_f
;464:
;465:This is just to help generate the level pictures
;466:for the menus.  It goes to the intermission immediately
;467:and sends over a command to the client to resize the view,
;468:hide the scoreboard, and take a special screenshot
;469:==================
;470:*/
;471:void Cmd_TeamTask_f( gentity_t *ent ) {
line 475
;472:	char userinfo[MAX_INFO_STRING];
;473:	char		arg[MAX_TOKEN_CHARS];
;474:	int task;
;475:	int client = ent->client - level.clients;
ADDRLP4 1024
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
ASGNI4
line 477
;476:
;477:	if ( trap_Argc() != 2 ) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $265
line 478
;478:		return;
ADDRGP4 $264
JUMPV
LABELV $265
line 480
;479:	}
;480:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 481
;481:	task = atoi( arg );
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 483
;482:
;483:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 484
;484:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $268
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLV
pop
line 485
;485:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 486
;486:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 487
;487:}
LABELV $264
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 496
;488:
;489:
;490:
;491:/*
;492:=================
;493:Cmd_Kill_f
;494:=================
;495:*/
;496:void Cmd_Kill_f( gentity_t *ent ) {
line 497
;497:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $270
line 498
;498:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 500
;499:	}
;500:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
GTI4 $272
line 501
;501:		return;
ADDRGP4 $269
JUMPV
LABELV $272
line 504
;502:	}
;503:
;504:	if (g_gametype.integer == GT_TOURNAMENT && level.numPlayingClients > 1 && !level.warmupTime)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $274
ADDRGP4 level+80
INDIRI4
CNSTI4 1
LEI4 $274
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $274
line 505
;505:	{
line 506
;506:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "ATTEMPTDUELKILL")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 507
;507:		return;
ADDRGP4 $269
JUMPV
LABELV $274
line 510
;508:	}
;509:
;510:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 511
;511:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 512
;512:	player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 513
;513:}
LABELV $269
endproc Cmd_Kill_f 16 20
export G_GetDuelWinner
proc G_GetDuelWinner 16 0
line 516
;514:
;515:gentity_t *G_GetDuelWinner(gclient_t *client)
;516:{
line 520
;517:	gclient_t *wCl;
;518:	int i;
;519:
;520:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 521
;521:		wCl = &level.clients[i];
ADDRLP4 0
CNSTI4 1756
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 523
;522:		
;523:		if (wCl && wCl != client && /*wCl->ps.clientNum != client->ps.clientNum &&*/
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $286
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $286
ADDRLP4 0
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
NEI4 $286
ADDRLP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
EQI4 $286
line 525
;524:			wCl->pers.connected == CON_CONNECTED && wCl->sess.sessionTeam != TEAM_SPECTATOR)
;525:		{
line 526
;526:			return &g_entities[wCl->ps.clientNum];
CNSTI4 828
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $280
JUMPV
LABELV $286
line 528
;527:		}
;528:	}
LABELV $282
line 520
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $281
line 530
;529:
;530:	return NULL;
CNSTP4 0
RETP4
LABELV $280
endproc G_GetDuelWinner 16 0
export BroadcastTeamChange
proc BroadcastTeamChange 12 16
line 541
;531:}
;532:
;533:/*
;534:=================
;535:BroadCastTeamChange
;536:
;537:Let everyone know about a team change
;538:=================
;539:*/
;540:void BroadcastTeamChange( gclient_t *client, int oldTeam )
;541:{
line 542
;542:	client->ps.fd.forceDoInit = 1; //every time we change teams make sure our force powers are set right
ADDRFP4 0
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 1
ASGNI4
line 544
;543:
;544:	if ( client->sess.sessionTeam == TEAM_RED ) {
ADDRFP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 1
NEI4 $289
line 545
;545:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 547
;546:			client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEREDTEAM")) );
;547:	} else if ( client->sess.sessionTeam == TEAM_BLUE ) {
ADDRGP4 $290
JUMPV
LABELV $289
ADDRFP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 2
NEI4 $293
line 548
;548:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 0
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 550
;549:		client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBLUETEAM")));
;550:	} else if ( client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR ) {
ADDRGP4 $294
JUMPV
LABELV $293
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $296
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $296
line 551
;551:		trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 4
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 553
;552:		client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHESPECTATORS")));
;553:	} else if ( client->sess.sessionTeam == TEAM_FREE ) {
ADDRGP4 $297
JUMPV
LABELV $296
ADDRFP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $299
line 554
;554:		if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $301
line 555
;555:		{
line 571
;556:			/*
;557:			gentity_t *currentWinner = G_GetDuelWinner(client);
;558:
;559:			if (currentWinner && currentWinner->client)
;560:			{
;561:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s %s\n\"",
;562:				currentWinner->client->pers.netname, G_GetStripEdString("SVINGAME", "VERSUS"), client->pers.netname));
;563:			}
;564:			else
;565:			{
;566:				trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
;567:				client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBATTLE")));
;568:			}
;569:			*/
;570:			//NOTE: Just doing a vs. once it counts two players up
;571:		}
ADDRGP4 $302
JUMPV
LABELV $301
line 573
;572:		else
;573:		{
line 574
;574:			trap_SendServerCommand( -1, va("cp \"%s" S_COLOR_WHITE " %s\n\"",
ADDRGP4 $116
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 4
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $291
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 576
;575:			client->pers.netname, G_GetStripEdString("SVINGAME", "JOINEDTHEBATTLE")));
;576:		}
LABELV $302
line 577
;577:	}
LABELV $299
LABELV $297
LABELV $294
LABELV $290
line 579
;578:
;579:	G_LogPrintf ( "setteam:  %i %s %s\n",
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 TeamName
CALLP4
ASGNP4
ADDRGP4 $305
ARGP4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 583
;580:				  client - &level.clients[0],
;581:				  TeamName ( oldTeam ),
;582:				  TeamName ( client->sess.sessionTeam ) );
;583:}
LABELV $288
endproc BroadcastTeamChange 12 16
export SetTeam
proc SetTeam 104 20
line 590
;584:
;585:/*
;586:=================
;587:SetTeam
;588:=================
;589:*/
;590:void SetTeam( gentity_t *ent, char *s ) {
line 601
;591:	int					team, oldTeam;
;592:	gclient_t			*client;
;593:	int					clientNum;
;594:	spectatorState_t	specState;
;595:	int					specClient;
;596:	int					teamLeader;
;597:
;598:	//
;599:	// see what change is requested
;600:	//
;601:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 603
;602:
;603:	clientNum = client - level.clients;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1756
DIVI4
ASGNI4
line 604
;604:	specClient = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 605
;605:	specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 606
;606:	if ( !Q_stricmp( s, "scoreboard" ) || !Q_stricmp( s, "score" )  ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $309
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $311
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $310
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $307
LABELV $311
line 607
;607:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 608
;608:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 609
;609:	} else if ( !Q_stricmp( s, "follow1" ) ) {
ADDRGP4 $308
JUMPV
LABELV $307
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $312
line 610
;610:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 611
;611:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 612
;612:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 613
;613:	} else if ( !Q_stricmp( s, "follow2" ) ) {
ADDRGP4 $313
JUMPV
LABELV $312
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $317
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $315
line 614
;614:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 615
;615:		specState = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 616
;616:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 617
;617:	} else if ( !Q_stricmp( s, "spectator" ) || !Q_stricmp( s, "s" ) ) {
ADDRGP4 $316
JUMPV
LABELV $315
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $322
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $321
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $318
LABELV $322
line 618
;618:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 619
;619:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 620
;620:	} else if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 $319
JUMPV
LABELV $318
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $323
line 622
;621:		// if running a team game, assign player to one of the teams
;622:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 623
;623:		if ( !Q_stricmp( s, "red" ) || !Q_stricmp( s, "r" ) ) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $328
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $330
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $329
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $326
LABELV $330
line 624
;624:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 625
;625:		} else if ( !Q_stricmp( s, "blue" ) || !Q_stricmp( s, "b" ) ) {
ADDRGP4 $327
JUMPV
LABELV $326
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $333
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $335
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $331
LABELV $335
line 626
;626:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 627
;627:		} else {
ADDRGP4 $332
JUMPV
LABELV $331
line 645
;628:			// pick the team with the least number of players
;629:			//For now, don't do this. The legalize function will set powers properly now.
;630:			/*
;631:			if (g_forceBasedTeams.integer)
;632:			{
;633:				if (ent->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
;634:				{
;635:					team = TEAM_BLUE;
;636:				}
;637:				else
;638:				{
;639:					team = TEAM_RED;
;640:				}
;641:			}
;642:			else
;643:			{
;644:			*/
;645:				team = PickTeam( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 647
;646:			//}
;647:		}
LABELV $332
LABELV $327
line 649
;648:
;649:		if ( g_teamForceBalance.integer  ) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $324
line 652
;650:			int		counts[TEAM_NUM_TEAMS];
;651:
;652:			counts[TEAM_BLUE] = TeamCount( ent->client->ps.clientNum, TEAM_BLUE );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 84
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 68+8
ADDRLP4 84
INDIRI4
ASGNI4
line 653
;653:			counts[TEAM_RED] = TeamCount( ent->client->ps.clientNum, TEAM_RED );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 88
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 68+4
ADDRLP4 88
INDIRI4
ASGNI4
line 656
;654:
;655:			// We allow a spread of two
;656:			if ( team == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1 ) {
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $341
ADDRLP4 68+4
INDIRI4
ADDRLP4 68+8
INDIRI4
SUBI4
ADDRLP4 92
INDIRI4
LEI4 $341
line 666
;657:				//For now, don't do this. The legalize function will set powers properly now.
;658:				/*
;659:				if (g_forceBasedTeams.integer && ent->client->ps.fd.forceSide == FORCE_DARKSIDE)
;660:				{
;661:					trap_SendServerCommand( ent->client->ps.clientNum, 
;662:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYRED_SWITCH")) );
;663:				}
;664:				else
;665:				*/
;666:				{
line 667
;667:					trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRGP4 $116
ARGP4
ADDRGP4 $345
ARGP4
ADDRLP4 96
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 669
;668:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYRED")) );
;669:				}
line 670
;670:				return; // ignore the request
ADDRGP4 $306
JUMPV
LABELV $341
line 672
;671:			}
;672:			if ( team == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $324
ADDRLP4 68+8
INDIRI4
ADDRLP4 68+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $324
line 682
;673:				//For now, don't do this. The legalize function will set powers properly now.
;674:				/*
;675:				if (g_forceBasedTeams.integer && ent->client->ps.fd.forceSide == FORCE_LIGHTSIDE)
;676:				{
;677:					trap_SendServerCommand( ent->client->ps.clientNum, 
;678:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYBLUE_SWITCH")) );
;679:				}
;680:				else
;681:				*/
;682:				{
line 683
;683:					trap_SendServerCommand( ent->client->ps.clientNum, 
ADDRGP4 $116
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 96
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 685
;684:						va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TOOMANYBLUE")) );
;685:				}
line 686
;686:				return; // ignore the request
ADDRGP4 $306
JUMPV
line 690
;687:			}
;688:
;689:			// It's ok, the team we are switching to has less or same number of players
;690:		}
line 709
;691:
;692:		//For now, don't do this. The legalize function will set powers properly now.
;693:		/*
;694:		if (g_forceBasedTeams.integer)
;695:		{
;696:			if (team == TEAM_BLUE && ent->client->ps.fd.forceSide != FORCE_LIGHTSIDE)
;697:			{
;698:				trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBELIGHT")) );
;699:				return;
;700:			}
;701:			if (team == TEAM_RED && ent->client->ps.fd.forceSide != FORCE_DARKSIDE)
;702:			{
;703:				trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MUSTBEDARK")) );
;704:				return;
;705:			}
;706:		}
;707:		*/
;708:
;709:	} else {
LABELV $323
line 711
;710:		// force them to spectators if there aren't any spots free
;711:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 712
;712:	}
LABELV $324
LABELV $319
LABELV $316
LABELV $313
LABELV $308
line 715
;713:
;714:	// override decision if limiting the players
;715:	if ( (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $351
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LTI4 $351
line 716
;716:		&& level.numNonSpectatorClients >= 2 ) {
line 717
;717:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 718
;718:	} else if ( g_maxGameClients.integer > 0 && 
ADDRGP4 $352
JUMPV
LABELV $351
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $355
ADDRGP4 level+76
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $355
line 719
;719:		level.numNonSpectatorClients >= g_maxGameClients.integer ) {
line 720
;720:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 721
;721:	}
LABELV $355
LABELV $352
line 726
;722:
;723:	//
;724:	// decide if we will allow the change
;725:	//
;726:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 727
;727:	if ( team == oldTeam && team != TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $360
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $360
line 728
;728:		return;
ADDRGP4 $306
JUMPV
LABELV $360
line 736
;729:	}
;730:
;731:	//
;732:	// execute the team change
;733:	//
;734:
;735:	// if the player was dead leave the body
;736:	if ( client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $362
line 737
;737:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 738
;738:	}
LABELV $362
line 741
;739:
;740:	// he starts at 'base'
;741:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 1460
ADDP4
CNSTI4 0
ASGNI4
line 742
;742:	if ( oldTeam != TEAM_SPECTATOR ) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $364
line 744
;743:		// Kill him (makes sure he loses flags, etc)
;744:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 745
;745:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 746
;746:		player_die (ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 35
ARGI4
ADDRGP4 player_die
CALLV
pop
line 748
;747:
;748:	}
LABELV $364
line 750
;749:	// they go to the end of the line for tournements
;750:	if ( team == TEAM_SPECTATOR ) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $366
line 751
;751:		client->sess.spectatorTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 1524
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 752
;752:	}
LABELV $366
line 754
;753:
;754:	client->sess.sessionTeam = team;
ADDRLP4 0
INDIRP4
CNSTI4 1520
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 755
;755:	client->sess.spectatorState = specState;
ADDRLP4 0
INDIRP4
CNSTI4 1528
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 756
;756:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 758
;757:
;758:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 0
ASGNI4
line 759
;759:	if ( team == TEAM_RED || team == TEAM_BLUE ) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $371
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $369
LABELV $371
line 760
;760:		teamLeader = TeamLeader( team );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 762
;761:		// if there is no team leader or the team leader is a bot and this client is not a bot
;762:		if ( teamLeader == -1 || ( !(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT) ) ) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $378
ADDRLP4 68
CNSTI4 828
ASGNI4
ADDRLP4 72
CNSTI4 8
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 68
INDIRI4
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
NEI4 $372
ADDRLP4 68
INDIRI4
ADDRLP4 64
INDIRI4
MULI4
ADDRGP4 g_entities+296+8
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
BANDI4
ADDRLP4 76
INDIRI4
EQI4 $372
LABELV $378
line 763
;763:			SetLeader( team, clientNum );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 764
;764:		}
LABELV $372
line 765
;765:	}
LABELV $369
line 767
;766:	// make sure there is a team leader on the team the player came from
;767:	if ( oldTeam == TEAM_RED || oldTeam == TEAM_BLUE ) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $381
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $379
LABELV $381
line 768
;768:		CheckTeamLeader( oldTeam );
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 769
;769:	}
LABELV $379
line 771
;770:
;771:	BroadcastTeamChange( client, oldTeam );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 774
;772:
;773:	// get and distribute relevent paramters
;774:	ClientUserinfoChanged( clientNum );
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
line 776
;775:
;776:	ClientBegin( clientNum, qfalse );
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 777
;777:}
LABELV $306
endproc SetTeam 104 20
export StopFollowing
proc StopFollowing 12 0
line 787
;778:
;779:/*
;780:=================
;781:StopFollowing
;782:
;783:If the client being followed leaves the game, or you just want to drop
;784:to free floating spectator mode
;785:=================
;786:*/
;787:void StopFollowing( gentity_t *ent ) {
line 788
;788:	ent->client->ps.persistant[ PERS_TEAM ] = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 3
ASGNI4
line 789
;789:	ent->client->sess.sessionTeam = TEAM_SPECTATOR;	
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
CNSTI4 3
ASGNI4
line 790
;790:	ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 1
ASGNI4
line 791
;791:	ent->client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 12
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
line 792
;792:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 793
;793:	ent->client->ps.clientNum = ent - g_entities;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ASGNI4
line 794
;794:	ent->client->ps.weapon = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 795
;795:}
LABELV $382
endproc StopFollowing 12 0
export Cmd_Team_f
proc Cmd_Team_f 1068 12
line 802
;796:
;797:/*
;798:=================
;799:Cmd_Team_f
;800:=================
;801:*/
;802:void Cmd_Team_f( gentity_t *ent ) {
line 806
;803:	int			oldTeam;
;804:	char		s[MAX_TOKEN_CHARS];
;805:
;806:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $384
line 807
;807:		oldTeam = ent->client->sess.sessionTeam;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 808
;808:		switch ( oldTeam ) {
ADDRLP4 1032
ADDRLP4 1024
INDIRI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
LTI4 $383
ADDRLP4 1032
INDIRI4
CNSTI4 3
GTI4 $383
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $399
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $399
address $393
address $390
address $388
address $396
code
LABELV $388
line 810
;809:		case TEAM_BLUE:
;810:			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PRINTBLUETEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $389
ARGP4
ADDRLP4 1036
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
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
ADDRLP4 1040
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 811
;811:			break;
ADDRGP4 $383
JUMPV
LABELV $390
line 813
;812:		case TEAM_RED:
;813:			trap_SendServerCommand( ent-g_entities, va("print \"Red team\n\"", G_GetStripEdString("SVINGAME", "PRINTREDTEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $392
ARGP4
ADDRLP4 1044
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $391
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
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
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 814
;814:			break;
ADDRGP4 $383
JUMPV
LABELV $393
line 816
;815:		case TEAM_FREE:
;816:			trap_SendServerCommand( ent-g_entities, va("print \"Free team\n\"", G_GetStripEdString("SVINGAME", "PRINTFREETEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $395
ARGP4
ADDRLP4 1052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $394
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 817
;817:			break;
ADDRGP4 $383
JUMPV
LABELV $396
line 819
;818:		case TEAM_SPECTATOR:
;819:			trap_SendServerCommand( ent-g_entities, va("print \"Spectator team\n\"", G_GetStripEdString("SVINGAME", "PRINTSPECTEAM")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $398
ARGP4
ADDRLP4 1060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $397
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 1064
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
ADDRLP4 1064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 820
;820:			break;
line 822
;821:		}
;822:		return;
ADDRGP4 $383
JUMPV
LABELV $384
line 825
;823:	}
;824:
;825:	if ( ent->client->switchTeamTime > level.time ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1704
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $400
line 826
;826:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSWITCH")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 1032
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1036
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
ADDRLP4 1036
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 827
;827:		return;
ADDRGP4 $383
JUMPV
LABELV $400
line 831
;828:	}
;829:
;830:	// if they are playing a tournement game, count as a loss
;831:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $404
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $404
line 832
;832:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 833
;833:		ent->client->sess.losses++;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 834
;834:	}
LABELV $404
line 836
;835:
;836:	trap_Argv( 1, s, sizeof( s ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 838
;837:
;838:	SetTeam( ent, s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 840
;839:
;840:	ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1704
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 841
;841:}
LABELV $383
endproc Cmd_Team_f 1068 12
export Cmd_ForceChanged_f
proc Cmd_ForceChanged_f 2064 12
line 849
;842:
;843:/*
;844:=================
;845:Cmd_Team_f
;846:=================
;847:*/
;848:void Cmd_ForceChanged_f( gentity_t *ent )
;849:{
line 853
;850:	char fpChStr[1024];
;851:	const char *buf;
;852://	Cmd_Kill_f(ent);
;853:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $409
line 854
;854:	{ //if it's a spec, just make the changes now
line 857
;855:		//trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "FORCEAPPLIED")) );
;856:		//No longer print it, as the UI calls this a lot.
;857:		WP_InitForcePowers( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 WP_InitForcePowers
CALLV
pop
line 858
;858:		goto argCheck;
ADDRGP4 $411
JUMPV
LABELV $409
line 861
;859:	}
;860:
;861:	buf = G_GetStripEdString("SVINGAME", "FORCEPOWERCHANGED");
ADDRGP4 $116
ARGP4
ADDRGP4 $412
ARGP4
ADDRLP4 1028
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 863
;862:
;863:	strcpy(fpChStr, buf);
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 865
;864:
;865:	trap_SendServerCommand( ent-g_entities, va("print \"%s%s\n\"", S_COLOR_GREEN, fpChStr) );
ADDRGP4 $413
ARGP4
ADDRGP4 $414
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1032
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
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 867
;866:
;867:	ent->client->ps.fd.forceDoInit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1172
ADDP4
CNSTI4 1
ASGNI4
LABELV $411
line 869
;868:argCheck:
;869:	if (trap_Argc() > 1)
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
LEI4 $415
line 870
;870:	{
line 873
;871:		char	arg[MAX_TOKEN_CHARS];
;872:
;873:		trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 1040
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 875
;874:
;875:		if (arg && arg[0])
ADDRLP4 1040
CVPU4 4
CNSTU4 0
EQU4 $417
ADDRLP4 1040
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $417
line 876
;876:		{ //if there's an arg, assume it's a combo team command from the UI.
line 877
;877:			Cmd_Team_f(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
line 878
;878:		}
LABELV $417
line 879
;879:	}
LABELV $415
line 880
;880:}
LABELV $408
endproc Cmd_ForceChanged_f 2064 12
export Cmd_Follow_f
proc Cmd_Follow_f 1040 12
line 887
;881:
;882:/*
;883:=================
;884:Cmd_Follow_f
;885:=================
;886:*/
;887:void Cmd_Follow_f( gentity_t *ent ) {
line 891
;888:	int		i;
;889:	char	arg[MAX_TOKEN_CHARS];
;890:
;891:	if ( trap_Argc() != 2 ) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $420
line 892
;892:		if ( ent->client->sess.spectatorState == SPECTATOR_FOLLOW ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 2
NEI4 $419
line 893
;893:			StopFollowing( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 StopFollowing
CALLV
pop
line 894
;894:		}
line 895
;895:		return;
ADDRGP4 $419
JUMPV
LABELV $420
line 898
;896:	}
;897:
;898:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 899
;899:	i = ClientNumberFromString( ent, arg );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 900
;900:	if ( i == -1 ) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $424
line 901
;901:		return;
ADDRGP4 $419
JUMPV
LABELV $424
line 905
;902:	}
;903:
;904:	// can't follow self
;905:	if ( &level.clients[ i ] == ent->client ) {
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
NEU4 $426
line 906
;906:		return;
ADDRGP4 $419
JUMPV
LABELV $426
line 910
;907:	}
;908:
;909:	// can't follow another spectator
;910:	if ( level.clients[ i ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $428
line 911
;911:		return;
ADDRGP4 $419
JUMPV
LABELV $428
line 915
;912:	}
;913:
;914:	// if they are playing a tournement game, count as a loss
;915:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $430
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $430
line 916
;916:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 917
;917:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 918
;918:	}
LABELV $430
line 921
;919:
;920:	// first set them to spectator
;921:	if ( ent->client->sess.sessionTeam != TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
EQI4 $433
line 922
;922:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 923
;923:	}
LABELV $433
line 925
;924:
;925:	ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 2
ASGNI4
line 926
;926:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 927
;927:}
LABELV $419
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 12 8
line 934
;928:
;929:/*
;930:=================
;931:Cmd_FollowCycle_f
;932:=================
;933:*/
;934:void Cmd_FollowCycle_f( gentity_t *ent, int dir ) {
line 939
;935:	int		clientnum;
;936:	int		original;
;937:
;938:	// if they are playing a tournement game, count as a loss
;939:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $436
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $436
line 940
;940:		&& ent->client->sess.sessionTeam == TEAM_FREE ) {
line 941
;941:		ent->client->sess.losses++;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 942
;942:	}
LABELV $436
line 944
;943:	// first set them to spectator
;944:	if ( ent->client->sess.spectatorState == SPECTATOR_NOT ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
INDIRI4
CNSTI4 0
NEI4 $439
line 945
;945:		SetTeam( ent, "spectator" );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $320
ARGP4
ADDRGP4 SetTeam
CALLV
pop
line 946
;946:	}
LABELV $439
line 948
;947:
;948:	if ( dir != 1 && dir != -1 ) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $441
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $441
line 949
;949:		G_Error( "Cmd_FollowCycle_f: bad dir %i", dir );
ADDRGP4 $443
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 950
;950:	}
LABELV $441
line 952
;951:
;952:	clientnum = ent->client->sess.spectatorClient;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
INDIRI4
ASGNI4
line 953
;953:	original = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $444
line 954
;954:	do {
line 955
;955:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 956
;956:		if ( clientnum >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $447
line 957
;957:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 958
;958:		}
LABELV $447
line 959
;959:		if ( clientnum < 0 ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $450
line 960
;960:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 961
;961:		}
LABELV $450
line 964
;962:
;963:		// can only follow connected clients
;964:		if ( level.clients[ clientnum ].pers.connected != CON_CONNECTED ) {
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $453
line 965
;965:			continue;
ADDRGP4 $445
JUMPV
LABELV $453
line 969
;966:		}
;967:
;968:		// can't follow another spectator
;969:		if ( level.clients[ clientnum ].sess.sessionTeam == TEAM_SPECTATOR ) {
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $455
line 970
;970:			continue;
ADDRGP4 $445
JUMPV
LABELV $455
line 974
;971:		}
;972:
;973:		// this is good, we can use it
;974:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1532
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 975
;975:		ent->client->sess.spectatorState = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
CNSTI4 2
ASGNI4
line 976
;976:		return;
ADDRGP4 $435
JUMPV
LABELV $445
line 977
;977:	} while ( clientnum != original );
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $444
line 980
;978:
;979:	// leave it where it was
;980:}
LABELV $435
endproc Cmd_FollowCycle_f 12 8
proc G_SayTo 24 24
line 989
;981:
;982:
;983:/*
;984:==================
;985:G_Say
;986:==================
;987:*/
;988:
;989:static void G_SayTo( gentity_t *ent, gentity_t *other, int mode, int color, const char *name, const char *message ) {
line 990
;990:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $458
line 991
;991:		return;
ADDRGP4 $457
JUMPV
LABELV $458
line 993
;992:	}
;993:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $460
line 994
;994:		return;
ADDRGP4 $457
JUMPV
LABELV $460
line 996
;995:	}
;996:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $462
line 997
;997:		return;
ADDRGP4 $457
JUMPV
LABELV $462
line 999
;998:	}
;999:	if ( other->client->pers.connected != CON_CONNECTED ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 2
EQI4 $464
line 1000
;1000:		return;
ADDRGP4 $457
JUMPV
LABELV $464
line 1002
;1001:	}
;1002:	if ( mode == SAY_TEAM  && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $466
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $466
line 1003
;1003:		return;
ADDRGP4 $457
JUMPV
LABELV $466
line 1006
;1004:	}
;1005:	// no chatting to players in tournements
;1006:	if ( (g_gametype.integer == GT_TOURNAMENT )
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $468
ADDRLP4 4
CNSTI4 408
ASGNI4
ADDRLP4 8
CNSTI4 1520
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $468
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $468
line 1008
;1007:		&& other->client->sess.sessionTeam == TEAM_FREE
;1008:		&& ent->client->sess.sessionTeam != TEAM_FREE ) {
line 1009
;1009:		return;
ADDRGP4 $457
JUMPV
LABELV $468
line 1012
;1010:	}
;1011:
;1012:	trap_SendServerCommand( other-g_entities, va("%s \"%s%c%c%s\"", 
ADDRGP4 $471
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $475
ADDRLP4 16
ADDRGP4 $472
ASGNP4
ADDRGP4 $476
JUMPV
LABELV $475
ADDRLP4 16
ADDRGP4 $473
ASGNP4
LABELV $476
ADDRLP4 16
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1015
;1013:		mode == SAY_TEAM ? "tchat" : "chat",
;1014:		name, Q_COLOR_ESCAPE, color, message));
;1015:}
LABELV $457
endproc G_SayTo 24 24
export G_Say
proc G_Say 320 28
line 1019
;1016:
;1017:#define EC		"\x19"
;1018:
;1019:void G_Say( gentity_t *ent, gentity_t *target, int mode, const char *chatText ) {
line 1028
;1020:	int			j;
;1021:	gentity_t	*other;
;1022:	int			color;
;1023:	char		name[64];
;1024:	// don't let text be too long for malicious reasons
;1025:	char		text[MAX_SAY_TEXT];
;1026:	char		location[64];
;1027:
;1028:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $478
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $478
line 1029
;1029:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1030
;1030:	}
LABELV $478
line 1032
;1031:
;1032:	switch ( mode ) {
ADDRLP4 292
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $483
ADDRLP4 292
INDIRI4
CNSTI4 1
EQI4 $486
ADDRLP4 292
INDIRI4
CNSTI4 2
EQI4 $492
ADDRGP4 $481
JUMPV
LABELV $481
LABELV $483
line 1035
;1033:	default:
;1034:	case SAY_ALL:
;1035:		G_LogPrintf( "say: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $484
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1036
;1036:		Com_sprintf (name, sizeof(name), "%s%c%c"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $485
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1037
;1037:		color = COLOR_GREEN;
ADDRLP4 224
CNSTI4 50
ASGNI4
line 1038
;1038:		break;
ADDRGP4 $482
JUMPV
LABELV $486
line 1040
;1039:	case SAY_TEAM:
;1040:		G_LogPrintf( "sayteam: %s: %s\n", ent->client->pers.netname, chatText );
ADDRGP4 $487
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1041
;1041:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 296
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
EQI4 $488
line 1042
;1042:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC") (%s)"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $490
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $489
JUMPV
LABELV $488
line 1045
;1043:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
;1044:		else
;1045:			Com_sprintf (name, sizeof(name), EC"(%s%c%c"EC")"EC": ", 
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $491
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $489
line 1047
;1046:				ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
;1047:		color = COLOR_CYAN;
ADDRLP4 224
CNSTI4 53
ASGNI4
line 1048
;1048:		break;
ADDRGP4 $482
JUMPV
LABELV $492
line 1050
;1049:	case SAY_TELL:
;1050:		if (target && g_gametype.integer >= GT_TEAM &&
ADDRLP4 300
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $493
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $493
ADDRLP4 304
CNSTI4 408
ASGNI4
ADDRLP4 308
CNSTI4 1520
ASGNI4
ADDRLP4 312
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 300
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
ADDRLP4 312
INDIRP4
ADDRLP4 304
INDIRI4
ADDP4
INDIRP4
ADDRLP4 308
INDIRI4
ADDP4
INDIRI4
NEI4 $493
ADDRLP4 312
INDIRP4
ARGP4
ADDRLP4 228
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 316
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 316
INDIRI4
CNSTI4 0
EQI4 $493
line 1053
;1051:			target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
;1052:			Team_GetLocationMsg(ent, location, sizeof(location)))
;1053:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"] (%s)"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $496
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
ADDRGP4 $494
JUMPV
LABELV $493
line 1055
;1054:		else
;1055:			Com_sprintf (name, sizeof(name), EC"[%s%c%c"EC"]"EC": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE );
ADDRLP4 158
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $497
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $494
line 1056
;1056:		color = COLOR_MAGENTA;
ADDRLP4 224
CNSTI4 54
ASGNI4
line 1057
;1057:		break;
LABELV $482
line 1060
;1058:	}
;1059:
;1060:	Q_strncpyz( text, chatText, sizeof(text) );
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1062
;1061:
;1062:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $498
line 1063
;1063:		G_SayTo( ent, target, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1064
;1064:		return;
ADDRGP4 $477
JUMPV
LABELV $498
line 1068
;1065:	}
;1066:
;1067:	// echo the text to the console
;1068:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $500
line 1069
;1069:		G_Printf( "%s%s\n", name, text);
ADDRGP4 $503
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1070
;1070:	}
LABELV $500
line 1073
;1071:
;1072:	// send it to all the apropriate clients
;1073:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $507
JUMPV
LABELV $504
line 1074
;1074:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1075
;1075:		G_SayTo( ent, other, mode, color, name, text );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 224
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 1076
;1076:	}
LABELV $505
line 1073
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $507
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $504
line 1077
;1077:}
LABELV $477
endproc G_Say 320 28
proc Cmd_Say_f 12 16
line 1085
;1078:
;1079:
;1080:/*
;1081:==================
;1082:Cmd_Say_f
;1083:==================
;1084:*/
;1085:static void Cmd_Say_f( gentity_t *ent, int mode, qboolean arg0 ) {
line 1088
;1086:	char		*p;
;1087:
;1088:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $510
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $510
line 1089
;1089:		return;
ADDRGP4 $509
JUMPV
LABELV $510
line 1092
;1090:	}
;1091:
;1092:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $512
line 1093
;1093:	{
line 1094
;1094:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1095
;1095:	}
ADDRGP4 $513
JUMPV
LABELV $512
line 1097
;1096:	else
;1097:	{
line 1098
;1098:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1099
;1099:	}
LABELV $513
line 1101
;1100:
;1101:	G_Say( ent, NULL, mode, p );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1102
;1102:}
LABELV $509
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1076 16
line 1109
;1103:
;1104:/*
;1105:==================
;1106:Cmd_Tell_f
;1107:==================
;1108:*/
;1109:static void Cmd_Tell_f( gentity_t *ent ) {
line 1115
;1110:	int			targetNum;
;1111:	gentity_t	*target;
;1112:	char		*p;
;1113:	char		arg[MAX_TOKEN_CHARS];
;1114:
;1115:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $515
line 1116
;1116:		return;
ADDRGP4 $514
JUMPV
LABELV $515
line 1119
;1117:	}
;1118:
;1119:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1120
;1120:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1121
;1121:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $520
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $517
LABELV $520
line 1122
;1122:		return;
ADDRGP4 $514
JUMPV
LABELV $517
line 1125
;1123:	}
;1124:
;1125:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1126
;1126:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $524
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $524
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $521
LABELV $524
line 1127
;1127:		return;
ADDRGP4 $514
JUMPV
LABELV $521
line 1130
;1128:	}
;1129:
;1130:	p = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1132
;1131:
;1132:	G_LogPrintf( "tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p );
ADDRGP4 $525
ARGP4
ADDRLP4 1060
CNSTI4 408
ASGNI4
ADDRLP4 1064
CNSTI4 1416
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1133
;1133:	G_Say( ent, target, SAY_TELL, p );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1136
;1134:	// don't tell to the player self if it was already directed to this player
;1135:	// also don't send the chat back to a bot
;1136:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $526
ADDRLP4 1068
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $526
line 1137
;1137:		G_Say( ent, ent, SAY_TELL, p );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1138
;1138:	}
LABELV $526
line 1139
;1139:}
LABELV $514
endproc Cmd_Tell_f 1076 16
proc G_VoiceTo 16 24
line 1142
;1140:
;1141:
;1142:static void G_VoiceTo( gentity_t *ent, gentity_t *other, int mode, const char *id, qboolean voiceonly ) {
line 1146
;1143:	int color;
;1144:	char *cmd;
;1145:
;1146:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $529
line 1147
;1147:		return;
ADDRGP4 $528
JUMPV
LABELV $529
line 1149
;1148:	}
;1149:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $531
line 1150
;1150:		return;
ADDRGP4 $528
JUMPV
LABELV $531
line 1152
;1151:	}
;1152:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $533
line 1153
;1153:		return;
ADDRGP4 $528
JUMPV
LABELV $533
line 1155
;1154:	}
;1155:	if ( mode == SAY_TEAM && !OnSameTeam(ent, other) ) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $535
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $535
line 1156
;1156:		return;
ADDRGP4 $528
JUMPV
LABELV $535
line 1159
;1157:	}
;1158:	// no chatting to players in tournements
;1159:	if ( (g_gametype.integer == GT_TOURNAMENT )) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $537
line 1160
;1160:		return;
ADDRGP4 $528
JUMPV
LABELV $537
line 1163
;1161:	}
;1162:
;1163:	if (mode == SAY_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $540
line 1164
;1164:		color = COLOR_CYAN;
ADDRLP4 0
CNSTI4 53
ASGNI4
line 1165
;1165:		cmd = "vtchat";
ADDRLP4 4
ADDRGP4 $542
ASGNP4
line 1166
;1166:	}
ADDRGP4 $541
JUMPV
LABELV $540
line 1167
;1167:	else if (mode == SAY_TELL) {
ADDRFP4 8
INDIRI4
CNSTI4 2
NEI4 $543
line 1168
;1168:		color = COLOR_MAGENTA;
ADDRLP4 0
CNSTI4 54
ASGNI4
line 1169
;1169:		cmd = "vtell";
ADDRLP4 4
ADDRGP4 $545
ASGNP4
line 1170
;1170:	}
ADDRGP4 $544
JUMPV
LABELV $543
line 1171
;1171:	else {
line 1172
;1172:		color = COLOR_GREEN;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1173
;1173:		cmd = "vchat";
ADDRLP4 4
ADDRGP4 $546
ASGNP4
line 1174
;1174:	}
LABELV $544
LABELV $541
line 1176
;1175:
;1176:	trap_SendServerCommand( other-g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
ADDRGP4 $547
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1177
;1177:}
LABELV $528
endproc G_VoiceTo 16 24
export G_Voice
proc G_Voice 8 20
line 1179
;1178:
;1179:void G_Voice( gentity_t *ent, gentity_t *target, int mode, const char *id, qboolean voiceonly ) {
line 1183
;1180:	int			j;
;1181:	gentity_t	*other;
;1182:
;1183:	if ( g_gametype.integer < GT_TEAM && mode == SAY_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $549
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $549
line 1184
;1184:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 1185
;1185:	}
LABELV $549
line 1187
;1186:
;1187:	if ( target ) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $552
line 1188
;1188:		G_VoiceTo( ent, target, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1189
;1189:		return;
ADDRGP4 $548
JUMPV
LABELV $552
line 1193
;1190:	}
;1191:
;1192:	// echo the text to the console
;1193:	if ( g_dedicated.integer ) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $554
line 1194
;1194:		G_Printf( "voice: %s %s\n", ent->client->pers.netname, id);
ADDRGP4 $557
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1195
;1195:	}
LABELV $554
line 1198
;1196:
;1197:	// send it to all the apropriate clients
;1198:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $561
JUMPV
LABELV $558
line 1199
;1199:		other = &g_entities[j];
ADDRLP4 4
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1200
;1200:		G_VoiceTo( ent, other, mode, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 G_VoiceTo
CALLV
pop
line 1201
;1201:	}
LABELV $559
line 1198
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $561
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $558
line 1202
;1202:}
LABELV $548
endproc G_Voice 8 20
proc Cmd_Voice_f 12 20
line 1209
;1203:
;1204:/*
;1205:==================
;1206:Cmd_Voice_f
;1207:==================
;1208:*/
;1209:static void Cmd_Voice_f( gentity_t *ent, int mode, qboolean arg0, qboolean voiceonly ) {
line 1212
;1210:	char		*p;
;1211:
;1212:	if ( trap_Argc () < 2 && !arg0 ) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $564
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $564
line 1213
;1213:		return;
ADDRGP4 $563
JUMPV
LABELV $564
line 1216
;1214:	}
;1215:
;1216:	if (arg0)
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $566
line 1217
;1217:	{
line 1218
;1218:		p = ConcatArgs( 0 );
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1219
;1219:	}
ADDRGP4 $567
JUMPV
LABELV $566
line 1221
;1220:	else
;1221:	{
line 1222
;1222:		p = ConcatArgs( 1 );
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 1223
;1223:	}
LABELV $567
line 1225
;1224:
;1225:	G_Voice( ent, NULL, mode, p, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1226
;1226:}
LABELV $563
endproc Cmd_Voice_f 12 20
proc Cmd_VoiceTell_f 1076 20
line 1233
;1227:
;1228:/*
;1229:==================
;1230:Cmd_VoiceTell_f
;1231:==================
;1232:*/
;1233:static void Cmd_VoiceTell_f( gentity_t *ent, qboolean voiceonly ) {
line 1239
;1234:	int			targetNum;
;1235:	gentity_t	*target;
;1236:	char		*id;
;1237:	char		arg[MAX_TOKEN_CHARS];
;1238:
;1239:	if ( trap_Argc () < 2 ) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $569
line 1240
;1240:		return;
ADDRGP4 $568
JUMPV
LABELV $569
line 1243
;1241:	}
;1242:
;1243:	trap_Argv( 1, arg, sizeof( arg ) );
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1244
;1244:	targetNum = atoi( arg );
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1040
INDIRI4
ASGNI4
line 1245
;1245:	if ( targetNum < 0 || targetNum >= level.maxclients ) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $574
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $571
LABELV $574
line 1246
;1246:		return;
ADDRGP4 $568
JUMPV
LABELV $571
line 1249
;1247:	}
;1248:
;1249:	target = &g_entities[targetNum];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1250
;1250:	if ( !target || !target->inuse || !target->client ) {
ADDRLP4 1052
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
EQU4 $578
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $578
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 1052
INDIRU4
NEU4 $575
LABELV $578
line 1251
;1251:		return;
ADDRGP4 $568
JUMPV
LABELV $575
line 1254
;1252:	}
;1253:
;1254:	id = ConcatArgs( 2 );
CNSTI4 2
ARGI4
ADDRLP4 1056
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1056
INDIRP4
ASGNP4
line 1256
;1255:
;1256:	G_LogPrintf( "vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id );
ADDRGP4 $579
ARGP4
ADDRLP4 1060
CNSTI4 408
ASGNI4
ADDRLP4 1064
CNSTI4 1416
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 1060
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1064
INDIRI4
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1257
;1257:	G_Voice( ent, target, SAY_TELL, id, voiceonly );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1260
;1258:	// don't tell to the player self if it was already directed to this player
;1259:	// also don't send the chat back to a bot
;1260:	if ( ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1068
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1068
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $580
ADDRLP4 1068
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $580
line 1261
;1261:		G_Voice( ent, ent, SAY_TELL, id, voiceonly );
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRLP4 1072
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1262
;1262:	}
LABELV $580
line 1263
;1263:}
LABELV $568
endproc Cmd_VoiceTell_f 1076 20
proc Cmd_VoiceTaunt_f 56 20
line 1271
;1264:
;1265:
;1266:/*
;1267:==================
;1268:Cmd_VoiceTaunt_f
;1269:==================
;1270:*/
;1271:static void Cmd_VoiceTaunt_f( gentity_t *ent ) {
line 1275
;1272:	gentity_t *who;
;1273:	int i;
;1274:
;1275:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $583
line 1276
;1276:		return;
ADDRGP4 $582
JUMPV
LABELV $583
line 1280
;1277:	}
;1278:
;1279:	// insult someone who just killed you
;1280:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $585
ADDRLP4 20
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRU4
EQU4 $585
ADDRLP4 20
INDIRP4
CNSTI4 1660
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
INDIRI4
NEI4 $585
line 1282
;1281:		// i am a dead corpse
;1282:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $587
line 1283
;1283:			G_Voice( ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $589
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1284
;1284:		}
LABELV $587
line 1285
;1285:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $590
line 1286
;1286:			G_Voice( ent, ent,        SAY_TELL, VOICECHAT_DEATHINSULT, qfalse );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $589
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1287
;1287:		}
LABELV $590
line 1288
;1288:		ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
CNSTP4 0
ASGNP4
line 1289
;1289:		return;
ADDRGP4 $582
JUMPV
LABELV $585
line 1292
;1290:	}
;1291:	// insult someone you just killed
;1292:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1660
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $592
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
INDIRI4
EQI4 $592
line 1293
;1293:		who = g_entities + ent->client->lastkilled_client;
ADDRLP4 0
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1660
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1294
;1294:		if (who->client) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $594
line 1296
;1295:			// who is the person I just killed
;1296:			if (who->client->lasthurt_mod == MOD_STUN_BATON) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1668
ADDP4
INDIRI4
CNSTI4 1
NEI4 $596
line 1297
;1297:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $598
line 1298
;1298:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );	// and I killed them with a gauntlet
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $600
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1299
;1299:				}
LABELV $598
line 1300
;1300:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $597
line 1301
;1301:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $600
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1302
;1302:				}
line 1303
;1303:			} else {
ADDRGP4 $597
JUMPV
LABELV $596
line 1304
;1304:				if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $603
line 1305
;1305:					G_Voice( ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );	// and I killed them with something else
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $605
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1306
;1306:				}
LABELV $603
line 1307
;1307:				if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $606
line 1308
;1308:					G_Voice( ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $605
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1309
;1309:				}
LABELV $606
line 1310
;1310:			}
LABELV $597
line 1311
;1311:			ent->client->lastkilled_client = -1;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1660
ADDP4
CNSTI4 -1
ASGNI4
line 1312
;1312:			return;
ADDRGP4 $582
JUMPV
LABELV $594
line 1314
;1313:		}
;1314:	}
LABELV $592
line 1316
;1315:
;1316:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $608
line 1318
;1317:		// praise a team mate who just got a reward
;1318:		for(i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $611
line 1319
;1319:			who = g_entities + i;
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1320
;1320:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
ADDRLP4 36
CNSTI4 408
ASGNI4
ADDRLP4 40
ADDRLP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $615
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 44
INDIRP4
CVPU4 4
EQU4 $615
ADDRLP4 48
CNSTI4 1520
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
ADDRLP4 44
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRI4
NEI4 $615
line 1321
;1321:				if (who->client->rewardTime > level.time) {
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1684
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $617
line 1322
;1322:					if (!(who->r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $620
line 1323
;1323:						G_Voice( ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 $622
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1324
;1324:					}
LABELV $620
line 1325
;1325:					if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $582
line 1326
;1326:						G_Voice( ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse );
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
CNSTI4 2
ARGI4
ADDRGP4 $622
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1327
;1327:					}
line 1328
;1328:					return;
ADDRGP4 $582
JUMPV
LABELV $617
line 1330
;1329:				}
;1330:			}
LABELV $615
line 1331
;1331:		}
LABELV $612
line 1318
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $611
line 1332
;1332:	}
LABELV $608
line 1335
;1333:
;1334:	// just say something
;1335:	G_Voice( ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 $625
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 G_Voice
CALLV
pop
line 1336
;1336:}
LABELV $582
endproc Cmd_VoiceTaunt_f 56 20
data
align 4
LABELV gc_orders
address $626
address $627
address $628
address $629
address $630
address $631
address $632
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1060 16
line 1350
;1337:
;1338:
;1339:
;1340:static char	*gc_orders[] = {
;1341:	"hold your position",
;1342:	"hold this position",
;1343:	"come here",
;1344:	"cover me",
;1345:	"guard location",
;1346:	"search and destroy",
;1347:	"report"
;1348:};
;1349:
;1350:void Cmd_GameCommand_f( gentity_t *ent ) {
line 1355
;1351:	int		player;
;1352:	int		order;
;1353:	char	str[MAX_TOKEN_CHARS];
;1354:
;1355:	trap_Argv( 1, str, sizeof( str ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1356
;1356:	player = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1357
;1357:	trap_Argv( 2, str, sizeof( str ) );
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1358
;1358:	order = atoi( str );
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1360
;1359:
;1360:	if ( player < 0 || player >= MAX_CLIENTS ) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $636
ADDRLP4 1028
INDIRI4
CNSTI4 32
LTI4 $634
LABELV $636
line 1361
;1361:		return;
ADDRGP4 $633
JUMPV
LABELV $634
line 1363
;1362:	}
;1363:	if ( order < 0 || order > sizeof(gc_orders)/sizeof(char *) ) {
ADDRLP4 1024
INDIRI4
CNSTI4 0
LTI4 $639
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $637
LABELV $639
line 1364
;1364:		return;
ADDRGP4 $633
JUMPV
LABELV $637
line 1366
;1365:	}
;1366:	G_Say( ent, &g_entities[player], SAY_TELL, gc_orders[order] );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 828
ADDRLP4 1028
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 1048
CNSTI4 2
ASGNI4
ADDRLP4 1048
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1048
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1367
;1367:	G_Say( ent, ent, SAY_TELL, gc_orders[order] );
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
CNSTI4 2
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1024
INDIRI4
ADDRLP4 1056
INDIRI4
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1368
;1368:}
LABELV $633
endproc Cmd_GameCommand_f 1060 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1375
;1369:
;1370:/*
;1371:==================
;1372:Cmd_Where_f
;1373:==================
;1374:*/
;1375:void Cmd_Where_f( gentity_t *ent ) {
line 1376
;1376:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", vtos( ent->s.origin ) ) );
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
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
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1377
;1377:}
LABELV $640
endproc Cmd_Where_f 8 8
data
align 4
LABELV gameNames
address $641
address $642
address $643
address $644
address $645
address $646
address $647
address $648
address $649
export Cmd_CallVote_f
code
proc Cmd_CallVote_f 3144 24
line 1396
;1378:
;1379:static const char *gameNames[] = {
;1380:	"Free For All",
;1381:	"Holocron FFA",
;1382:	"Jedi Master",
;1383:	"Duel",
;1384:	"Single Player",
;1385:	"Team FFA",
;1386:	"N/A",
;1387:	"Capture the Flag",
;1388:	"Capture the Ysalamiri"
;1389:};
;1390:
;1391:/*
;1392:==================
;1393:Cmd_CallVote_f
;1394:==================
;1395:*/
;1396:void Cmd_CallVote_f( gentity_t *ent ) {
line 1401
;1397:	int		i;
;1398:	char	arg1[MAX_STRING_TOKENS];
;1399:	char	arg2[MAX_STRING_TOKENS];
;1400:
;1401:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $651
line 1402
;1402:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $654
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1403
;1403:		return;
ADDRGP4 $650
JUMPV
LABELV $651
line 1406
;1404:	}
;1405:
;1406:	if ( level.voteTime ) {
ADDRGP4 level+2276
INDIRI4
CNSTI4 0
EQI4 $655
line 1407
;1407:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEINPROGRESS")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $658
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1408
;1408:		return;
ADDRGP4 $650
JUMPV
LABELV $655
line 1410
;1409:	}
;1410:	if ( ent->client->pers.voteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1508
ADDP4
INDIRI4
CNSTI4 3
LTI4 $659
line 1411
;1411:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MAXVOTES")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $661
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1412
;1412:		return;
ADDRGP4 $650
JUMPV
LABELV $659
line 1414
;1413:	}
;1414:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $662
line 1415
;1415:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSPECVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $664
ARGP4
ADDRLP4 2052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2052
INDIRP4
ARGP4
ADDRLP4 2056
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
ADDRLP4 2056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1416
;1416:		return;
ADDRGP4 $650
JUMPV
LABELV $662
line 1420
;1417:	}
;1418:
;1419:	// make sure it is a valid command to vote on
;1420:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1421
;1421:	trap_Argv( 2, arg2, sizeof( arg2 ) );
CNSTI4 2
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1423
;1422:
;1423:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2052
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2052
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $667
ADDRLP4 1028
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2056
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2056
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $665
LABELV $667
line 1424
;1424:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $668
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1425
;1425:		return;
ADDRGP4 $650
JUMPV
LABELV $665
line 1428
;1426:	}
;1427:
;1428:	if ( !Q_stricmp( arg1, "map_restart" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $671
ARGP4
ADDRLP4 2060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $669
line 1429
;1429:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $670
JUMPV
LABELV $669
ADDRLP4 4
ARGP4
ADDRGP4 $674
ARGP4
ADDRLP4 2064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
CNSTI4 0
NEI4 $672
line 1430
;1430:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $673
JUMPV
LABELV $672
ADDRLP4 4
ARGP4
ADDRGP4 $677
ARGP4
ADDRLP4 2068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $675
line 1431
;1431:	} else if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRGP4 $676
JUMPV
LABELV $675
ADDRLP4 4
ARGP4
ADDRGP4 $680
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $678
line 1432
;1432:	} else if ( !Q_stricmp( arg1, "kick" ) ) {
ADDRGP4 $679
JUMPV
LABELV $678
ADDRLP4 4
ARGP4
ADDRGP4 $683
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2076
INDIRI4
CNSTI4 0
NEI4 $681
line 1433
;1433:	} else if ( !Q_stricmp( arg1, "clientkick" ) ) {
ADDRGP4 $682
JUMPV
LABELV $681
ADDRLP4 4
ARGP4
ADDRGP4 $686
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $684
line 1434
;1434:	} else if ( !Q_stricmp( arg1, "g_doWarmup" ) ) {
ADDRGP4 $685
JUMPV
LABELV $684
ADDRLP4 4
ARGP4
ADDRGP4 $689
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $687
line 1435
;1435:	} else if ( !Q_stricmp( arg1, "timelimit" ) ) {
ADDRGP4 $688
JUMPV
LABELV $687
ADDRLP4 4
ARGP4
ADDRGP4 $692
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2088
INDIRI4
CNSTI4 0
NEI4 $690
line 1436
;1436:	} else if ( !Q_stricmp( arg1, "fraglimit" ) ) {
ADDRGP4 $691
JUMPV
LABELV $690
ADDRLP4 4
ARGP4
ADDRGP4 $695
ARGP4
ADDRLP4 2092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2092
INDIRI4
CNSTI4 0
NEI4 $693
line 1437
;1437:	} else {
ADDRGP4 $694
JUMPV
LABELV $693
line 1438
;1438:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $668
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1439
;1439:		trap_SendServerCommand( ent-g_entities, "print \"Vote commands are: map_restart, nextmap, map <mapname>, g_gametype <n>, kick <player>, clientkick <clientnum>, g_doWarmup, timelimit <time>, fraglimit <frags>.\n\"" );
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
ADDRGP4 $696
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1440
;1440:		return;
ADDRGP4 $650
JUMPV
LABELV $694
LABELV $691
LABELV $688
LABELV $685
LABELV $682
LABELV $679
LABELV $676
LABELV $673
LABELV $670
line 1444
;1441:	}
;1442:
;1443:	// if there is still a vote to be executed
;1444:	if ( level.voteExecuteTime ) {
ADDRGP4 level+2280
INDIRI4
CNSTI4 0
EQI4 $697
line 1445
;1445:		level.voteExecuteTime = 0;
ADDRGP4 level+2280
CNSTI4 0
ASGNI4
line 1446
;1446:		trap_SendConsoleCommand( EXEC_APPEND, va("%s\n", level.voteString ) );
ADDRGP4 $701
ARGP4
ADDRGP4 level+228
ARGP4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1447
;1447:	}
LABELV $697
line 1450
;1448:
;1449:	// special case for g_gametype, check for bad values
;1450:	if ( !Q_stricmp( arg1, "g_gametype" ) ) {
ADDRLP4 4
ARGP4
ADDRGP4 $680
ARGP4
ADDRLP4 2096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2096
INDIRI4
CNSTI4 0
NEI4 $703
line 1451
;1451:		i = atoi( arg2 );
ADDRLP4 1028
ARGP4
ADDRLP4 2100
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2100
INDIRI4
ASGNI4
line 1452
;1452:		if( i == GT_SINGLE_PLAYER || i < GT_FFA || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $708
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $708
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $705
LABELV $708
line 1453
;1453:			trap_SendServerCommand( ent-g_entities, "print \"Invalid gametype.\n\"" );
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
ADDRGP4 $709
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1454
;1454:			return;
ADDRGP4 $650
JUMPV
LABELV $705
line 1457
;1455:		}
;1456:
;1457:		level.votingGametype = qtrue;
ADDRGP4 level+2296
CNSTI4 1
ASGNI4
line 1458
;1458:		level.votingGametypeTo = i;
ADDRGP4 level+2300
ADDRLP4 0
INDIRI4
ASGNI4
line 1460
;1459:
;1460:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %d", arg1, i );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $714
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1461
;1461:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s %s", arg1, gameNames[i] );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $717
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gameNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1462
;1462:	} else if ( !Q_stricmp( arg1, "map" ) ) {
ADDRGP4 $704
JUMPV
LABELV $703
ADDRLP4 4
ARGP4
ADDRGP4 $677
ARGP4
ADDRLP4 2100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2100
INDIRI4
CNSTI4 0
NEI4 $718
line 1467
;1463:		// special case for map changes, we want to reset the nextmap setting
;1464:		// this allows a player to change maps, but not upset the map rotation
;1465:		char	s[MAX_STRING_CHARS];
;1466:
;1467:		if (!G_DoesMapSupportGametype(arg2, trap_Cvar_VariableIntegerValue("g_gametype")))
ADDRGP4 $680
ARGP4
ADDRLP4 3128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1028
ARGP4
ADDRLP4 3128
INDIRI4
ARGI4
ADDRLP4 3132
ADDRGP4 G_DoesMapSupportGametype
CALLI4
ASGNI4
ADDRLP4 3132
INDIRI4
CNSTI4 0
NEI4 $720
line 1468
;1468:		{
line 1470
;1469:			//trap_SendServerCommand( ent-g_entities, "print \"You can't vote for this map, it isn't supported by the current gametype.\n\"" );
;1470:			trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE_MAPNOTSUPPORTEDBYGAME")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $722
ARGP4
ADDRLP4 3136
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 3136
INDIRP4
ARGP4
ADDRLP4 3140
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
ADDRLP4 3140
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1471
;1471:			return;
ADDRGP4 $650
JUMPV
LABELV $720
line 1474
;1472:		}
;1473:
;1474:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $674
ARGP4
ADDRLP4 2104
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1475
;1475:		if (*s) {
ADDRLP4 2104
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $723
line 1476
;1476:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s; set nextmap \"%s\"", arg1, arg2, s );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $727
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 2104
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1477
;1477:		} else {
ADDRGP4 $724
JUMPV
LABELV $723
line 1478
;1478:			Com_sprintf( level.voteString, sizeof( level.voteString ), "%s %s", arg1, arg2 );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $717
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1479
;1479:		}
LABELV $724
line 1480
;1480:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $732
ARGP4
ADDRGP4 level+228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1481
;1481:	} else if ( !Q_stricmp( arg1, "nextmap" ) ) {
ADDRGP4 $719
JUMPV
LABELV $718
ADDRLP4 4
ARGP4
ADDRGP4 $674
ARGP4
ADDRLP4 2104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2104
INDIRI4
CNSTI4 0
NEI4 $734
line 1484
;1482:		char	s[MAX_STRING_CHARS];
;1483:
;1484:		trap_Cvar_VariableStringBuffer( "nextmap", s, sizeof(s) );
ADDRGP4 $674
ARGP4
ADDRLP4 2108
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1485
;1485:		if (!*s) {
ADDRLP4 2108
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $736
line 1486
;1486:			trap_SendServerCommand( ent-g_entities, "print \"nextmap not set.\n\"" );
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
ADDRGP4 $738
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1487
;1487:			return;
ADDRGP4 $650
JUMPV
LABELV $736
line 1489
;1488:		}
;1489:		Com_sprintf( level.voteString, sizeof( level.voteString ), "vstr nextmap");
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $741
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1490
;1490:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $732
ARGP4
ADDRGP4 level+228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1491
;1491:	} else {
ADDRGP4 $735
JUMPV
LABELV $734
line 1492
;1492:		Com_sprintf( level.voteString, sizeof( level.voteString ), "%s \"%s\"", arg1, arg2 );
ADDRGP4 level+228
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $747
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1493
;1493:		Com_sprintf( level.voteDisplayString, sizeof( level.voteDisplayString ), "%s", level.voteString );
ADDRGP4 level+1252
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $732
ARGP4
ADDRGP4 level+228
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1494
;1494:	}
LABELV $735
LABELV $719
LABELV $704
line 1496
;1495:
;1496:	trap_SendServerCommand( -1, va("print \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLCALLEDVOTE") ) );
ADDRGP4 $116
ARGP4
ADDRGP4 $752
ARGP4
ADDRLP4 2108
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $751
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 2108
INDIRP4
ARGP4
ADDRLP4 2112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1499
;1497:
;1498:	// start the voting, the caller autoamtically votes yes
;1499:	level.voteTime = level.time;
ADDRGP4 level+2276
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1500
;1500:	level.voteYes = 1;
ADDRGP4 level+2284
CNSTI4 1
ASGNI4
line 1501
;1501:	level.voteNo = 0;
ADDRGP4 level+2288
CNSTI4 0
ASGNI4
line 1503
;1502:
;1503:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $760
JUMPV
LABELV $757
line 1504
;1504:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2116
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2116
INDIRP4
ADDRLP4 2116
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1505
;1505:	}
LABELV $758
line 1503
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $760
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $757
line 1506
;1506:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2116
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2116
INDIRP4
ADDRLP4 2116
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1508
;1507:
;1508:	trap_SetConfigstring( CS_VOTE_TIME, va("%i", level.voteTime ) );
ADDRGP4 $762
ARGP4
ADDRGP4 level+2276
INDIRI4
ARGI4
ADDRLP4 2120
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2120
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1509
;1509:	trap_SetConfigstring( CS_VOTE_STRING, level.voteDisplayString );	
CNSTI4 9
ARGI4
ADDRGP4 level+1252
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1510
;1510:	trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $762
ARGP4
ADDRGP4 level+2284
INDIRI4
ARGI4
ADDRLP4 2124
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2124
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1511
;1511:	trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $762
ARGP4
ADDRGP4 level+2288
INDIRI4
ARGI4
ADDRLP4 2128
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2128
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1512
;1512:}
LABELV $650
endproc Cmd_CallVote_f 3144 24
export Cmd_Vote_f
proc Cmd_Vote_f 84 12
line 1519
;1513:
;1514:/*
;1515:==================
;1516:Cmd_Vote_f
;1517:==================
;1518:*/
;1519:void Cmd_Vote_f( gentity_t *ent ) {
line 1522
;1520:	char		msg[64];
;1521:
;1522:	if ( !level.voteTime ) {
ADDRGP4 level+2276
INDIRI4
CNSTI4 0
NEI4 $768
line 1523
;1523:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEINPROG")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $771
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1524
;1524:		return;
ADDRGP4 $767
JUMPV
LABELV $768
line 1526
;1525:	}
;1526:	if ( ent->client->ps.eFlags & EF_VOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $772
line 1527
;1527:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "VOTEALREADY")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $774
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1528
;1528:		return;
ADDRGP4 $767
JUMPV
LABELV $772
line 1530
;1529:	}
;1530:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
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
line 1531
;1531:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEASSPEC")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $777
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1532
;1532:		return;
ADDRGP4 $767
JUMPV
LABELV $775
line 1535
;1533:	}
;1534:
;1535:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLVOTECAST")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $778
ARGP4
ADDRLP4 64
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
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
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1537
;1536:
;1537:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1539
;1538:
;1539:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1541
;1540:
;1541:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $784
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $784
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $779
LABELV $784
line 1542
;1542:		level.voteYes++;
ADDRLP4 76
ADDRGP4 level+2284
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1543
;1543:		trap_SetConfigstring( CS_VOTE_YES, va("%i", level.voteYes ) );
ADDRGP4 $762
ARGP4
ADDRGP4 level+2284
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1544
;1544:	} else {
ADDRGP4 $780
JUMPV
LABELV $779
line 1545
;1545:		level.voteNo++;
ADDRLP4 76
ADDRGP4 level+2288
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1546
;1546:		trap_SetConfigstring( CS_VOTE_NO, va("%i", level.voteNo ) );	
ADDRGP4 $762
ARGP4
ADDRGP4 level+2288
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1547
;1547:	}
LABELV $780
line 1551
;1548:
;1549:	// a majority will be determined in CheckVote, which will also account
;1550:	// for players entering or leaving
;1551:}
LABELV $767
endproc Cmd_Vote_f 84 12
export Cmd_CallTeamVote_f
proc Cmd_CallTeamVote_f 2164 20
line 1558
;1552:
;1553:/*
;1554:==================
;1555:Cmd_CallTeamVote_f
;1556:==================
;1557:*/
;1558:void Cmd_CallTeamVote_f( gentity_t *ent ) {
line 1563
;1559:	int		i, team, cs_offset;
;1560:	char	arg1[MAX_STRING_TOKENS];
;1561:	char	arg2[MAX_STRING_TOKENS];
;1562:
;1563:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 1564
;1564:	if ( team == TEAM_RED )
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $790
line 1565
;1565:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $791
JUMPV
LABELV $790
line 1566
;1566:	else if ( team == TEAM_BLUE )
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $789
line 1567
;1567:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1569
;1568:	else
;1569:		return;
LABELV $793
LABELV $791
line 1571
;1570:
;1571:	if ( !g_allowVote.integer ) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $794
line 1572
;1572:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $654
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1573
;1573:		return;
ADDRGP4 $789
JUMPV
LABELV $794
line 1576
;1574:	}
;1575:
;1576:	if ( level.teamVoteTime[cs_offset] ) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $797
line 1577
;1577:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEALREADY")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $800
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1578
;1578:		return;
ADDRGP4 $789
JUMPV
LABELV $797
line 1580
;1579:	}
;1580:	if ( ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1512
ADDP4
INDIRI4
CNSTI4 3
LTI4 $801
line 1581
;1581:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "MAXTEAMVOTES")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $803
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1582
;1582:		return;
ADDRGP4 $789
JUMPV
LABELV $801
line 1584
;1583:	}
;1584:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $804
line 1585
;1585:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOSPECVOTE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $664
ARGP4
ADDRLP4 2060
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRLP4 2064
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
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1586
;1586:		return;
ADDRGP4 $789
JUMPV
LABELV $804
line 1590
;1587:	}
;1588:
;1589:	// make sure it is a valid command to vote on
;1590:	trap_Argv( 1, arg1, sizeof( arg1 ) );
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1591
;1591:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1592
;1592:	for ( i = 2; i < trap_Argc(); i++ ) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $809
JUMPV
LABELV $806
line 1593
;1593:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $810
line 1594
;1594:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $812
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $810
line 1595
;1595:		trap_Argv( i, &arg2[strlen(arg2)], sizeof( arg2 ) - strlen(arg2) );
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1596
;1596:	}
LABELV $807
line 1592
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $809
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $806
line 1598
;1597:
;1598:	if( strchr( arg1, ';' ) || strchr( arg2, ';' ) ) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $815
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $813
LABELV $815
line 1599
;1599:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $668
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1600
;1600:		return;
ADDRGP4 $789
JUMPV
LABELV $813
line 1603
;1601:	}
;1602:
;1603:	if ( !Q_stricmp( arg1, "leader" ) ) {
ADDRLP4 1036
ARGP4
ADDRGP4 $818
ARGP4
ADDRLP4 2072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2072
INDIRI4
CNSTI4 0
NEI4 $816
line 1606
;1604:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1605:
;1606:		if ( !arg2[0] ) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $819
line 1607
;1607:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 1608
;1608:		}
ADDRGP4 $820
JUMPV
LABELV $819
line 1609
;1609:		else {
line 1611
;1610:			// numeric values are just slot numbers
;1611:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $821
line 1612
;1612:				if ( !arg2[i] || arg2[i] < '0' || arg2[i] > '9' )
ADDRLP4 2148
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2148
INDIRI4
CNSTI4 0
EQI4 $828
ADDRLP4 2148
INDIRI4
CNSTI4 48
LTI4 $828
ADDRLP4 2148
INDIRI4
CNSTI4 57
LEI4 $825
LABELV $828
line 1613
;1613:					break;
ADDRGP4 $823
JUMPV
LABELV $825
line 1614
;1614:			}
LABELV $822
line 1611
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $821
LABELV $823
line 1615
;1615:			if ( i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $831
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $829
LABELV $831
line 1616
;1616:				i = atoi( arg2 );
ADDRLP4 4
ARGP4
ADDRLP4 2152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2152
INDIRI4
ASGNI4
line 1617
;1617:				if ( i < 0 || i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $835
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $832
LABELV $835
line 1618
;1618:					trap_SendServerCommand( ent-g_entities, va("print \"Bad client slot: %i\n\"", i) );
ADDRGP4 $146
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1619
;1619:					return;
ADDRGP4 $789
JUMPV
LABELV $832
line 1622
;1620:				}
;1621:
;1622:				if ( !g_entities[i].inuse ) {
CNSTI4 828
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $830
line 1623
;1623:					trap_SendServerCommand( ent-g_entities, va("print \"Client %i is not active\n\"", i) );
ADDRGP4 $149
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2160
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
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1624
;1624:					return;
ADDRGP4 $789
JUMPV
line 1626
;1625:				}
;1626:			}
LABELV $829
line 1627
;1627:			else {
line 1628
;1628:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2112
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1629
;1629:				Q_CleanStr(leader);
ADDRLP4 2112
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1630
;1630:				for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $842
JUMPV
LABELV $839
line 1631
;1631:					if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 0
NEI4 $844
line 1632
;1632:						continue;
ADDRGP4 $840
JUMPV
LABELV $844
line 1633
;1633:					if (level.clients[i].sess.sessionTeam != team)
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $846
line 1634
;1634:						continue;
ADDRGP4 $840
JUMPV
LABELV $846
line 1635
;1635:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2076
ARGP4
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1416
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1636
;1636:					Q_CleanStr(netname);
ADDRLP4 2076
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1637
;1637:					if ( !Q_stricmp(netname, leader) ) {
ADDRLP4 2076
ARGP4
ADDRLP4 2112
ARGP4
ADDRLP4 2152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2152
INDIRI4
CNSTI4 0
NEI4 $848
line 1638
;1638:						break;
ADDRGP4 $841
JUMPV
LABELV $848
line 1640
;1639:					}
;1640:				}
LABELV $840
line 1630
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $842
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $839
LABELV $841
line 1641
;1641:				if ( i >= level.maxclients ) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $850
line 1642
;1642:					trap_SendServerCommand( ent-g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2) );
ADDRGP4 $853
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2152
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
ADDRLP4 2152
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1643
;1643:					return;
ADDRGP4 $789
JUMPV
LABELV $850
line 1645
;1644:				}
;1645:			}
LABELV $830
line 1646
;1646:		}
LABELV $820
line 1647
;1647:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $268
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1648
;1648:	} else {
ADDRGP4 $817
JUMPV
LABELV $816
line 1649
;1649:		trap_SendServerCommand( ent-g_entities, "print \"Invalid vote string.\n\"" );
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
ADDRGP4 $668
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1650
;1650:		trap_SendServerCommand( ent-g_entities, "print \"Team vote commands are: leader <player>.\n\"" );
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
ADDRGP4 $854
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1651
;1651:		return;
ADDRGP4 $789
JUMPV
LABELV $817
line 1654
;1652:	}
;1653:
;1654:	Com_sprintf( level.teamVoteString[cs_offset], sizeof( level.teamVoteString[cs_offset] ), "%s %s", arg1, arg2 );
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $717
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 1656
;1655:
;1656:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $860
JUMPV
LABELV $857
line 1657
;1657:		if ( level.clients[i].pers.connected == CON_DISCONNECTED )
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1368
ADDP4
INDIRI4
CNSTI4 0
NEI4 $862
line 1658
;1658:			continue;
ADDRGP4 $858
JUMPV
LABELV $862
line 1659
;1659:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $864
line 1660
;1660:			trap_SendServerCommand( i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname ) );
ADDRGP4 $866
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 2076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2076
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $864
line 1661
;1661:	}
LABELV $858
line 1656
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $860
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $857
line 1664
;1662:
;1663:	// start the voting, the caller autoamtically votes yes
;1664:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1665
;1665:	level.teamVoteYes[cs_offset] = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
CNSTI4 1
ASGNI4
line 1666
;1666:	level.teamVoteNo[cs_offset] = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
CNSTI4 0
ASGNI4
line 1668
;1667:
;1668:	for ( i = 0 ; i < level.maxclients ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $874
JUMPV
LABELV $871
line 1669
;1669:		if (level.clients[i].sess.sessionTeam == team)
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 1520
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $876
line 1670
;1670:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2076
CNSTI4 1756
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
LABELV $876
line 1671
;1671:	}
LABELV $872
line 1668
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $874
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $871
line 1672
;1672:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2076
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 2076
INDIRP4
ADDRLP4 2076
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1674
;1673:
;1674:	trap_SetConfigstring( CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset] ) );
ADDRGP4 $762
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
ARGI4
ADDRLP4 2080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2080
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1675
;1675:	trap_SetConfigstring( CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset] );
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+2304
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1676
;1676:	trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $762
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
INDIRI4
ARGI4
ADDRLP4 2088
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2088
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1677
;1677:	trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );
ADDRGP4 $762
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1678
;1678:}
LABELV $789
endproc Cmd_CallTeamVote_f 2164 20
export Cmd_TeamVote_f
proc Cmd_TeamVote_f 92 12
line 1685
;1679:
;1680:/*
;1681:==================
;1682:Cmd_TeamVote_f
;1683:==================
;1684:*/
;1685:void Cmd_TeamVote_f( gentity_t *ent ) {
line 1689
;1686:	int			team, cs_offset;
;1687:	char		msg[64];
;1688:
;1689:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
ASGNI4
line 1690
;1690:	if ( team == TEAM_RED )
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $883
line 1691
;1691:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $883
line 1692
;1692:	else if ( team == TEAM_BLUE )
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $882
line 1693
;1693:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1695
;1694:	else
;1695:		return;
LABELV $886
LABELV $884
line 1697
;1696:
;1697:	if ( !level.teamVoteTime[cs_offset] ) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4352
ADDP4
INDIRI4
CNSTI4 0
NEI4 $887
line 1698
;1698:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOTEAMVOTEINPROG")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $890
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1699
;1699:		return;
ADDRGP4 $882
JUMPV
LABELV $887
line 1701
;1700:	}
;1701:	if ( ent->client->ps.eFlags & EF_TEAMVOTED ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $891
line 1702
;1702:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "TEAMVOTEALREADYCAST")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $893
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1703
;1703:		return;
ADDRGP4 $882
JUMPV
LABELV $891
line 1705
;1704:	}
;1705:	if ( ent->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $894
line 1706
;1706:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOVOTEASSPEC")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $777
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1707
;1707:		return;
ADDRGP4 $882
JUMPV
LABELV $894
line 1710
;1708:	}
;1709:
;1710:	trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "PLTEAMVOTECAST")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $896
ARGP4
ADDRLP4 72
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
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
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1712
;1711:
;1712:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 108
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1714
;1713:
;1714:	trap_Argv( 1, msg, sizeof( msg ) );
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1716
;1715:
;1716:	if ( msg[0] == 'y' || msg[1] == 'Y' || msg[1] == '1' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 121
EQI4 $902
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 89
EQI4 $902
ADDRLP4 0+1
INDIRI1
CVII4 1
CNSTI4 49
NEI4 $897
LABELV $902
line 1717
;1717:		level.teamVoteYes[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1718
;1718:		trap_SetConfigstring( CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset] ) );
ADDRGP4 $762
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4360
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1719
;1719:	} else {
ADDRGP4 $898
JUMPV
LABELV $897
line 1720
;1720:		level.teamVoteNo[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1721
;1721:		trap_SetConfigstring( CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset] ) );	
ADDRGP4 $762
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+4368
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1722
;1722:	}
LABELV $898
line 1726
;1723:
;1724:	// a majority will be determined in TeamCheckVote, which will also account
;1725:	// for players entering or leaving
;1726:}
LABELV $882
endproc Cmd_TeamVote_f 92 12
export Cmd_SetViewpos_f
proc Cmd_SetViewpos_f 1064 12
line 1734
;1727:
;1728:
;1729:/*
;1730:=================
;1731:Cmd_SetViewpos_f
;1732:=================
;1733:*/
;1734:void Cmd_SetViewpos_f( gentity_t *ent ) {
line 1739
;1735:	vec3_t		origin, angles;
;1736:	char		buffer[MAX_TOKEN_CHARS];
;1737:	int			i;
;1738:
;1739:	if ( !g_cheats.integer ) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $908
line 1740
;1740:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NOCHEATS")));
ADDRGP4 $116
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 1052
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRLP4 1056
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1741
;1741:		return;
ADDRGP4 $907
JUMPV
LABELV $908
line 1743
;1742:	}
;1743:	if ( trap_Argc() != 5 ) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $911
line 1744
;1744:		trap_SendServerCommand( ent-g_entities, va("print \"usage: setviewpos x y z yaw\n\""));
ADDRGP4 $913
ARGP4
ADDRLP4 1056
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
ADDRLP4 1056
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1745
;1745:		return;
ADDRGP4 $907
JUMPV
LABELV $911
line 1748
;1746:	}
;1747:
;1748:	VectorClear( angles );
ADDRLP4 1056
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 1056
INDIRF4
ASGNF4
line 1749
;1749:	for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $916
line 1750
;1750:		trap_Argv( i + 1, buffer, sizeof( buffer ) );
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1751
;1751:		origin[i] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1060
INDIRF4
ASGNF4
line 1752
;1752:	}
LABELV $917
line 1749
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $916
line 1754
;1753:
;1754:	trap_Argv( 4, buffer, sizeof( buffer ) );
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1755
;1755:	angles[YAW] = atof( buffer );
ADDRLP4 4
ARGP4
ADDRLP4 1060
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1060
INDIRF4
ASGNF4
line 1757
;1756:
;1757:	TeleportPlayer( ent, origin, angles );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1758
;1758:}
LABELV $907
endproc Cmd_SetViewpos_f 1064 12
export Cmd_Stats_f
proc Cmd_Stats_f 0 0
line 1767
;1759:
;1760:
;1761:
;1762:/*
;1763:=================
;1764:Cmd_Stats_f
;1765:=================
;1766:*/
;1767:void Cmd_Stats_f( gentity_t *ent ) {
line 1782
;1768:/*
;1769:	int max, n, i;
;1770:
;1771:	max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1772:
;1773:	n = 0;
;1774:	for ( i = 0; i < max; i++ ) {
;1775:		if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1776:			n++;
;1777:	}
;1778:
;1779:	//trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1780:	trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1781:*/
;1782:}
LABELV $921
endproc Cmd_Stats_f 0 0
export G_ItemUsable
proc G_ItemUsable 1228 28
line 1785
;1783:
;1784:int G_ItemUsable(playerState_t *ps, int forcedUse)
;1785:{
line 1792
;1786:	vec3_t fwd, fwdorg, dest, pos;
;1787:	vec3_t yawonly;
;1788:	vec3_t mins, maxs;
;1789:	vec3_t trtest;
;1790:	trace_t tr;
;1791:
;1792:	if (ps->usingATST)
ADDRFP4 0
INDIRP4
CNSTI4 1304
ADDP4
INDIRI4
CNSTI4 0
EQI4 $923
line 1793
;1793:	{
line 1794
;1794:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $923
line 1797
;1795:	}
;1796:	
;1797:	if (ps->pm_flags & PMF_USE_ITEM_HELD)
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $925
line 1798
;1798:	{ //force to let go first
line 1799
;1799:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $925
line 1802
;1800:	}
;1801:
;1802:	if (!forcedUse)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $927
line 1803
;1803:	{
line 1804
;1804:		forcedUse = bg_itemlist[ps->stats[STAT_HOLDABLE_ITEM]].giTag;
ADDRFP4 4
CNSTI4 52
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
INDIRI4
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 1805
;1805:	}
LABELV $927
line 1807
;1806:
;1807:	switch (forcedUse)
ADDRLP4 1176
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1176
INDIRI4
CNSTI4 1
LTI4 $930
ADDRLP4 1176
INDIRI4
CNSTI4 6
GTI4 $930
ADDRLP4 1176
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $989-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $989
address $937
address $967
address $932
address $930
address $930
address $940
code
line 1808
;1808:	{
LABELV $932
line 1810
;1809:	case HI_MEDPAC:
;1810:		if (ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH])
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1180
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LTI4 $933
line 1811
;1811:		{
line 1812
;1812:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $933
line 1815
;1813:		}
;1814:
;1815:		if (ps->stats[STAT_HEALTH] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $935
line 1816
;1816:		{
line 1817
;1817:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $935
line 1820
;1818:		}
;1819:
;1820:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $922
JUMPV
LABELV $937
line 1822
;1821:	case HI_SEEKER:
;1822:		if (ps->eFlags & EF_SEEKERDRONE)
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $938
line 1823
;1823:		{
line 1824
;1824:			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SEEKER_ALREADYDEPLOYED);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1825
;1825:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $938
line 1828
;1826:		}
;1827:
;1828:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $922
JUMPV
LABELV $940
line 1830
;1829:	case HI_SENTRY_GUN:
;1830:		if (ps->fd.sentryDeployed)
ADDRFP4 0
INDIRP4
CNSTI4 1212
ADDP4
INDIRI4
CNSTI4 0
EQI4 $941
line 1831
;1831:		{
line 1832
;1832:			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SENTRY_ALREADYPLACED);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1833
;1833:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $941
line 1836
;1834:		}
;1835:
;1836:		yawonly[ROLL] = 0;
ADDRLP4 1140+8
CNSTF4 0
ASGNF4
line 1837
;1837:		yawonly[PITCH] = 0;
ADDRLP4 1140
CNSTF4 0
ASGNF4
line 1838
;1838:		yawonly[YAW] = ps->viewangles[YAW];
ADDRLP4 1140+4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
line 1840
;1839:
;1840:		VectorSet( mins, -8, -8, 0 );
ADDRLP4 1184
CNSTF4 3238002688
ASGNF4
ADDRLP4 1092
ADDRLP4 1184
INDIRF4
ASGNF4
ADDRLP4 1092+4
ADDRLP4 1184
INDIRF4
ASGNF4
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 1841
;1841:		VectorSet( maxs, 8, 8, 24 );
ADDRLP4 1188
CNSTF4 1090519040
ASGNF4
ADDRLP4 1104
ADDRLP4 1188
INDIRF4
ASGNF4
ADDRLP4 1104+4
ADDRLP4 1188
INDIRF4
ASGNF4
ADDRLP4 1104+8
CNSTF4 1103101952
ASGNF4
line 1843
;1842:
;1843:		AngleVectors(yawonly, fwd, NULL, NULL);
ADDRLP4 1140
ARGP4
ADDRLP4 0
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
line 1845
;1844:
;1845:		fwdorg[0] = ps->origin[0] + fwd[0]*64;
ADDRLP4 1116
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1846
;1846:		fwdorg[1] = ps->origin[1] + fwd[1]*64;
ADDRLP4 1116+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1847
;1847:		fwdorg[2] = ps->origin[2] + fwd[2]*64;
ADDRLP4 1116+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1849
;1848:
;1849:		trtest[0] = fwdorg[0] + fwd[0]*16;
ADDRLP4 1152
ADDRLP4 1116
INDIRF4
CNSTF4 1098907648
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1850
;1850:		trtest[1] = fwdorg[1] + fwd[1]*16;
ADDRLP4 1152+4
ADDRLP4 1116+4
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1851
;1851:		trtest[2] = fwdorg[2] + fwd[2]*16;
ADDRLP4 1152+8
ADDRLP4 1116+8
INDIRF4
CNSTF4 1098907648
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1853
;1852:
;1853:		trap_Trace(&tr, ps->origin, mins, maxs, trtest, ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1152
ARGP4
ADDRLP4 1196
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1855
;1854:
;1855:		if ((tr.fraction != 1 && tr.entityNum != ps->clientNum) || tr.startsolid || tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $965
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $966
LABELV $965
ADDRLP4 1200
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1200
INDIRI4
NEI4 $966
ADDRLP4 12
INDIRI4
ADDRLP4 1200
INDIRI4
EQI4 $959
LABELV $966
line 1856
;1856:		{
line 1857
;1857:			G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SENTRY_NOROOM);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1858
;1858:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $959
line 1861
;1859:		}
;1860:
;1861:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $922
JUMPV
LABELV $967
line 1863
;1862:	case HI_SHIELD:
;1863:		mins[0] = -8;
ADDRLP4 1092
CNSTF4 3238002688
ASGNF4
line 1864
;1864:		mins[1] = -8;
ADDRLP4 1092+4
CNSTF4 3238002688
ASGNF4
line 1865
;1865:		mins[2] = 0;
ADDRLP4 1092+8
CNSTF4 0
ASGNF4
line 1867
;1866:
;1867:		maxs[0] = 8;
ADDRLP4 1104
CNSTF4 1090519040
ASGNF4
line 1868
;1868:		maxs[1] = 8;
ADDRLP4 1104+4
CNSTF4 1090519040
ASGNF4
line 1869
;1869:		maxs[2] = 8;
ADDRLP4 1104+8
CNSTF4 1090519040
ASGNF4
line 1871
;1870:
;1871:		AngleVectors (ps->viewangles, fwd, NULL, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1204
CNSTP4 0
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1872
;1872:		fwd[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1873
;1873:		VectorMA(ps->origin, 64, fwd, dest);
ADDRLP4 1208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
CNSTF4 1115684864
ASGNF4
ADDRLP4 1128
ADDRLP4 1208
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 1212
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1208
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 1212
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 1128+8
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1115684864
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1874
;1874:		trap_Trace(&tr, ps->origin, mins, maxs, dest, ps->clientNum, MASK_SHOT );
ADDRLP4 12
ARGP4
ADDRLP4 1216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1216
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1216
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 769
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1875
;1875:		if (tr.fraction > 0.9 && !tr.startsolid && !tr.allsolid)
ADDRLP4 12+8
INDIRF4
CNSTF4 1063675494
LEF4 $977
ADDRLP4 1220
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1220
INDIRI4
NEI4 $977
ADDRLP4 12
INDIRI4
ADDRLP4 1220
INDIRI4
NEI4 $977
line 1876
;1876:		{
line 1877
;1877:			VectorCopy(tr.endpos, pos);
ADDRLP4 1164
ADDRLP4 12+12
INDIRB
ASGNB 12
line 1878
;1878:			VectorSet( dest, pos[0], pos[1], pos[2] - 4096 );
ADDRLP4 1128
ADDRLP4 1164
INDIRF4
ASGNF4
ADDRLP4 1128+4
ADDRLP4 1164+4
INDIRF4
ASGNF4
ADDRLP4 1128+8
ADDRLP4 1164+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1879
;1879:			trap_Trace( &tr, pos, mins, maxs, dest, ps->clientNum, MASK_SOLID );
ADDRLP4 12
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1104
ARGP4
ADDRLP4 1128
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1880
;1880:			if ( !tr.startsolid && !tr.allsolid )
ADDRLP4 1224
CNSTI4 0
ASGNI4
ADDRLP4 12+4
INDIRI4
ADDRLP4 1224
INDIRI4
NEI4 $986
ADDRLP4 12
INDIRI4
ADDRLP4 1224
INDIRI4
NEI4 $986
line 1881
;1881:			{
line 1882
;1882:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $922
JUMPV
LABELV $986
line 1884
;1883:			}
;1884:		}
LABELV $977
line 1885
;1885:		G_AddEvent(&g_entities[ps->clientNum], EV_ITEMUSEFAIL, SHIELD_NOROOM);
CNSTI4 828
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 56
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 1886
;1886:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $922
JUMPV
LABELV $930
line 1888
;1887:	default:
;1888:		return 1;
CNSTI4 1
RETI4
LABELV $922
endproc G_ItemUsable 1228 28
export Cmd_ToggleSaber_f
proc Cmd_ToggleSaber_f 12 12
line 1896
;1889:	}
;1890:}
;1891:
;1892:extern int saberOffSound;
;1893:extern int saberOnSound;
;1894:
;1895:void Cmd_ToggleSaber_f(gentity_t *ent)
;1896:{
line 1897
;1897:	if (!saberOffSound || !saberOnSound)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 saberOffSound
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $994
ADDRGP4 saberOnSound
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $992
LABELV $994
line 1898
;1898:	{
line 1899
;1899:		saberOffSound = G_SoundIndex("sound/weapons/saber/saberoffquick.wav");
ADDRGP4 $995
ARGP4
ADDRLP4 4
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOffSound
ADDRLP4 4
INDIRI4
ASGNI4
line 1900
;1900:		saberOnSound = G_SoundIndex("sound/weapons/saber/saberon.wav");
ADDRGP4 $996
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 saberOnSound
ADDRLP4 8
INDIRI4
ASGNI4
line 1901
;1901:	}
LABELV $992
line 1903
;1902:
;1903:	if (ent->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $997
line 1904
;1904:	{
line 1905
;1905:		return;
ADDRGP4 $991
JUMPV
LABELV $997
line 1908
;1906:	}
;1907:
;1908:	if (ent->client->ps.forceHandExtend != HANDEXTEND_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
INDIRI4
CNSTI4 0
EQI4 $999
line 1909
;1909:	{
line 1910
;1910:		return;
ADDRGP4 $991
JUMPV
LABELV $999
line 1913
;1911:	}
;1912:
;1913:	if (ent->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1001
line 1914
;1914:	{
line 1915
;1915:		return;
ADDRGP4 $991
JUMPV
LABELV $1001
line 1923
;1916:	}
;1917:
;1918://	if (ent->client->ps.duelInProgress && !ent->client->ps.saberHolstered)
;1919://	{
;1920://		return;
;1921://	}
;1922:
;1923:	if (ent->client->ps.duelTime >= level.time)
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
LTI4 $1003
line 1924
;1924:	{
line 1925
;1925:		return;
ADDRGP4 $991
JUMPV
LABELV $1003
line 1928
;1926:	}
;1927:
;1928:	if (ent->client && ent->client->ps.weaponTime < 1)
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1006
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $1006
line 1929
;1929:	{
line 1930
;1930:		if (ent->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1008
line 1931
;1931:		{
line 1932
;1932:			ent->client->ps.saberHolstered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 0
ASGNI4
line 1933
;1933:			G_Sound(ent, CHAN_AUTO, saberOnSound);
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
line 1934
;1934:		}
ADDRGP4 $1009
JUMPV
LABELV $1008
line 1936
;1935:		else
;1936:		{
line 1937
;1937:			ent->client->ps.saberHolstered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 1
ASGNI4
line 1938
;1938:			G_Sound(ent, CHAN_AUTO, saberOffSound);
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
line 1941
;1939:
;1940:			//prevent anything from being done for 400ms after holster
;1941:			ent->client->ps.weaponTime = 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 1942
;1942:		}
LABELV $1009
line 1943
;1943:	}
LABELV $1006
line 1944
;1944:}
LABELV $991
endproc Cmd_ToggleSaber_f 12 12
export Cmd_SaberAttackCycle_f
proc Cmd_SaberAttackCycle_f 12 0
line 1947
;1945:
;1946:void Cmd_SaberAttackCycle_f(gentity_t *ent)
;1947:{
line 1948
;1948:	int selectLevel = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1950
;1949:
;1950:	if ( !ent || !ent->client )
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $1013
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $1011
LABELV $1013
line 1951
;1951:	{
line 1952
;1952:		return;
ADDRGP4 $1010
JUMPV
LABELV $1011
line 1961
;1953:	}
;1954:	/*
;1955:	if (ent->client->ps.weaponTime > 0)
;1956:	{ //no switching attack level when busy
;1957:		return;
;1958:	}
;1959:	*/
;1960:
;1961:	if (ent->client->saberCycleQueue)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1014
line 1962
;1962:	{ //resume off of the queue if we haven't gotten a chance to update it yet
line 1963
;1963:		selectLevel = ent->client->saberCycleQueue;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
INDIRI4
ASGNI4
line 1964
;1964:	}
ADDRGP4 $1015
JUMPV
LABELV $1014
line 1966
;1965:	else
;1966:	{
line 1967
;1967:		selectLevel = ent->client->ps.fd.saberAnimLevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
INDIRI4
ASGNI4
line 1968
;1968:	}
LABELV $1015
line 1970
;1969:
;1970:	selectLevel++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1971
;1971:	if ( selectLevel > ent->client->ps.fd.forcePowerLevel[FP_SABERATTACK] )
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 992
ADDP4
INDIRI4
LEI4 $1016
line 1972
;1972:	{
line 1973
;1973:		selectLevel = FORCE_LEVEL_1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1974
;1974:	}
LABELV $1016
line 1991
;1975:/*
;1976:#ifndef FINAL_BUILD
;1977:	switch ( selectLevel )
;1978:	{
;1979:	case FORCE_LEVEL_1:
;1980:		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %sfast\n\"", S_COLOR_BLUE) );
;1981:		break;
;1982:	case FORCE_LEVEL_2:
;1983:		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %smedium\n\"", S_COLOR_YELLOW) );
;1984:		break;
;1985:	case FORCE_LEVEL_3:
;1986:		trap_SendServerCommand( ent-g_entities, va("print \"Lightsaber Combat Style: %sstrong\n\"", S_COLOR_RED) );
;1987:		break;
;1988:	}
;1989:#endif
;1990:*/
;1991:	if (ent->client->ps.weaponTime <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $1018
line 1992
;1992:	{ //not busy, set it now
line 1993
;1993:		ent->client->ps.fd.saberAnimLevel = selectLevel;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1216
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1994
;1994:	}
ADDRGP4 $1019
JUMPV
LABELV $1018
line 1996
;1995:	else
;1996:	{ //can't set it now or we might cause unexpected chaining, so queue it
line 1997
;1997:		ent->client->saberCycleQueue = selectLevel;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1568
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1998
;1998:	}
LABELV $1019
line 1999
;1999:}
LABELV $1010
endproc Cmd_SaberAttackCycle_f 12 0
export G_OtherPlayersDueling
proc G_OtherPlayersDueling 24 0
line 2002
;2000:
;2001:qboolean G_OtherPlayersDueling(void)
;2002:{
line 2003
;2003:	int i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1022
JUMPV
LABELV $1021
line 2007
;2004:	gentity_t *ent;
;2005:
;2006:	while (i < MAX_CLIENTS)
;2007:	{
line 2008
;2008:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 828
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2010
;2009:
;2010:		if (ent && ent->inuse && ent->client && ent->client->ps.duelInProgress)
ADDRLP4 12
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1024
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1024
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $1024
ADDRLP4 20
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $1024
line 2011
;2011:		{
line 2012
;2012:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1020
JUMPV
LABELV $1024
line 2014
;2013:		}
;2014:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2015
;2015:	}
LABELV $1022
line 2006
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $1021
line 2017
;2016:
;2017:	return qfalse;
CNSTI4 0
RETI4
LABELV $1020
endproc G_OtherPlayersDueling 24 0
export Cmd_EngageDuel_f
proc Cmd_EngageDuel_f 1172 28
line 2021
;2018:}
;2019:
;2020:void Cmd_EngageDuel_f(gentity_t *ent)
;2021:{
line 2025
;2022:	trace_t tr;
;2023:	vec3_t forward, fwdOrg;
;2024:
;2025:	if (!g_privateDuel.integer)
ADDRGP4 g_privateDuel+12
INDIRI4
CNSTI4 0
NEI4 $1027
line 2026
;2026:	{
line 2027
;2027:		return;
ADDRGP4 $1026
JUMPV
LABELV $1027
line 2030
;2028:	}
;2029:
;2030:	if (g_gametype.integer == GT_TOURNAMENT)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $1030
line 2031
;2031:	{ //rather pointless in this mode..
line 2032
;2032:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NODUEL_GAMETYPE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1033
ARGP4
ADDRLP4 1104
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
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
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2033
;2033:		return;
ADDRGP4 $1026
JUMPV
LABELV $1030
line 2036
;2034:	}
;2035:
;2036:	if (g_gametype.integer >= GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1034
line 2037
;2037:	{ //no private dueling in team modes
line 2038
;2038:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "NODUEL_GAMETYPE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1033
ARGP4
ADDRLP4 1104
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
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
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2039
;2039:		return;
ADDRGP4 $1026
JUMPV
LABELV $1034
line 2042
;2040:	}
;2041:
;2042:	if (ent->client->ps.duelTime >= level.time)
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
LTI4 $1037
line 2043
;2043:	{
line 2044
;2044:		return;
ADDRGP4 $1026
JUMPV
LABELV $1037
line 2047
;2045:	}
;2046:
;2047:	if (ent->client->ps.weapon != WP_SABER)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1040
line 2048
;2048:	{
line 2049
;2049:		return;
ADDRGP4 $1026
JUMPV
LABELV $1040
line 2060
;2050:	}
;2051:
;2052:	/*
;2053:	if (!ent->client->ps.saberHolstered)
;2054:	{ //must have saber holstered at the start of the duel
;2055:		return;
;2056:	}
;2057:	*/
;2058:	//NOTE: No longer doing this..
;2059:
;2060:	if (ent->client->ps.saberInFlight)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1042
line 2061
;2061:	{
line 2062
;2062:		return;
ADDRGP4 $1026
JUMPV
LABELV $1042
line 2065
;2063:	}
;2064:
;2065:	if (ent->client->ps.duelInProgress)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1044
line 2066
;2066:	{
line 2067
;2067:		return;
ADDRGP4 $1026
JUMPV
LABELV $1044
line 2071
;2068:	}
;2069:
;2070:	//New: Don't let a player duel if he just did and hasn't waited 10 seconds yet (note: If someone challenges him, his duel timer will reset so he can accept)
;2071:	if (ent->client->ps.fd.privateDuelTime > level.time)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1046
line 2072
;2072:	{
line 2073
;2073:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "CANTDUEL_JUSTDID")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1049
ARGP4
ADDRLP4 1104
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1104
INDIRP4
ARGP4
ADDRLP4 1108
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
ADDRLP4 1108
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2074
;2074:		return;
ADDRGP4 $1026
JUMPV
LABELV $1046
line 2077
;2075:	}
;2076:
;2077:	if (G_OtherPlayersDueling())
ADDRLP4 1104
ADDRGP4 G_OtherPlayersDueling
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $1050
line 2078
;2078:	{
line 2079
;2079:		trap_SendServerCommand( ent-g_entities, va("print \"%s\n\"", G_GetStripEdString("SVINGAME", "CANTDUEL_BUSY")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1052
ARGP4
ADDRLP4 1108
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $115
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
ADDRLP4 1112
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
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2080
;2080:		return;
ADDRGP4 $1026
JUMPV
LABELV $1050
line 2083
;2081:	}
;2082:
;2083:	AngleVectors( ent->client->ps.viewangles, forward, NULL, NULL );
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 156
ADDP4
ARGP4
ADDRLP4 0
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
ADDRGP4 AngleVectors
CALLV
pop
line 2085
;2084:
;2085:	fwdOrg[0] = ent->client->ps.origin[0] + forward[0]*256;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1132462080
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 2086
;2086:	fwdOrg[1] = ent->client->ps.origin[1] + forward[1]*256;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1132462080
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2087
;2087:	fwdOrg[2] = (ent->client->ps.origin[2]+ent->client->ps.viewheight) + forward[2]*256;
ADDRLP4 1112
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 1112
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 1112
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
ADDF4
CNSTF4 1132462080
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2089
;2088:
;2089:	trap_Trace(&tr, ent->client->ps.origin, NULL, NULL, fwdOrg, ent->s.number, MASK_PLAYERSOLID);
ADDRLP4 24
ARGP4
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1120
CNSTP4 0
ASGNP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 1116
INDIRP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 2091
;2090:
;2091:	if (tr.fraction != 1 && tr.entityNum < MAX_CLIENTS)
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
EQF4 $1057
ADDRLP4 24+52
INDIRI4
CNSTI4 32
GEI4 $1057
line 2092
;2092:	{
line 2093
;2093:		gentity_t *challenged = &g_entities[tr.entityNum];
ADDRLP4 1124
CNSTI4 828
ADDRLP4 24+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2095
;2094:
;2095:		if (!challenged || !challenged->client || !challenged->inuse ||
ADDRLP4 1132
CNSTU4 0
ASGNU4
ADDRLP4 1124
INDIRP4
CVPU4 4
ADDRLP4 1132
INDIRU4
EQU4 $1070
ADDRLP4 1136
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CVPU4 4
ADDRLP4 1132
INDIRU4
EQU4 $1070
ADDRLP4 1140
CNSTI4 0
ASGNI4
ADDRLP4 1124
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $1070
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRLP4 1124
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 1144
INDIRI4
LTI4 $1070
ADDRLP4 1136
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ADDRLP4 1144
INDIRI4
LTI4 $1070
ADDRLP4 1136
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1070
ADDRLP4 1136
INDIRP4
CNSTI4 1292
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
NEI4 $1070
ADDRLP4 1136
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ADDRLP4 1140
INDIRI4
EQI4 $1062
LABELV $1070
line 2099
;2096:			challenged->health < 1 || challenged->client->ps.stats[STAT_HEALTH] < 1 ||
;2097:			challenged->client->ps.weapon != WP_SABER || challenged->client->ps.duelInProgress ||
;2098:			challenged->client->ps.saberInFlight)
;2099:		{
line 2100
;2100:			return;
ADDRGP4 $1026
JUMPV
LABELV $1062
line 2103
;2101:		}
;2102:
;2103:		if (g_gametype.integer >= GT_TEAM && OnSameTeam(ent, challenged))
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $1071
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
ARGP4
ADDRLP4 1148
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
EQI4 $1071
line 2104
;2104:		{
line 2105
;2105:			return;
ADDRGP4 $1026
JUMPV
LABELV $1071
line 2108
;2106:		}
;2107:
;2108:		if (challenged->client->ps.duelIndex == ent->s.number && challenged->client->ps.duelTime >= level.time)
ADDRLP4 1152
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1152
INDIRP4
CNSTI4 1284
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $1074
ADDRLP4 1152
INDIRP4
CNSTI4 1288
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $1074
line 2109
;2109:		{
line 2110
;2110:			trap_SendServerCommand( /*challenged-g_entities*/-1, va("print \"%s %s %s!\n\"", challenged->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELACCEPT"), ent->client->pers.netname) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1078
ARGP4
ADDRLP4 1156
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1077
ARGP4
ADDRLP4 1160
CNSTI4 408
ASGNI4
ADDRLP4 1164
CNSTI4 1416
ASGNI4
ADDRLP4 1124
INDIRP4
ADDRLP4 1160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1164
INDIRI4
ADDP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 1160
INDIRI4
ADDP4
INDIRP4
ADDRLP4 1164
INDIRI4
ADDP4
ARGP4
ADDRLP4 1168
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2112
;2111:
;2112:			ent->client->ps.duelInProgress = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 1
ASGNI4
line 2113
;2113:			challenged->client->ps.duelInProgress = qtrue;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1292
ADDP4
CNSTI4 1
ASGNI4
line 2115
;2114:
;2115:			ent->client->ps.duelTime = level.time + 2000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2116
;2116:			challenged->client->ps.duelTime = level.time + 2000;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 2118
;2117:
;2118:			G_AddEvent(ent, EV_PRIVATE_DUEL, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2119
;2119:			G_AddEvent(challenged, EV_PRIVATE_DUEL, 1);
ADDRLP4 1124
INDIRP4
ARGP4
CNSTI4 13
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 2123
;2120:
;2121:			//Holster their sabers now, until the duel starts (then they'll get auto-turned on to look cool)
;2122:
;2123:			if (!ent->client->ps.saberHolstered)
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1081
line 2124
;2124:			{
line 2125
;2125:				G_Sound(ent, CHAN_AUTO, saberOffSound);
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
line 2126
;2126:				ent->client->ps.weaponTime = 400;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 2127
;2127:				ent->client->ps.saberHolstered = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 1
ASGNI4
line 2128
;2128:			}
LABELV $1081
line 2129
;2129:			if (!challenged->client->ps.saberHolstered)
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1075
line 2130
;2130:			{
line 2131
;2131:				G_Sound(challenged, CHAN_AUTO, saberOffSound);
ADDRLP4 1124
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
line 2132
;2132:				challenged->client->ps.weaponTime = 400;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 400
ASGNI4
line 2133
;2133:				challenged->client->ps.saberHolstered = qtrue;
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
CNSTI4 1
ASGNI4
line 2134
;2134:			}
line 2135
;2135:		}
ADDRGP4 $1075
JUMPV
LABELV $1074
line 2137
;2136:		else
;2137:		{
line 2139
;2138:			//Print the message that a player has been challenged in private, only announce the actual duel initiation in private
;2139:			trap_SendServerCommand( challenged-g_entities, va("cp \"%s %s\n\"", ent->client->pers.netname, G_GetStripEdString("SVINGAME", "PLDUELCHALLENGE")) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1086
ARGP4
ADDRLP4 1156
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1085
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 1156
INDIRP4
ARGP4
ADDRLP4 1160
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1124
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 828
DIVI4
ARGI4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2140
;2140:			trap_SendServerCommand( ent-g_entities, va("cp \"%s %s\n\"", G_GetStripEdString("SVINGAME", "PLDUELCHALLENGED"), challenged->client->pers.netname) );
ADDRGP4 $116
ARGP4
ADDRGP4 $1087
ARGP4
ADDRLP4 1164
ADDRGP4 G_GetStripEdString
CALLP4
ASGNP4
ADDRGP4 $1085
ARGP4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ARGP4
ADDRLP4 1168
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
ADDRLP4 1168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2141
;2141:		}
LABELV $1075
line 2143
;2142:
;2143:		challenged->client->ps.fd.privateDuelTime = 0; //reset the timer in case this player just got out of a duel. He should still be able to accept the challenge.
ADDRLP4 1124
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1228
ADDP4
CNSTI4 0
ASGNI4
line 2145
;2144:
;2145:		ent->client->ps.forceHandExtend = HANDEXTEND_DUELCHALLENGE;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1236
ADDP4
CNSTI4 9
ASGNI4
line 2146
;2146:		ent->client->ps.forceHandExtendTime = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1240
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 2148
;2147:
;2148:		ent->client->ps.duelIndex = challenged->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1284
ADDP4
ADDRLP4 1124
INDIRP4
INDIRI4
ASGNI4
line 2149
;2149:		ent->client->ps.duelTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1288
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 2150
;2150:	}
LABELV $1057
line 2151
;2151:}
LABELV $1026
endproc Cmd_EngageDuel_f 1172 28
export ClientCommand
proc ClientCommand 1200 20
line 2158
;2152:
;2153:/*
;2154:=================
;2155:ClientCommand
;2156:=================
;2157:*/
;2158:void ClientCommand( int clientNum ) {
line 2162
;2159:	gentity_t *ent;
;2160:	char	cmd[MAX_TOKEN_CHARS];
;2161:
;2162:	ent = g_entities + clientNum;
ADDRLP4 1024
CNSTI4 828
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 2163
;2163:	if ( !ent->client ) {
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1091
line 2164
;2164:		return;		// not fully in game yet
ADDRGP4 $1090
JUMPV
LABELV $1091
line 2168
;2165:	}
;2166:
;2167:
;2168:	trap_Argv( 0, cmd, sizeof( cmd ) );
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 2171
;2169:
;2170:	//rww - redirect bot commands
;2171:	if (strstr(cmd, "bot_") && AcceptBotCommand(cmd, ent))
ADDRLP4 0
ARGP4
ADDRGP4 $1095
ARGP4
ADDRLP4 1028
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1093
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 AcceptBotCommand
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $1093
line 2172
;2172:	{
line 2173
;2173:		return;
ADDRGP4 $1090
JUMPV
LABELV $1093
line 2177
;2174:	}
;2175:	//end rww
;2176:
;2177:	if (Q_stricmp (cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1098
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $1096
line 2178
;2178:		Cmd_Say_f (ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1040
CNSTI4 0
ASGNI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2179
;2179:		return;
ADDRGP4 $1090
JUMPV
LABELV $1096
line 2181
;2180:	}
;2181:	if (Q_stricmp (cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1101
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $1099
line 2182
;2182:		Cmd_Say_f (ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2183
;2183:		return;
ADDRGP4 $1090
JUMPV
LABELV $1099
line 2185
;2184:	}
;2185:	if (Q_stricmp (cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1104
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $1102
line 2186
;2186:		Cmd_Tell_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 2187
;2187:		return;
ADDRGP4 $1090
JUMPV
LABELV $1102
line 2189
;2188:	}
;2189:	if (Q_stricmp (cmd, "vsay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1107
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $1105
line 2190
;2190:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1052
CNSTI4 0
ASGNI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRLP4 1052
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2191
;2191:		return;
ADDRGP4 $1090
JUMPV
LABELV $1105
line 2193
;2192:	}
;2193:	if (Q_stricmp (cmd, "vsay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1110
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $1108
line 2194
;2194:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1056
CNSTI4 0
ASGNI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRLP4 1056
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2195
;2195:		return;
ADDRGP4 $1090
JUMPV
LABELV $1108
line 2197
;2196:	}
;2197:	if (Q_stricmp (cmd, "vtell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $545
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $1111
line 2198
;2198:		Cmd_VoiceTell_f ( ent, qfalse );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2199
;2199:		return;
ADDRGP4 $1090
JUMPV
LABELV $1111
line 2201
;2200:	}
;2201:	if (Q_stricmp (cmd, "vosay") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1115
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1113
line 2202
;2202:		Cmd_Voice_f (ent, SAY_ALL, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1064
CNSTI4 0
ASGNI4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRLP4 1064
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2203
;2203:		return;
ADDRGP4 $1090
JUMPV
LABELV $1113
line 2205
;2204:	}
;2205:	if (Q_stricmp (cmd, "vosay_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1118
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $1116
line 2206
;2206:		Cmd_Voice_f (ent, SAY_TEAM, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRLP4 1068
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 Cmd_Voice_f
CALLV
pop
line 2207
;2207:		return;
ADDRGP4 $1090
JUMPV
LABELV $1116
line 2209
;2208:	}
;2209:	if (Q_stricmp (cmd, "votell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1121
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $1119
line 2210
;2210:		Cmd_VoiceTell_f ( ent, qtrue );
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_VoiceTell_f
CALLV
pop
line 2211
;2211:		return;
ADDRGP4 $1090
JUMPV
LABELV $1119
line 2213
;2212:	}
;2213:	if (Q_stricmp (cmd, "vtaunt") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $1124
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $1122
line 2214
;2214:		Cmd_VoiceTaunt_f ( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_VoiceTaunt_f
CALLV
pop
line 2215
;2215:		return;
ADDRGP4 $1090
JUMPV
LABELV $1122
line 2217
;2216:	}
;2217:	if (Q_stricmp (cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $310
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $1125
line 2218
;2218:		Cmd_Score_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 2219
;2219:		return;
ADDRGP4 $1090
JUMPV
LABELV $1125
line 2223
;2220:	}
;2221:
;2222:	// ignore all other commands when at intermission
;2223:	if (level.intermissiontime)
ADDRGP4 level+9008
INDIRI4
CNSTI4 0
EQI4 $1127
line 2224
;2224:	{
line 2225
;2225:		qboolean giveError = qfalse;
ADDRLP4 1080
CNSTI4 0
ASGNI4
line 2227
;2226:
;2227:		if (!Q_stricmp(cmd, "give"))
ADDRLP4 0
ARGP4
ADDRGP4 $1132
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1130
line 2228
;2228:		{
line 2229
;2229:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2230
;2230:		}
ADDRGP4 $1131
JUMPV
LABELV $1130
line 2231
;2231:		else if (!Q_stricmp(cmd, "god"))
ADDRLP4 0
ARGP4
ADDRGP4 $1135
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1133
line 2232
;2232:		{
line 2233
;2233:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2234
;2234:		}
ADDRGP4 $1134
JUMPV
LABELV $1133
line 2235
;2235:		else if (!Q_stricmp(cmd, "notarget"))
ADDRLP4 0
ARGP4
ADDRGP4 $1138
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1136
line 2236
;2236:		{
line 2237
;2237:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2238
;2238:		}
ADDRGP4 $1137
JUMPV
LABELV $1136
line 2239
;2239:		else if (!Q_stricmp(cmd, "noclip"))
ADDRLP4 0
ARGP4
ADDRGP4 $1141
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1139
line 2240
;2240:		{
line 2241
;2241:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2242
;2242:		}
ADDRGP4 $1140
JUMPV
LABELV $1139
line 2243
;2243:		else if (!Q_stricmp(cmd, "kill"))
ADDRLP4 0
ARGP4
ADDRGP4 $1144
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1142
line 2244
;2244:		{
line 2245
;2245:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2246
;2246:		}
ADDRGP4 $1143
JUMPV
LABELV $1142
line 2247
;2247:		else if (!Q_stricmp(cmd, "teamtask"))
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1145
line 2248
;2248:		{
line 2249
;2249:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2250
;2250:		}
ADDRGP4 $1146
JUMPV
LABELV $1145
line 2251
;2251:		else if (!Q_stricmp(cmd, "levelshot"))
ADDRLP4 0
ARGP4
ADDRGP4 $1149
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1147
line 2252
;2252:		{
line 2253
;2253:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2254
;2254:		}
ADDRGP4 $1148
JUMPV
LABELV $1147
line 2255
;2255:		else if (!Q_stricmp(cmd, "follow"))
ADDRLP4 0
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1150
line 2256
;2256:		{
line 2257
;2257:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2258
;2258:		}
ADDRGP4 $1151
JUMPV
LABELV $1150
line 2259
;2259:		else if (!Q_stricmp(cmd, "follownext"))
ADDRLP4 0
ARGP4
ADDRGP4 $1155
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1153
line 2260
;2260:		{
line 2261
;2261:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2262
;2262:		}
ADDRGP4 $1154
JUMPV
LABELV $1153
line 2263
;2263:		else if (!Q_stricmp(cmd, "followprev"))
ADDRLP4 0
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1156
line 2264
;2264:		{
line 2265
;2265:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2266
;2266:		}
ADDRGP4 $1157
JUMPV
LABELV $1156
line 2267
;2267:		else if (!Q_stricmp(cmd, "team"))
ADDRLP4 0
ARGP4
ADDRGP4 $1161
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1159
line 2268
;2268:		{
line 2269
;2269:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2270
;2270:		}
ADDRGP4 $1160
JUMPV
LABELV $1159
line 2271
;2271:		else if (!Q_stricmp(cmd, "forcechanged"))
ADDRLP4 0
ARGP4
ADDRGP4 $1164
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1162
line 2272
;2272:		{ //special case: still update force change
line 2273
;2273:			Cmd_ForceChanged_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ForceChanged_f
CALLV
pop
line 2274
;2274:			return;
ADDRGP4 $1090
JUMPV
LABELV $1162
line 2276
;2275:		}
;2276:		else if (!Q_stricmp(cmd, "where"))
ADDRLP4 0
ARGP4
ADDRGP4 $1167
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1165
line 2277
;2277:		{
line 2278
;2278:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2279
;2279:		}
ADDRGP4 $1166
JUMPV
LABELV $1165
line 2280
;2280:		else if (!Q_stricmp(cmd, "callvote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1170
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1168
line 2281
;2281:		{
line 2282
;2282:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2283
;2283:		}
ADDRGP4 $1169
JUMPV
LABELV $1168
line 2284
;2284:		else if (!Q_stricmp(cmd, "vote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1173
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1171
line 2285
;2285:		{
line 2286
;2286:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2287
;2287:		}
ADDRGP4 $1172
JUMPV
LABELV $1171
line 2288
;2288:		else if (!Q_stricmp(cmd, "callteamvote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1176
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1174
line 2289
;2289:		{
line 2290
;2290:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2291
;2291:		}
ADDRGP4 $1175
JUMPV
LABELV $1174
line 2292
;2292:		else if (!Q_stricmp(cmd, "teamvote"))
ADDRLP4 0
ARGP4
ADDRGP4 $1179
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1177
line 2293
;2293:		{
line 2294
;2294:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2295
;2295:		}
ADDRGP4 $1178
JUMPV
LABELV $1177
line 2296
;2296:		else if (!Q_stricmp(cmd, "gc"))
ADDRLP4 0
ARGP4
ADDRGP4 $1182
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1180
line 2297
;2297:		{
line 2298
;2298:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2299
;2299:		}
ADDRGP4 $1181
JUMPV
LABELV $1180
line 2300
;2300:		else if (!Q_stricmp(cmd, "setviewpos"))
ADDRLP4 0
ARGP4
ADDRGP4 $1185
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1183
line 2301
;2301:		{
line 2302
;2302:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2303
;2303:		}
ADDRGP4 $1184
JUMPV
LABELV $1183
line 2304
;2304:		else if (!Q_stricmp(cmd, "stats"))
ADDRLP4 0
ARGP4
ADDRGP4 $1188
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1186
line 2305
;2305:		{
line 2306
;2306:			giveError = qtrue;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 2307
;2307:		}
LABELV $1186
LABELV $1184
LABELV $1181
LABELV $1178
LABELV $1175
LABELV $1172
LABELV $1169
LABELV $1166
LABELV $1160
LABELV $1157
LABELV $1154
LABELV $1151
LABELV $1148
LABELV $1146
LABELV $1143
LABELV $1140
LABELV $1137
LABELV $1134
LABELV $1131
line 2309
;2308:
;2309:		if (giveError)
ADDRLP4 1080
INDIRI4
CNSTI4 0
EQI4 $1189
line 2310
;2310:		{
line 2311
;2311:			trap_SendServerCommand( clientNum, va("print \"You cannot perform this task (%s) during the intermission.\n\"", cmd ) );
ADDRGP4 $1191
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1164
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1164
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2312
;2312:		}
ADDRGP4 $1090
JUMPV
LABELV $1189
line 2314
;2313:		else
;2314:		{
line 2315
;2315:			Cmd_Say_f (ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 2316
;2316:		}
line 2317
;2317:		return;
ADDRGP4 $1090
JUMPV
LABELV $1127
line 2320
;2318:	}
;2319:
;2320:	if (Q_stricmp (cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1132
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $1192
line 2321
;2321:	{
line 2322
;2322:		Cmd_Give_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
line 2323
;2323:	}
ADDRGP4 $1193
JUMPV
LABELV $1192
line 2324
;2324:	else if (Q_stricmp (cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1135
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $1194
line 2325
;2325:		Cmd_God_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $1195
JUMPV
LABELV $1194
line 2326
;2326:	else if (Q_stricmp (cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1138
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $1196
line 2327
;2327:		Cmd_Notarget_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $1197
JUMPV
LABELV $1196
line 2328
;2328:	else if (Q_stricmp (cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1141
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $1198
line 2329
;2329:		Cmd_Noclip_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $1199
JUMPV
LABELV $1198
line 2330
;2330:	else if (Q_stricmp (cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1144
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $1200
line 2331
;2331:		Cmd_Kill_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $1201
JUMPV
LABELV $1200
line 2332
;2332:	else if (Q_stricmp (cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $1202
line 2333
;2333:		Cmd_TeamTask_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $1203
JUMPV
LABELV $1202
line 2334
;2334:	else if (Q_stricmp (cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1149
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $1204
line 2335
;2335:		Cmd_LevelShot_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $1205
JUMPV
LABELV $1204
line 2336
;2336:	else if (Q_stricmp (cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1152
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $1206
line 2337
;2337:		Cmd_Follow_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $1207
JUMPV
LABELV $1206
line 2338
;2338:	else if (Q_stricmp (cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1155
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $1208
line 2339
;2339:		Cmd_FollowCycle_f (ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1209
JUMPV
LABELV $1208
line 2340
;2340:	else if (Q_stricmp (cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1158
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $1210
line 2341
;2341:		Cmd_FollowCycle_f (ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $1211
JUMPV
LABELV $1210
line 2342
;2342:	else if (Q_stricmp (cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1161
ARGP4
ADDRLP4 1120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $1212
line 2343
;2343:		Cmd_Team_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $1213
JUMPV
LABELV $1212
line 2344
;2344:	else if (Q_stricmp (cmd, "forcechanged") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1164
ARGP4
ADDRLP4 1124
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1124
INDIRI4
CNSTI4 0
NEI4 $1214
line 2345
;2345:		Cmd_ForceChanged_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ForceChanged_f
CALLV
pop
ADDRGP4 $1215
JUMPV
LABELV $1214
line 2346
;2346:	else if (Q_stricmp (cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1167
ARGP4
ADDRLP4 1128
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1128
INDIRI4
CNSTI4 0
NEI4 $1216
line 2347
;2347:		Cmd_Where_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $1217
JUMPV
LABELV $1216
line 2348
;2348:	else if (Q_stricmp (cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1170
ARGP4
ADDRLP4 1132
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1132
INDIRI4
CNSTI4 0
NEI4 $1218
line 2349
;2349:		Cmd_CallVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $1219
JUMPV
LABELV $1218
line 2350
;2350:	else if (Q_stricmp (cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1173
ARGP4
ADDRLP4 1136
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1136
INDIRI4
CNSTI4 0
NEI4 $1220
line 2351
;2351:		Cmd_Vote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $1221
JUMPV
LABELV $1220
line 2352
;2352:	else if (Q_stricmp (cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1176
ARGP4
ADDRLP4 1140
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1140
INDIRI4
CNSTI4 0
NEI4 $1222
line 2353
;2353:		Cmd_CallTeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $1223
JUMPV
LABELV $1222
line 2354
;2354:	else if (Q_stricmp (cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1179
ARGP4
ADDRLP4 1144
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1144
INDIRI4
CNSTI4 0
NEI4 $1224
line 2355
;2355:		Cmd_TeamVote_f (ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $1225
JUMPV
LABELV $1224
line 2356
;2356:	else if (Q_stricmp (cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1182
ARGP4
ADDRLP4 1148
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1148
INDIRI4
CNSTI4 0
NEI4 $1226
line 2357
;2357:		Cmd_GameCommand_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $1227
JUMPV
LABELV $1226
line 2358
;2358:	else if (Q_stricmp (cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1185
ARGP4
ADDRLP4 1152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1152
INDIRI4
CNSTI4 0
NEI4 $1228
line 2359
;2359:		Cmd_SetViewpos_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $1229
JUMPV
LABELV $1228
line 2360
;2360:	else if (Q_stricmp (cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1188
ARGP4
ADDRLP4 1156
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1156
INDIRI4
CNSTI4 0
NEI4 $1230
line 2361
;2361:		Cmd_Stats_f( ent );
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $1231
JUMPV
LABELV $1230
line 2362
;2362:	else if (Q_stricmp(cmd, "#mm") == 0 && CheatsOk( ent ))
ADDRLP4 0
ARGP4
ADDRGP4 $1234
ARGP4
ADDRLP4 1160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1160
INDIRI4
CNSTI4 0
NEI4 $1232
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 1164
INDIRI4
CNSTI4 0
EQI4 $1232
line 2363
;2363:	{
line 2364
;2364:		G_PlayerBecomeATST(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 G_PlayerBecomeATST
CALLI4
pop
line 2365
;2365:	}
ADDRGP4 $1233
JUMPV
LABELV $1232
line 2366
;2366:	else if (Q_stricmp(cmd, "thedestroyer") == 0 && CheatsOk( ent ) && ent && ent->client && ent->client->ps.saberHolstered && ent->client->ps.weapon == WP_SABER)
ADDRLP4 0
ARGP4
ADDRGP4 $1237
ARGP4
ADDRLP4 1168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1168
INDIRI4
CNSTI4 0
NEI4 $1235
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 1176
CNSTI4 0
ASGNI4
ADDRLP4 1172
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1235
ADDRLP4 1184
CNSTU4 0
ASGNU4
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRLP4 1184
INDIRU4
EQU4 $1235
ADDRLP4 1188
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CVPU4 4
ADDRLP4 1184
INDIRU4
EQU4 $1235
ADDRLP4 1188
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 1176
INDIRI4
EQI4 $1235
ADDRLP4 1188
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1235
line 2367
;2367:	{
line 2368
;2368:		Cmd_ToggleSaber_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_ToggleSaber_f
CALLV
pop
line 2370
;2369:
;2370:		if (!ent->client->ps.saberHolstered)
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1236
line 2371
;2371:		{
line 2372
;2372:			if (ent->client->ps.dualBlade)
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1240
line 2373
;2373:			{
line 2374
;2374:				ent->client->ps.dualBlade = qfalse;
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 0
ASGNI4
line 2376
;2375:				//ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_1;
;2376:			}
ADDRGP4 $1236
JUMPV
LABELV $1240
line 2378
;2377:			else
;2378:			{
line 2379
;2379:				ent->client->ps.dualBlade = qtrue;
ADDRLP4 1024
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1352
ADDP4
CNSTI4 1
ASGNI4
line 2381
;2380:
;2381:				trap_SendServerCommand( -1, va("print \"%sTHE DESTROYER COMETH\n\"", S_COLOR_RED) );
ADDRGP4 $1242
ARGP4
ADDRGP4 $1243
ARGP4
ADDRLP4 1192
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2382
;2382:				G_ScreenShake(vec3_origin, NULL, 10.0f, 800, qtrue);
ADDRGP4 vec3_origin
ARGP4
CNSTP4 0
ARGP4
CNSTF4 1092616192
ARGF4
CNSTI4 800
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_ScreenShake
CALLP4
pop
line 2384
;2383:				//ent->client->ps.fd.saberAnimLevel = FORCE_LEVEL_3;
;2384:			}
line 2385
;2385:		}
line 2386
;2386:	}
ADDRGP4 $1236
JUMPV
LABELV $1235
line 2417
;2387:#ifdef _DEBUG
;2388:	else if (Q_stricmp(cmd, "gotocoord") == 0 && CheatsOk( ent ))
;2389:	{
;2390:		char		x[64], y[64], z[64];
;2391:		vec3_t		xyz;
;2392:
;2393:		if (trap_Argc() < 3)
;2394:		{
;2395:			return;
;2396:		}
;2397:
;2398:		trap_Argv( 1, x, sizeof( x ) );
;2399:		trap_Argv( 2, y, sizeof( y ) );
;2400:		trap_Argv( 3, z, sizeof( z ) );
;2401:
;2402:		xyz[0] = atof(x);
;2403:		xyz[1] = atof(y);
;2404:		xyz[2] = atof(z);
;2405:
;2406:		VectorCopy(xyz, ent->client->ps.origin);
;2407:	}
;2408:#endif
;2409:
;2410:	/*
;2411:	else if (Q_stricmp (cmd, "offwithmyhead") == 0)
;2412:	{
;2413:		DismembermentTest(ent);
;2414:	}
;2415:	*/
;2416:	else
;2417:	{
line 2418
;2418:		if (Q_stricmp(cmd, "addbot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $1246
ARGP4
ADDRLP4 1192
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1192
INDIRI4
CNSTI4 0
NEI4 $1244
line 2419
;2419:		{ //because addbot isn't a recognized command unless you're the server, but it is in the menus regardless
line 2420
;2420:			trap_SendServerCommand( clientNum, va("print \"You can only add bots as the server.\n\"" ) );
ADDRGP4 $1247
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2421
;2421:		}
ADDRGP4 $1245
JUMPV
LABELV $1244
line 2423
;2422:		else
;2423:		{
line 2424
;2424:			trap_SendServerCommand( clientNum, va("print \"unknown cmd %s\n\"", cmd ) );
ADDRGP4 $1248
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1196
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 2425
;2425:		}
LABELV $1245
line 2426
;2426:	}
LABELV $1236
LABELV $1233
LABELV $1231
LABELV $1229
LABELV $1227
LABELV $1225
LABELV $1223
LABELV $1221
LABELV $1219
LABELV $1217
LABELV $1215
LABELV $1213
LABELV $1211
LABELV $1209
LABELV $1207
LABELV $1205
LABELV $1203
LABELV $1201
LABELV $1199
LABELV $1197
LABELV $1195
LABELV $1193
line 2427
;2427:}
LABELV $1090
endproc ClientCommand 1200 20
import saberOnSound
import saberOffSound
import BG_CycleForce
import BG_CycleInven
import AcceptBotCommand
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
import G_RunClient
import ClientEndFrame
import ClientThink
import G_CheckClientTimeouts
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
LABELV $1248
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 117
char 1 110
char 1 107
char 1 110
char 1 111
char 1 119
char 1 110
char 1 32
char 1 99
char 1 109
char 1 100
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1247
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 89
char 1 111
char 1 117
char 1 32
char 1 99
char 1 97
char 1 110
char 1 32
char 1 111
char 1 110
char 1 108
char 1 121
char 1 32
char 1 97
char 1 100
char 1 100
char 1 32
char 1 98
char 1 111
char 1 116
char 1 115
char 1 32
char 1 97
char 1 115
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1246
char 1 97
char 1 100
char 1 100
char 1 98
char 1 111
char 1 116
char 1 0
align 1
LABELV $1243
char 1 94
char 1 49
char 1 0
align 1
LABELV $1242
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 84
char 1 72
char 1 69
char 1 32
char 1 68
char 1 69
char 1 83
char 1 84
char 1 82
char 1 79
char 1 89
char 1 69
char 1 82
char 1 32
char 1 67
char 1 79
char 1 77
char 1 69
char 1 84
char 1 72
char 1 10
char 1 34
char 1 0
align 1
LABELV $1237
char 1 116
char 1 104
char 1 101
char 1 100
char 1 101
char 1 115
char 1 116
char 1 114
char 1 111
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $1234
char 1 35
char 1 109
char 1 109
char 1 0
align 1
LABELV $1191
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 89
char 1 111
char 1 117
char 1 32
char 1 99
char 1 97
char 1 110
char 1 110
char 1 111
char 1 116
char 1 32
char 1 112
char 1 101
char 1 114
char 1 102
char 1 111
char 1 114
char 1 109
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 116
char 1 97
char 1 115
char 1 107
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 32
char 1 100
char 1 117
char 1 114
char 1 105
char 1 110
char 1 103
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 105
char 1 110
char 1 116
char 1 101
char 1 114
char 1 109
char 1 105
char 1 115
char 1 115
char 1 105
char 1 111
char 1 110
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $1188
char 1 115
char 1 116
char 1 97
char 1 116
char 1 115
char 1 0
align 1
LABELV $1185
char 1 115
char 1 101
char 1 116
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 0
align 1
LABELV $1182
char 1 103
char 1 99
char 1 0
align 1
LABELV $1179
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1176
char 1 99
char 1 97
char 1 108
char 1 108
char 1 116
char 1 101
char 1 97
char 1 109
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1173
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1170
char 1 99
char 1 97
char 1 108
char 1 108
char 1 118
char 1 111
char 1 116
char 1 101
char 1 0
align 1
LABELV $1167
char 1 119
char 1 104
char 1 101
char 1 114
char 1 101
char 1 0
align 1
LABELV $1164
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 99
char 1 104
char 1 97
char 1 110
char 1 103
char 1 101
char 1 100
char 1 0
align 1
LABELV $1161
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1158
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 112
char 1 114
char 1 101
char 1 118
char 1 0
align 1
LABELV $1155
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 110
char 1 101
char 1 120
char 1 116
char 1 0
align 1
LABELV $1152
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 0
align 1
LABELV $1149
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $1144
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $1141
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 0
align 1
LABELV $1138
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 0
align 1
LABELV $1135
char 1 103
char 1 111
char 1 100
char 1 0
align 1
LABELV $1132
char 1 103
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $1124
char 1 118
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $1121
char 1 118
char 1 111
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1118
char 1 118
char 1 111
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1115
char 1 118
char 1 111
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1110
char 1 118
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1107
char 1 118
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1104
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $1101
char 1 115
char 1 97
char 1 121
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $1098
char 1 115
char 1 97
char 1 121
char 1 0
align 1
LABELV $1095
char 1 98
char 1 111
char 1 116
char 1 95
char 1 0
align 1
LABELV $1087
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 67
char 1 72
char 1 65
char 1 76
char 1 76
char 1 69
char 1 78
char 1 71
char 1 69
char 1 68
char 1 0
align 1
LABELV $1086
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 67
char 1 72
char 1 65
char 1 76
char 1 76
char 1 69
char 1 78
char 1 71
char 1 69
char 1 0
align 1
LABELV $1085
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $1078
char 1 80
char 1 76
char 1 68
char 1 85
char 1 69
char 1 76
char 1 65
char 1 67
char 1 67
char 1 69
char 1 80
char 1 84
char 1 0
align 1
LABELV $1077
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
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
LABELV $1052
char 1 67
char 1 65
char 1 78
char 1 84
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 66
char 1 85
char 1 83
char 1 89
char 1 0
align 1
LABELV $1049
char 1 67
char 1 65
char 1 78
char 1 84
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 74
char 1 85
char 1 83
char 1 84
char 1 68
char 1 73
char 1 68
char 1 0
align 1
LABELV $1033
char 1 78
char 1 79
char 1 68
char 1 85
char 1 69
char 1 76
char 1 95
char 1 71
char 1 65
char 1 77
char 1 69
char 1 84
char 1 89
char 1 80
char 1 69
char 1 0
align 1
LABELV $996
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
LABELV $995
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
LABELV $913
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 117
char 1 115
char 1 97
char 1 103
char 1 101
char 1 58
char 1 32
char 1 115
char 1 101
char 1 116
char 1 118
char 1 105
char 1 101
char 1 119
char 1 112
char 1 111
char 1 115
char 1 32
char 1 120
char 1 32
char 1 121
char 1 32
char 1 122
char 1 32
char 1 121
char 1 97
char 1 119
char 1 10
char 1 34
char 1 0
align 1
LABELV $896
char 1 80
char 1 76
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 67
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $893
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 67
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $890
char 1 78
char 1 79
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 73
char 1 78
char 1 80
char 1 82
char 1 79
char 1 71
char 1 0
align 1
LABELV $866
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 99
char 1 97
char 1 108
char 1 108
char 1 101
char 1 100
char 1 32
char 1 97
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 32
char 1 118
char 1 111
char 1 116
char 1 101
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $854
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 115
char 1 32
char 1 97
char 1 114
char 1 101
char 1 58
char 1 32
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 32
char 1 60
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 62
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $853
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 32
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 32
char 1 111
char 1 110
char 1 32
char 1 121
char 1 111
char 1 117
char 1 114
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $818
char 1 108
char 1 101
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $812
char 1 32
char 1 0
align 1
LABELV $803
char 1 77
char 1 65
char 1 88
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 83
char 1 0
align 1
LABELV $800
char 1 84
char 1 69
char 1 65
char 1 77
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 0
align 1
LABELV $778
char 1 80
char 1 76
char 1 86
char 1 79
char 1 84
char 1 69
char 1 67
char 1 65
char 1 83
char 1 84
char 1 0
align 1
LABELV $777
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 83
char 1 83
char 1 80
char 1 69
char 1 67
char 1 0
align 1
LABELV $774
char 1 86
char 1 79
char 1 84
char 1 69
char 1 65
char 1 76
char 1 82
char 1 69
char 1 65
char 1 68
char 1 89
char 1 0
align 1
LABELV $771
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 73
char 1 78
char 1 80
char 1 82
char 1 79
char 1 71
char 1 0
align 1
LABELV $762
char 1 37
char 1 105
char 1 0
align 1
LABELV $752
char 1 80
char 1 76
char 1 67
char 1 65
char 1 76
char 1 76
char 1 69
char 1 68
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $751
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $747
char 1 37
char 1 115
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $741
char 1 118
char 1 115
char 1 116
char 1 114
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $738
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 115
char 1 101
char 1 116
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $732
char 1 37
char 1 115
char 1 0
align 1
LABELV $727
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 59
char 1 32
char 1 115
char 1 101
char 1 116
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $722
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 95
char 1 77
char 1 65
char 1 80
char 1 78
char 1 79
char 1 84
char 1 83
char 1 85
char 1 80
char 1 80
char 1 79
char 1 82
char 1 84
char 1 69
char 1 68
char 1 66
char 1 89
char 1 71
char 1 65
char 1 77
char 1 69
char 1 0
align 1
LABELV $717
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $714
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 0
align 1
LABELV $709
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 73
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $701
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $696
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 86
char 1 111
char 1 116
char 1 101
char 1 32
char 1 99
char 1 111
char 1 109
char 1 109
char 1 97
char 1 110
char 1 100
char 1 115
char 1 32
char 1 97
char 1 114
char 1 101
char 1 58
char 1 32
char 1 109
char 1 97
char 1 112
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 44
char 1 32
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 44
char 1 32
char 1 109
char 1 97
char 1 112
char 1 32
char 1 60
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 62
char 1 44
char 1 32
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 60
char 1 110
char 1 62
char 1 44
char 1 32
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 60
char 1 112
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 62
char 1 44
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 32
char 1 60
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 110
char 1 117
char 1 109
char 1 62
char 1 44
char 1 32
char 1 103
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 44
char 1 32
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 60
char 1 116
char 1 105
char 1 109
char 1 101
char 1 62
char 1 44
char 1 32
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 32
char 1 60
char 1 102
char 1 114
char 1 97
char 1 103
char 1 115
char 1 62
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $695
char 1 102
char 1 114
char 1 97
char 1 103
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $692
char 1 116
char 1 105
char 1 109
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $689
char 1 103
char 1 95
char 1 100
char 1 111
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $686
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 107
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $683
char 1 107
char 1 105
char 1 99
char 1 107
char 1 0
align 1
LABELV $680
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 0
align 1
LABELV $677
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $674
char 1 110
char 1 101
char 1 120
char 1 116
char 1 109
char 1 97
char 1 112
char 1 0
align 1
LABELV $671
char 1 109
char 1 97
char 1 112
char 1 95
char 1 114
char 1 101
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $668
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 73
char 1 110
char 1 118
char 1 97
char 1 108
char 1 105
char 1 100
char 1 32
char 1 118
char 1 111
char 1 116
char 1 101
char 1 32
char 1 115
char 1 116
char 1 114
char 1 105
char 1 110
char 1 103
char 1 46
char 1 10
char 1 34
char 1 0
align 1
LABELV $664
char 1 78
char 1 79
char 1 83
char 1 80
char 1 69
char 1 67
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $661
char 1 77
char 1 65
char 1 88
char 1 86
char 1 79
char 1 84
char 1 69
char 1 83
char 1 0
align 1
LABELV $658
char 1 86
char 1 79
char 1 84
char 1 69
char 1 73
char 1 78
char 1 80
char 1 82
char 1 79
char 1 71
char 1 82
char 1 69
char 1 83
char 1 83
char 1 0
align 1
LABELV $654
char 1 78
char 1 79
char 1 86
char 1 79
char 1 84
char 1 69
char 1 0
align 1
LABELV $649
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 89
char 1 115
char 1 97
char 1 108
char 1 97
char 1 109
char 1 105
char 1 114
char 1 105
char 1 0
align 1
LABELV $648
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 70
char 1 108
char 1 97
char 1 103
char 1 0
align 1
LABELV $647
char 1 78
char 1 47
char 1 65
char 1 0
align 1
LABELV $646
char 1 84
char 1 101
char 1 97
char 1 109
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $645
char 1 83
char 1 105
char 1 110
char 1 103
char 1 108
char 1 101
char 1 32
char 1 80
char 1 108
char 1 97
char 1 121
char 1 101
char 1 114
char 1 0
align 1
LABELV $644
char 1 68
char 1 117
char 1 101
char 1 108
char 1 0
align 1
LABELV $643
char 1 74
char 1 101
char 1 100
char 1 105
char 1 32
char 1 77
char 1 97
char 1 115
char 1 116
char 1 101
char 1 114
char 1 0
align 1
LABELV $642
char 1 72
char 1 111
char 1 108
char 1 111
char 1 99
char 1 114
char 1 111
char 1 110
char 1 32
char 1 70
char 1 70
char 1 65
char 1 0
align 1
LABELV $641
char 1 70
char 1 114
char 1 101
char 1 101
char 1 32
char 1 70
char 1 111
char 1 114
char 1 32
char 1 65
char 1 108
char 1 108
char 1 0
align 1
LABELV $632
char 1 114
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $631
char 1 115
char 1 101
char 1 97
char 1 114
char 1 99
char 1 104
char 1 32
char 1 97
char 1 110
char 1 100
char 1 32
char 1 100
char 1 101
char 1 115
char 1 116
char 1 114
char 1 111
char 1 121
char 1 0
align 1
LABELV $630
char 1 103
char 1 117
char 1 97
char 1 114
char 1 100
char 1 32
char 1 108
char 1 111
char 1 99
char 1 97
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $629
char 1 99
char 1 111
char 1 118
char 1 101
char 1 114
char 1 32
char 1 109
char 1 101
char 1 0
align 1
LABELV $628
char 1 99
char 1 111
char 1 109
char 1 101
char 1 32
char 1 104
char 1 101
char 1 114
char 1 101
char 1 0
align 1
LABELV $627
char 1 104
char 1 111
char 1 108
char 1 100
char 1 32
char 1 116
char 1 104
char 1 105
char 1 115
char 1 32
char 1 112
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $626
char 1 104
char 1 111
char 1 108
char 1 100
char 1 32
char 1 121
char 1 111
char 1 117
char 1 114
char 1 32
char 1 112
char 1 111
char 1 115
char 1 105
char 1 116
char 1 105
char 1 111
char 1 110
char 1 0
align 1
LABELV $625
char 1 116
char 1 97
char 1 117
char 1 110
char 1 116
char 1 0
align 1
LABELV $622
char 1 112
char 1 114
char 1 97
char 1 105
char 1 115
char 1 101
char 1 0
align 1
LABELV $605
char 1 107
char 1 105
char 1 108
char 1 108
char 1 95
char 1 105
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $600
char 1 107
char 1 105
char 1 108
char 1 108
char 1 95
char 1 103
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 0
align 1
LABELV $589
char 1 100
char 1 101
char 1 97
char 1 116
char 1 104
char 1 95
char 1 105
char 1 110
char 1 115
char 1 117
char 1 108
char 1 116
char 1 0
align 1
LABELV $579
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $557
char 1 118
char 1 111
char 1 105
char 1 99
char 1 101
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $547
char 1 37
char 1 115
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 100
char 1 32
char 1 37
char 1 115
char 1 0
align 1
LABELV $546
char 1 118
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $545
char 1 118
char 1 116
char 1 101
char 1 108
char 1 108
char 1 0
align 1
LABELV $542
char 1 118
char 1 116
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $525
char 1 116
char 1 101
char 1 108
char 1 108
char 1 58
char 1 32
char 1 37
char 1 115
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $503
char 1 37
char 1 115
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $497
char 1 25
char 1 91
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 93
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $496
char 1 25
char 1 91
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 93
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $491
char 1 25
char 1 40
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 41
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $490
char 1 25
char 1 40
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 41
char 1 32
char 1 40
char 1 37
char 1 115
char 1 41
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $487
char 1 115
char 1 97
char 1 121
char 1 116
char 1 101
char 1 97
char 1 109
char 1 58
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $485
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 25
char 1 58
char 1 32
char 1 0
align 1
LABELV $484
char 1 115
char 1 97
char 1 121
char 1 58
char 1 32
char 1 37
char 1 115
char 1 58
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $473
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $472
char 1 116
char 1 99
char 1 104
char 1 97
char 1 116
char 1 0
align 1
LABELV $471
char 1 37
char 1 115
char 1 32
char 1 34
char 1 37
char 1 115
char 1 37
char 1 99
char 1 37
char 1 99
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $443
char 1 67
char 1 109
char 1 100
char 1 95
char 1 70
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 67
char 1 121
char 1 99
char 1 108
char 1 101
char 1 95
char 1 102
char 1 58
char 1 32
char 1 98
char 1 97
char 1 100
char 1 32
char 1 100
char 1 105
char 1 114
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $414
char 1 94
char 1 50
char 1 0
align 1
LABELV $413
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $412
char 1 70
char 1 79
char 1 82
char 1 67
char 1 69
char 1 80
char 1 79
char 1 87
char 1 69
char 1 82
char 1 67
char 1 72
char 1 65
char 1 78
char 1 71
char 1 69
char 1 68
char 1 0
align 1
LABELV $403
char 1 78
char 1 79
char 1 83
char 1 87
char 1 73
char 1 84
char 1 67
char 1 72
char 1 0
align 1
LABELV $398
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $397
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 83
char 1 112
char 1 101
char 1 99
char 1 116
char 1 97
char 1 116
char 1 111
char 1 114
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 10
char 1 34
char 1 0
align 1
LABELV $395
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 70
char 1 82
char 1 69
char 1 69
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $394
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 70
char 1 114
char 1 101
char 1 101
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 10
char 1 34
char 1 0
align 1
LABELV $392
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 82
char 1 69
char 1 68
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $391
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 82
char 1 101
char 1 100
char 1 32
char 1 116
char 1 101
char 1 97
char 1 109
char 1 10
char 1 34
char 1 0
align 1
LABELV $389
char 1 80
char 1 82
char 1 73
char 1 78
char 1 84
char 1 66
char 1 76
char 1 85
char 1 69
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $350
char 1 84
char 1 79
char 1 79
char 1 77
char 1 65
char 1 78
char 1 89
char 1 66
char 1 76
char 1 85
char 1 69
char 1 0
align 1
LABELV $345
char 1 84
char 1 79
char 1 79
char 1 77
char 1 65
char 1 78
char 1 89
char 1 82
char 1 69
char 1 68
char 1 0
align 1
LABELV $334
char 1 98
char 1 0
align 1
LABELV $333
char 1 98
char 1 108
char 1 117
char 1 101
char 1 0
align 1
LABELV $329
char 1 114
char 1 0
align 1
LABELV $328
char 1 114
char 1 101
char 1 100
char 1 0
align 1
LABELV $321
char 1 115
char 1 0
align 1
LABELV $320
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
LABELV $317
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 50
char 1 0
align 1
LABELV $314
char 1 102
char 1 111
char 1 108
char 1 108
char 1 111
char 1 119
char 1 49
char 1 0
align 1
LABELV $310
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $309
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 98
char 1 111
char 1 97
char 1 114
char 1 100
char 1 0
align 1
LABELV $305
char 1 115
char 1 101
char 1 116
char 1 116
char 1 101
char 1 97
char 1 109
char 1 58
char 1 32
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 115
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $304
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 66
char 1 65
char 1 84
char 1 84
char 1 76
char 1 69
char 1 0
align 1
LABELV $298
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 83
char 1 80
char 1 69
char 1 67
char 1 84
char 1 65
char 1 84
char 1 79
char 1 82
char 1 83
char 1 0
align 1
LABELV $295
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 66
char 1 76
char 1 85
char 1 69
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $292
char 1 74
char 1 79
char 1 73
char 1 78
char 1 69
char 1 68
char 1 84
char 1 72
char 1 69
char 1 82
char 1 69
char 1 68
char 1 84
char 1 69
char 1 65
char 1 77
char 1 0
align 1
LABELV $291
char 1 99
char 1 112
char 1 32
char 1 34
char 1 37
char 1 115
char 1 94
char 1 55
char 1 32
char 1 37
char 1 115
char 1 10
char 1 34
char 1 0
align 1
LABELV $279
char 1 65
char 1 84
char 1 84
char 1 69
char 1 77
char 1 80
char 1 84
char 1 68
char 1 85
char 1 69
char 1 76
char 1 75
char 1 73
char 1 76
char 1 76
char 1 0
align 1
LABELV $268
char 1 37
char 1 100
char 1 0
align 1
LABELV $267
char 1 116
char 1 101
char 1 97
char 1 109
char 1 116
char 1 97
char 1 115
char 1 107
char 1 0
align 1
LABELV $263
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 76
char 1 101
char 1 118
char 1 101
char 1 108
char 1 83
char 1 104
char 1 111
char 1 116
char 1 0
align 1
LABELV $262
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 77
char 1 117
char 1 115
char 1 116
char 1 32
char 1 98
char 1 101
char 1 32
char 1 105
char 1 110
char 1 32
char 1 103
char 1 95
char 1 103
char 1 97
char 1 109
char 1 101
char 1 116
char 1 121
char 1 112
char 1 101
char 1 32
char 1 48
char 1 32
char 1 102
char 1 111
char 1 114
char 1 32
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 115
char 1 104
char 1 111
char 1 116
char 1 10
char 1 34
char 1 0
align 1
LABELV $252
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 32
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $251
char 1 110
char 1 111
char 1 99
char 1 108
char 1 105
char 1 112
char 1 32
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $245
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $244
char 1 110
char 1 111
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $238
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 37
char 1 115
char 1 34
char 1 0
align 1
LABELV $237
char 1 103
char 1 111
char 1 100
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 79
char 1 78
char 1 10
char 1 0
align 1
LABELV $236
char 1 103
char 1 111
char 1 100
char 1 109
char 1 111
char 1 100
char 1 101
char 1 32
char 1 79
char 1 70
char 1 70
char 1 10
char 1 0
align 1
LABELV $224
char 1 97
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $221
char 1 100
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 0
align 1
LABELV $218
char 1 103
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 97
char 1 119
char 1 97
char 1 114
char 1 100
char 1 0
align 1
LABELV $215
char 1 105
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 105
char 1 118
char 1 101
char 1 0
align 1
LABELV $212
char 1 101
char 1 120
char 1 99
char 1 101
char 1 108
char 1 108
char 1 101
char 1 110
char 1 116
char 1 0
align 1
LABELV $204
char 1 97
char 1 114
char 1 109
char 1 111
char 1 114
char 1 0
align 1
LABELV $192
char 1 97
char 1 109
char 1 109
char 1 111
char 1 0
align 1
LABELV $189
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 110
char 1 117
char 1 109
char 1 0
align 1
LABELV $183
char 1 119
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 115
char 1 0
align 1
LABELV $173
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 0
align 1
LABELV $165
char 1 97
char 1 108
char 1 108
char 1 0
align 1
LABELV $159
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 85
char 1 115
char 1 101
char 1 114
char 1 32
char 1 37
char 1 115
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 111
char 1 110
char 1 32
char 1 116
char 1 104
char 1 101
char 1 32
char 1 115
char 1 101
char 1 114
char 1 118
char 1 101
char 1 114
char 1 10
char 1 34
char 1 0
align 1
LABELV $149
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 67
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 37
char 1 105
char 1 32
char 1 105
char 1 115
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 97
char 1 99
char 1 116
char 1 105
char 1 118
char 1 101
char 1 10
char 1 34
char 1 0
align 1
LABELV $146
char 1 112
char 1 114
char 1 105
char 1 110
char 1 116
char 1 32
char 1 34
char 1 66
char 1 97
char 1 100
char 1 32
char 1 99
char 1 108
char 1 105
char 1 101
char 1 110
char 1 116
char 1 32
char 1 115
char 1 108
char 1 111
char 1 116
char 1 58
char 1 32
char 1 37
char 1 105
char 1 10
char 1 34
char 1 0
align 1
LABELV $120
char 1 77
char 1 85
char 1 83
char 1 84
char 1 66
char 1 69
char 1 65
char 1 76
char 1 73
char 1 86
char 1 69
char 1 0
align 1
LABELV $117
char 1 78
char 1 79
char 1 67
char 1 72
char 1 69
char 1 65
char 1 84
char 1 83
char 1 0
align 1
LABELV $116
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
LABELV $115
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
LABELV $105
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 115
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 37
char 1 115
char 1 0
align 1
LABELV $97
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
char 1 32
char 1 37
char 1 105
char 1 32
char 1 37
char 1 105
char 1 0
