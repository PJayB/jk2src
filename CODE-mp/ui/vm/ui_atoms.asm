export Com_Error
code
proc Com_Error 1032 12
file "../ui_atoms.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/**********************************************************************
;4:	UI_ATOMS.C
;5:
;6:	User interface building blocks and support functions.
;7:**********************************************************************/
;8:#include "ui_local.h"
;9:
;10:qboolean		m_entersound;		// after a frame, so caching won't disrupt the sound
;11:
;12:// these are here so the functions in q_shared.c can link
;13:#ifndef UI_HARD_LINKED
;14:
;15:void QDECL Com_Error( int level, const char *error, ... ) {
line 19
;16:	va_list		argptr;
;17:	char		text[1024];
;18:
;19:	va_start (argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 20
;20:	vsprintf (text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 21
;21:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 23
;22:
;23:	trap_Error( va("%s", text) );
ADDRGP4 $119
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 24
;24:}
LABELV $117
endproc Com_Error 1032 12
export Com_Printf
proc Com_Printf 1032 12
line 26
;25:
;26:void QDECL Com_Printf( const char *msg, ... ) {
line 30
;27:	va_list		argptr;
;28:	char		text[1024];
;29:
;30:	va_start (argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 31
;31:	vsprintf (text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 vsprintf
CALLI4
pop
line 32
;32:	va_end (argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 34
;33:
;34:	trap_Print( va("%s", text) );
ADDRGP4 $119
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 35
;35:}
LABELV $120
endproc Com_Printf 1032 12
data
export newUI
align 4
LABELV newUI
byte 4 0
export UI_ClampCvar
code
proc UI_ClampCvar 0 0
line 48
;36:
;37:#endif
;38:
;39:qboolean newUI = qfalse;
;40:
;41:
;42:/*
;43:=================
;44:UI_ClampCvar
;45:=================
;46:*/
;47:float UI_ClampCvar( float min, float max, float value )
;48:{
line 49
;49:	if ( value < min ) return min;
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $123
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $122
JUMPV
LABELV $123
line 50
;50:	if ( value > max ) return max;
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $125
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $122
JUMPV
LABELV $125
line 51
;51:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $122
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 59
;52:}
;53:
;54:/*
;55:=================
;56:UI_StartDemoLoop
;57:=================
;58:*/
;59:void UI_StartDemoLoop( void ) {
line 60
;60:	trap_Cmd_ExecuteText( EXEC_APPEND, "d1\n" );
CNSTI4 2
ARGI4
ADDRGP4 $128
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 61
;61:}
LABELV $127
endproc UI_StartDemoLoop 0 8
bss
align 1
LABELV $130
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 64
;62:
;63:
;64:char *UI_Argv( int arg ) {
line 67
;65:	static char	buffer[MAX_STRING_CHARS];
;66:
;67:	trap_Argv( arg, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $130
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 69
;68:
;69:	return buffer;
ADDRGP4 $130
RETP4
LABELV $129
endproc UI_Argv 0 12
bss
align 1
LABELV $132
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 73
;70:}
;71:
;72:
;73:char *UI_Cvar_VariableString( const char *var_name ) {
line 76
;74:	static char	buffer[MAX_STRING_CHARS];
;75:
;76:	trap_Cvar_VariableStringBuffer( var_name, buffer, sizeof( buffer ) );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $132
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 78
;77:
;78:	return buffer;
ADDRGP4 $132
RETP4
LABELV $131
endproc UI_Cvar_VariableString 0 12
export UI_SetBestScores
proc UI_SetBestScores 144 12
line 83
;79:}
;80:
;81:
;82:
;83:void UI_SetBestScores(postGameInfo_t *newInfo, qboolean postGame) {
line 84
;84:	trap_Cvar_Set("ui_scoreAccuracy",     va("%i%%", newInfo->accuracy));
ADDRGP4 $135
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $134
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 85
;85:	trap_Cvar_Set("ui_scoreImpressives",	va("%i", newInfo->impressives));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $136
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 86
;86:	trap_Cvar_Set("ui_scoreExcellents", 	va("%i", newInfo->excellents));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $138
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 87
;87:	trap_Cvar_Set("ui_scoreDefends", 			va("%i", newInfo->defends));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $139
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 88
;88:	trap_Cvar_Set("ui_scoreAssists", 			va("%i", newInfo->assists));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $140
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 89
;89:	trap_Cvar_Set("ui_scoreGauntlets", 		va("%i", newInfo->gauntlets));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $141
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 90
;90:	trap_Cvar_Set("ui_scoreScore", 				va("%i", newInfo->score));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $142
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 91
;91:	trap_Cvar_Set("ui_scorePerfect",	 		va("%i", newInfo->perfects));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $143
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 92
;92:	trap_Cvar_Set("ui_scoreTeam",					va("%i to %i", newInfo->redScore, newInfo->blueScore));
ADDRGP4 $145
ARGP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $144
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 93
;93:	trap_Cvar_Set("ui_scoreBase",					va("%i", newInfo->baseScore));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $146
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 94
;94:	trap_Cvar_Set("ui_scoreTimeBonus",		va("%i", newInfo->timeBonus));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $147
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 95
;95:	trap_Cvar_Set("ui_scoreSkillBonus",		va("%i", newInfo->skillBonus));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $148
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 96
;96:	trap_Cvar_Set("ui_scoreShutoutBonus",	va("%i", newInfo->shutoutBonus));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $149
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 97
;97:	trap_Cvar_Set("ui_scoreTime",					va("%02i:%02i", newInfo->time / 60, newInfo->time % 60));
ADDRGP4 $151
ARGP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 60
CNSTI4 60
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
DIVI4
ARGI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
MODI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $150
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 98
;98:	trap_Cvar_Set("ui_scoreCaptures",		va("%i", newInfo->captures));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $152
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 99
;99:  if (postGame) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $153
line 100
;100:		trap_Cvar_Set("ui_scoreAccuracy2",     va("%i%%", newInfo->accuracy));
ADDRGP4 $135
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $155
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 101
;101:		trap_Cvar_Set("ui_scoreImpressives2",	va("%i", newInfo->impressives));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $156
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 102
;102:		trap_Cvar_Set("ui_scoreExcellents2", 	va("%i", newInfo->excellents));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $157
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 103
;103:		trap_Cvar_Set("ui_scoreDefends2", 			va("%i", newInfo->defends));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $158
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 104
;104:		trap_Cvar_Set("ui_scoreAssists2", 			va("%i", newInfo->assists));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $159
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 105
;105:		trap_Cvar_Set("ui_scoreGauntlets2", 		va("%i", newInfo->gauntlets));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $160
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 106
;106:		trap_Cvar_Set("ui_scoreScore2", 				va("%i", newInfo->score));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $161
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 107
;107:		trap_Cvar_Set("ui_scorePerfect2",	 		va("%i", newInfo->perfects));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $162
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 108
;108:		trap_Cvar_Set("ui_scoreTeam2",					va("%i to %i", newInfo->redScore, newInfo->blueScore));
ADDRGP4 $145
ARGP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $163
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 109
;109:		trap_Cvar_Set("ui_scoreBase2",					va("%i", newInfo->baseScore));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $164
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 110
;110:		trap_Cvar_Set("ui_scoreTimeBonus2",		va("%i", newInfo->timeBonus));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $165
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 111
;111:		trap_Cvar_Set("ui_scoreSkillBonus2",		va("%i", newInfo->skillBonus));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $166
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 112
;112:		trap_Cvar_Set("ui_scoreShutoutBonus2",	va("%i", newInfo->shutoutBonus));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 124
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $167
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 113
;113:		trap_Cvar_Set("ui_scoreTime2",					va("%02i:%02i", newInfo->time / 60, newInfo->time % 60));
ADDRGP4 $151
ARGP4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
ADDRLP4 132
CNSTI4 60
ASGNI4
ADDRLP4 128
INDIRI4
ADDRLP4 132
INDIRI4
DIVI4
ARGI4
ADDRLP4 128
INDIRI4
ADDRLP4 132
INDIRI4
MODI4
ARGI4
ADDRLP4 136
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $168
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 114
;114:		trap_Cvar_Set("ui_scoreCaptures2",		va("%i", newInfo->captures));
ADDRGP4 $137
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $169
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 115
;115:	}
LABELV $153
line 116
;116:}
LABELV $133
endproc UI_SetBestScores 144 12
export UI_LoadBestScores
proc UI_LoadBestScores 144 24
line 118
;117:
;118:void UI_LoadBestScores(const char *map, int game) {
line 122
;119:	char		fileName[MAX_QPATH];
;120:	fileHandle_t f;
;121:	postGameInfo_t newInfo;
;122:	memset(&newInfo, 0, sizeof(postGameInfo_t));
ADDRLP4 68
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 123
;123:	Com_sprintf(fileName, MAX_QPATH, "games/%s_%i.game", map, game);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $171
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 124
;124:	if (trap_FS_FOpenFile(fileName, &f, FS_READ) >= 0) {
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 132
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $172
line 125
;125:		int size = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 126
;126:		trap_FS_Read(&size, sizeof(int), f);
ADDRLP4 136
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 127
;127:		if (size == sizeof(postGameInfo_t)) {
ADDRLP4 136
INDIRI4
CVIU4 4
CNSTU4 64
NEU4 $174
line 128
;128:			trap_FS_Read(&newInfo, sizeof(postGameInfo_t), f);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 129
;129:		}
LABELV $174
line 130
;130:		trap_FS_FCloseFile(f);
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 131
;131:	}
LABELV $172
line 132
;132:	UI_SetBestScores(&newInfo, qfalse);
ADDRLP4 68
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_SetBestScores
CALLV
pop
line 134
;133:
;134:	Com_sprintf(fileName, MAX_QPATH, "demos/%s_%d.dm_%d", map, game, (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $177
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $176
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 136
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 135
;135:	uiInfo.demoAvailable = qfalse;
ADDRGP4 uiInfo+11824
CNSTI4 0
ASGNI4
line 136
;136:	if (trap_FS_FOpenFile(fileName, &f, FS_READ) >= 0) {
ADDRLP4 0
ARGP4
ADDRLP4 64
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $179
line 137
;137:		uiInfo.demoAvailable = qtrue;
ADDRGP4 uiInfo+11824
CNSTI4 1
ASGNI4
line 138
;138:		trap_FS_FCloseFile(f);
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 139
;139:	} 
LABELV $179
line 140
;140:}
LABELV $170
endproc UI_LoadBestScores 144 24
export UI_ClearScores
proc UI_ClearScores 4200 16
line 147
;141:
;142:/*
;143:===============
;144:UI_ClearScores
;145:===============
;146:*/
;147:void UI_ClearScores() {
line 154
;148:	char	gameList[4096];
;149:	char *gameFile;
;150:	int		i, len, count, size;
;151:	fileHandle_t f;
;152:	postGameInfo_t newInfo;
;153:
;154:	count = trap_FS_GetFileList( "games", "game", gameList, sizeof(gameList) );
ADDRGP4 $183
ARGP4
ADDRGP4 $184
ARGP4
ADDRLP4 88
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4184
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 4184
INDIRI4
ASGNI4
line 156
;155:
;156:	size = sizeof(postGameInfo_t);
ADDRLP4 20
CNSTI4 64
ASGNI4
line 157
;157:	memset(&newInfo, 0, size);
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 159
;158:
;159:	if (count > 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $185
line 160
;160:		gameFile = gameList;
ADDRLP4 0
ADDRLP4 88
ASGNP4
line 161
;161:		for ( i = 0; i < count; i++ ) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $190
JUMPV
LABELV $187
line 162
;162:			len = strlen(gameFile);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4188
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 4188
INDIRI4
ASGNI4
line 163
;163:			if (trap_FS_FOpenFile(va("games/%s",gameFile), &f, FS_WRITE) >= 0) {
ADDRGP4 $193
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4192
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4192
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4196
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4196
INDIRI4
CNSTI4 0
LTI4 $191
line 164
;164:				trap_FS_Write(&size, sizeof(int), f);
ADDRLP4 20
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 165
;165:				trap_FS_Write(&newInfo, size, f);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 166
;166:				trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 167
;167:			}
LABELV $191
line 168
;168:			gameFile += len + 1;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 169
;169:		}
LABELV $188
line 161
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $190
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $187
line 170
;170:	}
LABELV $185
line 172
;171:	
;172:	UI_SetBestScores(&newInfo, qfalse);
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 UI_SetBestScores
CALLV
pop
line 174
;173:
;174:}
LABELV $182
endproc UI_ClearScores 4200 16
proc UI_Cache_f 12 8
line 178
;175:
;176:
;177:
;178:static void	UI_Cache_f() {
line 180
;179:	int i;
;180:	Display_CacheAll();
ADDRGP4 Display_CacheAll
CALLV
pop
line 181
;181:	if (trap_Argc() == 2) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $195
line 182
;182:		for (i = 0; i < uiInfo.q3HeadCount; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 183
;183:		{
line 184
;184:			trap_Print( va("model %s\n", uiInfo.q3HeadNames[i]) );
ADDRGP4 $202
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 uiInfo+60736
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 185
;185:		}
LABELV $198
line 182
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 0
INDIRI4
ADDRGP4 uiInfo+60732
INDIRI4
LTI4 $197
line 186
;186:	}
LABELV $195
line 187
;187:}
LABELV $194
endproc UI_Cache_f 12 8
proc UI_CalcPostGameStats 1460 20
line 194
;188:
;189:/*
;190:=======================
;191:UI_CalcPostGameStats
;192:=======================
;193:*/
;194:static void UI_CalcPostGameStats() {
line 202
;195:	char		map[MAX_QPATH];
;196:	char		fileName[MAX_QPATH];
;197:	char		info[MAX_INFO_STRING];
;198:	fileHandle_t f;
;199:	int size, game, time, adjustedTime;
;200:	postGameInfo_t oldInfo;
;201:	postGameInfo_t newInfo;
;202:	qboolean newHigh = qfalse;
ADDRLP4 1088
CNSTI4 0
ASGNI4
line 204
;203:
;204:	trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) );
CNSTI4 0
ARGI4
ADDRLP4 64
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 205
;205:	Q_strncpyz( map, Info_ValueForKey( info, "mapname" ), sizeof(map) );
ADDRLP4 64
ARGP4
ADDRGP4 $205
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1160
ARGP4
ADDRLP4 1304
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 206
;206:	game = atoi(Info_ValueForKey(info, "g_gametype"));
ADDRLP4 64
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 1308
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1308
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1224
ADDRLP4 1312
INDIRI4
ASGNI4
line 209
;207:
;208:	// compose file name
;209:	Com_sprintf(fileName, MAX_QPATH, "games/%s_%i.game", map, game);
ADDRLP4 1228
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $171
ARGP4
ADDRLP4 1160
ARGP4
ADDRLP4 1224
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 211
;210:	// see if we have one already
;211:	memset(&oldInfo, 0, sizeof(postGameInfo_t));
ADDRLP4 1096
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 212
;212:	if (trap_FS_FOpenFile(fileName, &f, FS_READ) >= 0) {
ADDRLP4 1228
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1316
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
LTI4 $207
line 214
;213:	// if so load it
;214:		size = 0;
ADDRLP4 1296
CNSTI4 0
ASGNI4
line 215
;215:		trap_FS_Read(&size, sizeof(int), f);
ADDRLP4 1296
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 216
;216:		if (size == sizeof(postGameInfo_t)) {
ADDRLP4 1296
INDIRI4
CVIU4 4
CNSTU4 64
NEU4 $209
line 217
;217:			trap_FS_Read(&oldInfo, sizeof(postGameInfo_t), f);
ADDRLP4 1096
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 218
;218:		}
LABELV $209
line 219
;219:		trap_FS_FCloseFile(f);
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 220
;220:	}					 
LABELV $207
line 222
;221:
;222:	newInfo.accuracy = atoi(UI_Argv(3));
CNSTI4 3
ARGI4
ADDRLP4 1320
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+16
ADDRLP4 1324
INDIRI4
ASGNI4
line 223
;223:	newInfo.impressives = atoi(UI_Argv(4));
CNSTI4 4
ARGI4
ADDRLP4 1328
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRLP4 1332
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+20
ADDRLP4 1332
INDIRI4
ASGNI4
line 224
;224:	newInfo.excellents = atoi(UI_Argv(5));
CNSTI4 5
ARGI4
ADDRLP4 1336
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1336
INDIRP4
ARGP4
ADDRLP4 1340
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+24
ADDRLP4 1340
INDIRI4
ASGNI4
line 225
;225:	newInfo.defends = atoi(UI_Argv(6));
CNSTI4 6
ARGI4
ADDRLP4 1344
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1344
INDIRP4
ARGP4
ADDRLP4 1348
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+28
ADDRLP4 1348
INDIRI4
ASGNI4
line 226
;226:	newInfo.assists = atoi(UI_Argv(7));
CNSTI4 7
ARGI4
ADDRLP4 1352
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1352
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+32
ADDRLP4 1356
INDIRI4
ASGNI4
line 227
;227:	newInfo.gauntlets = atoi(UI_Argv(8));
CNSTI4 8
ARGI4
ADDRLP4 1360
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1360
INDIRP4
ARGP4
ADDRLP4 1364
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+36
ADDRLP4 1364
INDIRI4
ASGNI4
line 228
;228:	newInfo.baseScore = atoi(UI_Argv(9));
CNSTI4 9
ARGI4
ADDRLP4 1368
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1368
INDIRP4
ARGP4
ADDRLP4 1372
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+60
ADDRLP4 1372
INDIRI4
ASGNI4
line 229
;229:	newInfo.perfects = atoi(UI_Argv(10));
CNSTI4 10
ARGI4
ADDRLP4 1376
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRLP4 1380
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+12
ADDRLP4 1380
INDIRI4
ASGNI4
line 230
;230:	newInfo.redScore = atoi(UI_Argv(11));
CNSTI4 11
ARGI4
ADDRLP4 1384
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1384
INDIRP4
ARGP4
ADDRLP4 1388
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 1388
INDIRI4
ASGNI4
line 231
;231:	newInfo.blueScore = atoi(UI_Argv(12));
CNSTI4 12
ARGI4
ADDRLP4 1392
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1392
INDIRP4
ARGP4
ADDRLP4 1396
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 1396
INDIRI4
ASGNI4
line 232
;232:	time = atoi(UI_Argv(13));
CNSTI4 13
ARGI4
ADDRLP4 1400
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1400
INDIRP4
ARGP4
ADDRLP4 1404
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1300
ADDRLP4 1404
INDIRI4
ASGNI4
line 233
;233:	newInfo.captures = atoi(UI_Argv(14));
CNSTI4 14
ARGI4
ADDRLP4 1408
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1408
INDIRP4
ARGP4
ADDRLP4 1412
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+40
ADDRLP4 1412
INDIRI4
ASGNI4
line 235
;234:
;235:	newInfo.time = (time - trap_Cvar_VariableValue("ui_matchStartTime")) / 1000;
ADDRGP4 $223
ARGP4
ADDRLP4 1416
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+44
ADDRLP4 1300
INDIRI4
CVIF4 4
ADDRLP4 1416
INDIRF4
SUBF4
CNSTF4 1148846080
DIVF4
CVFI4 4
ASGNI4
line 236
;236:	adjustedTime = uiInfo.mapList[ui_currentMap.integer].timeToBeat[game];
ADDRLP4 1292
ADDRLP4 1224
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 100
ADDRGP4 ui_currentMap+12
INDIRI4
MULI4
ADDRGP4 uiInfo+20212+28
ADDP4
ADDP4
INDIRI4
ASGNI4
line 237
;237:	if (newInfo.time < adjustedTime) { 
ADDRLP4 0+44
INDIRI4
ADDRLP4 1292
INDIRI4
GEI4 $227
line 238
;238:		newInfo.timeBonus = (adjustedTime - newInfo.time) * 10;
ADDRLP4 0+48
CNSTI4 10
ADDRLP4 1292
INDIRI4
ADDRLP4 0+44
INDIRI4
SUBI4
MULI4
ASGNI4
line 239
;239:	} else {
ADDRGP4 $228
JUMPV
LABELV $227
line 240
;240:		newInfo.timeBonus = 0;
ADDRLP4 0+48
CNSTI4 0
ASGNI4
line 241
;241:	}
LABELV $228
line 243
;242:
;243:	if (newInfo.redScore > newInfo.blueScore && newInfo.blueScore <= 0) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $233
ADDRLP4 0+8
INDIRI4
CNSTI4 0
GTI4 $233
line 244
;244:		newInfo.shutoutBonus = 100;
ADDRLP4 0+52
CNSTI4 100
ASGNI4
line 245
;245:	} else {
ADDRGP4 $234
JUMPV
LABELV $233
line 246
;246:		newInfo.shutoutBonus = 0;
ADDRLP4 0+52
CNSTI4 0
ASGNI4
line 247
;247:	}
LABELV $234
line 249
;248:
;249:	newInfo.skillBonus = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $241
ARGP4
ADDRLP4 1420
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0+56
ADDRLP4 1420
INDIRF4
CVFI4 4
ASGNI4
line 250
;250:	if (newInfo.skillBonus <= 0) {
ADDRLP4 0+56
INDIRI4
CNSTI4 0
GTI4 $242
line 251
;251:		newInfo.skillBonus = 1;
ADDRLP4 0+56
CNSTI4 1
ASGNI4
line 252
;252:	}
LABELV $242
line 253
;253:	newInfo.score = newInfo.baseScore + newInfo.shutoutBonus + newInfo.timeBonus;
ADDRLP4 0
ADDRLP4 0+60
INDIRI4
ADDRLP4 0+52
INDIRI4
ADDI4
ADDRLP4 0+48
INDIRI4
ADDI4
ASGNI4
line 254
;254:	newInfo.score *= newInfo.skillBonus;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 0+56
INDIRI4
MULI4
ASGNI4
line 257
;255:
;256:	// see if the score is higher for this one
;257:	newHigh = (newInfo.redScore > newInfo.blueScore && newInfo.score > oldInfo.score);
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $253
ADDRLP4 0
INDIRI4
ADDRLP4 1096
INDIRI4
LEI4 $253
ADDRLP4 1424
CNSTI4 1
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $253
ADDRLP4 1424
CNSTI4 0
ASGNI4
LABELV $254
ADDRLP4 1088
ADDRLP4 1424
INDIRI4
ASGNI4
line 259
;258:
;259:	if  (newHigh) {
ADDRLP4 1088
INDIRI4
CNSTI4 0
EQI4 $255
line 261
;260:		// if so write out the new one
;261:		uiInfo.newHighScoreTime = uiInfo.uiDC.realTime + 20000;
ADDRGP4 uiInfo+11808
ADDRGP4 uiInfo+232
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 262
;262:		if (trap_FS_FOpenFile(fileName, &f, FS_WRITE) >= 0) {
ADDRLP4 1228
ARGP4
ADDRLP4 1092
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1428
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 1428
INDIRI4
CNSTI4 0
LTI4 $259
line 263
;263:			size = sizeof(postGameInfo_t);
ADDRLP4 1296
CNSTI4 64
ASGNI4
line 264
;264:			trap_FS_Write(&size, sizeof(int), f);
ADDRLP4 1296
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 265
;265:			trap_FS_Write(&newInfo, sizeof(postGameInfo_t), f);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 266
;266:			trap_FS_FCloseFile(f);
ADDRLP4 1092
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 267
;267:		}
LABELV $259
line 268
;268:	}
LABELV $255
line 270
;269:
;270:	if (newInfo.time < oldInfo.time) {
ADDRLP4 0+44
INDIRI4
ADDRLP4 1096+44
INDIRI4
GEI4 $261
line 271
;271:		uiInfo.newBestTime = uiInfo.uiDC.realTime + 20000;
ADDRGP4 uiInfo+11812
ADDRGP4 uiInfo+232
INDIRI4
CNSTI4 20000
ADDI4
ASGNI4
line 272
;272:	}
LABELV $261
line 275
;273: 
;274:	// put back all the ui overrides
;275:	trap_Cvar_Set("capturelimit", UI_Cvar_VariableString("ui_saveCaptureLimit"));
ADDRGP4 $268
ARGP4
ADDRLP4 1428
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $267
ARGP4
ADDRLP4 1428
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 276
;276:	trap_Cvar_Set("fraglimit", UI_Cvar_VariableString("ui_saveFragLimit"));
ADDRGP4 $270
ARGP4
ADDRLP4 1432
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $269
ARGP4
ADDRLP4 1432
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 277
;277:	trap_Cvar_Set("duel_fraglimit", UI_Cvar_VariableString("ui_saveDuelLimit"));
ADDRGP4 $272
ARGP4
ADDRLP4 1436
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $271
ARGP4
ADDRLP4 1436
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 278
;278:	trap_Cvar_Set("cg_drawTimer", UI_Cvar_VariableString("ui_drawTimer"));
ADDRGP4 $274
ARGP4
ADDRLP4 1440
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $273
ARGP4
ADDRLP4 1440
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 279
;279:	trap_Cvar_Set("g_doWarmup", UI_Cvar_VariableString("ui_doWarmup"));
ADDRGP4 $276
ARGP4
ADDRLP4 1444
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $275
ARGP4
ADDRLP4 1444
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 280
;280:	trap_Cvar_Set("g_Warmup", UI_Cvar_VariableString("ui_Warmup"));
ADDRGP4 $278
ARGP4
ADDRLP4 1448
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $277
ARGP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 281
;281:	trap_Cvar_Set("sv_pure", UI_Cvar_VariableString("ui_pure"));
ADDRGP4 $280
ARGP4
ADDRLP4 1452
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $279
ARGP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 282
;282:	trap_Cvar_Set("g_friendlyFire", UI_Cvar_VariableString("ui_friendlyFire"));
ADDRGP4 $282
ARGP4
ADDRLP4 1456
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 $281
ARGP4
ADDRLP4 1456
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 284
;283:
;284:	UI_SetBestScores(&newInfo, qtrue);
ADDRLP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 UI_SetBestScores
CALLV
pop
line 285
;285:	UI_ShowPostGame(newHigh);
ADDRLP4 1088
INDIRI4
ARGI4
ADDRGP4 UI_ShowPostGame
CALLV
pop
line 288
;286:
;287:
;288:}
LABELV $204
endproc UI_CalcPostGameStats 1460 20
export UI_ConsoleCommand
proc UI_ConsoleCommand 172 12
line 296
;289:
;290:
;291:/*
;292:=================
;293:UI_ConsoleCommand
;294:=================
;295:*/
;296:qboolean UI_ConsoleCommand( int realTime ) {
line 299
;297:	char	*cmd;
;298:
;299:	uiInfo.uiDC.frameTime = realTime - uiInfo.uiDC.realTime;
ADDRGP4 uiInfo+236
ADDRFP4 0
INDIRI4
ADDRGP4 uiInfo+232
INDIRI4
SUBI4
ASGNI4
line 300
;300:	uiInfo.uiDC.realTime = realTime;
ADDRGP4 uiInfo+232
ADDRFP4 0
INDIRI4
ASGNI4
line 302
;301:
;302:	cmd = UI_Argv( 0 );
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 307
;303:
;304:	// ensure minimum menu data is available
;305:	//Menu_Cache();
;306:
;307:	if ( Q_stricmp (cmd, "ui_test") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $287
line 308
;308:		UI_ShowPostGame(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_ShowPostGame
CALLV
pop
line 309
;309:	}
LABELV $287
line 311
;310:
;311:	if ( Q_stricmp (cmd, "ui_report") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $290
line 312
;312:		UI_Report();
ADDRGP4 UI_Report
CALLV
pop
line 313
;313:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $290
line 316
;314:	}
;315:	
;316:	if ( Q_stricmp (cmd, "ui_load") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $293
line 317
;317:		UI_Load();
ADDRGP4 UI_Load
CALLV
pop
line 318
;318:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $293
line 321
;319:	}
;320:
;321:	if ( Q_stricmp (cmd, "ui_openmenu" ) == 0 ) 
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $296
line 322
;322:	{
line 323
;323:		if ( trap_Cvar_VariableValue ( "developer" ) )
ADDRGP4 $301
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
EQF4 $299
line 324
;324:		{
line 325
;325:			Menus_OpenByName ( UI_Argv(1) );
CNSTI4 1
ARGI4
ADDRLP4 28
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 Menus_OpenByName
CALLV
pop
line 326
;326:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $299
line 328
;327:		}
;328:	}
LABELV $296
line 330
;329:
;330:	if ( Q_stricmp (cmd, "remapShader") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $302
line 331
;331:		if (trap_Argc() == 4) {
ADDRLP4 28
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 4
NEI4 $305
line 334
;332:			char shader1[MAX_QPATH];
;333:			char shader2[MAX_QPATH];
;334:			Q_strncpyz(shader1, UI_Argv(1), sizeof(shader1));
CNSTI4 1
ARGI4
ADDRLP4 160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 32
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 335
;335:			Q_strncpyz(shader2, UI_Argv(2), sizeof(shader2));
CNSTI4 2
ARGI4
ADDRLP4 164
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 96
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 336
;336:			trap_R_RemapShader(shader1, shader2, UI_Argv(3));
CNSTI4 3
ARGI4
ADDRLP4 168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 32
ARGP4
ADDRLP4 96
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRGP4 trap_R_RemapShader
CALLV
pop
line 337
;337:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $305
line 339
;338:		}
;339:	}
LABELV $302
line 341
;340:
;341:	if ( Q_stricmp (cmd, "postgame") == 0 ) {
ADDRLP4 0
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
NEI4 $307
line 342
;342:		UI_CalcPostGameStats();
ADDRGP4 UI_CalcPostGameStats
CALLV
pop
line 343
;343:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $307
line 346
;344:	}
;345:
;346:	if ( Q_stricmp (cmd, "ui_cache") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $310
line 347
;347:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 348
;348:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $310
line 351
;349:	}
;350:
;351:	if ( Q_stricmp (cmd, "ui_teamOrders") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $315
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $313
line 353
;352:		//UI_TeamOrdersMenu_f();
;353:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $313
line 357
;354:	}
;355:
;356:
;357:	if ( Q_stricmp (cmd, "ui_cdkey") == 0 ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $318
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $316
line 359
;358:		//UI_CDKeyMenu_f();
;359:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $283
JUMPV
LABELV $316
line 362
;360:	}
;361:
;362:	return qfalse;
CNSTI4 0
RETI4
LABELV $283
endproc UI_ConsoleCommand 172 12
export UI_Shutdown
proc UI_Shutdown 0 0
line 370
;363:}
;364:
;365:/*
;366:=================
;367:UI_Shutdown
;368:=================
;369:*/
;370:void UI_Shutdown( void ) {
line 371
;371:}
LABELV $319
endproc UI_Shutdown 0 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 16 36
line 374
;372:
;373:
;374:void UI_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
line 377
;375:	qhandle_t	hShader;
;376:
;377:	hShader = trap_R_RegisterShaderNoMip( picname );
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 378
;378:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 379
;379:}
LABELV $320
endproc UI_DrawNamedPic 16 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 381
;380:
;381:void UI_DrawHandlePic( float x, float y, float w, float h, qhandle_t hShader ) {
line 387
;382:	float	s0;
;383:	float	s1;
;384:	float	t0;
;385:	float	t1;
;386:
;387:	if( w < 0 ) {	// flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $322
line 388
;388:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 389
;389:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 390
;390:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 391
;391:	}
ADDRGP4 $323
JUMPV
LABELV $322
line 392
;392:	else {
line 393
;393:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 394
;394:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 395
;395:	}
LABELV $323
line 397
;396:
;397:	if( h < 0 ) {	// flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $324
line 398
;398:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 399
;399:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 400
;400:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 401
;401:	}
ADDRGP4 $325
JUMPV
LABELV $324
line 402
;402:	else {
line 403
;403:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 404
;404:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 405
;405:	}
LABELV $325
line 407
;406:	
;407:	trap_R_DrawStretchPic( x, y, w, h, s0, t0, s1, t1, hShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 408
;408:}
LABELV $321
endproc UI_DrawHandlePic 16 36
export UI_FillRect
proc UI_FillRect 4 36
line 417
;409:
;410:/*
;411:================
;412:UI_FillRect
;413:
;414:Coordinates are 640*480 virtual values
;415:=================
;416:*/
;417:void UI_FillRect( float x, float y, float width, float height, const float *color ) {
line 418
;418:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 420
;419:
;420:	trap_R_DrawStretchPic( x, y, width, height, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11792
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 422
;421:
;422:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 423
;423:}
LABELV $326
endproc UI_FillRect 4 36
export UI_DrawSides
proc UI_DrawSides 12 36
line 425
;424:
;425:void UI_DrawSides(float x, float y, float w, float h) {
line 426
;426:	trap_R_DrawStretchPic( x, y, 1, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11792
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 427
;427:	trap_R_DrawStretchPic( x + w - 1, y, 1, h, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+11792
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 428
;428:}
LABELV $328
endproc UI_DrawSides 12 36
export UI_DrawTopBottom
proc UI_DrawTopBottom 12 36
line 430
;429:
;430:void UI_DrawTopBottom(float x, float y, float w, float h) {
line 431
;431:	trap_R_DrawStretchPic( x, y, w, 1, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRGP4 uiInfo+11792
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 432
;432:	trap_R_DrawStretchPic( x, y + h - 1, w, 1, 0, 0, 0, 0, uiInfo.uiDC.whiteShader );
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRGP4 uiInfo+11792
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 433
;433:}
LABELV $331
endproc UI_DrawTopBottom 12 36
export UI_DrawRect
proc UI_DrawRect 0 16
line 441
;434:/*
;435:================
;436:UI_DrawRect
;437:
;438:Coordinates are 640*480 virtual values
;439:=================
;440:*/
;441:void UI_DrawRect( float x, float y, float width, float height, const float *color ) {
line 442
;442:	trap_R_SetColor( color );
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 444
;443:
;444:  UI_DrawTopBottom(x, y, width, height);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 UI_DrawTopBottom
CALLV
pop
line 445
;445:  UI_DrawSides(x, y, width, height);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRGP4 UI_DrawSides
CALLV
pop
line 447
;446:
;447:	trap_R_SetColor( NULL );
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 448
;448:}
LABELV $334
endproc UI_DrawRect 0 16
export UI_SetColor
proc UI_SetColor 0 4
line 450
;449:
;450:void UI_SetColor( const float *rgba ) {
line 451
;451:	trap_R_SetColor( rgba );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 452
;452:}
LABELV $335
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 454
;453:
;454:void UI_UpdateScreen( void ) {
line 455
;455:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 456
;456:}
LABELV $336
endproc UI_UpdateScreen 0 0
export UI_DrawTextBox
proc UI_DrawTextBox 24 20
line 460
;457:
;458:
;459:void UI_DrawTextBox (int x, int y, int width, int lines)
;460:{
line 461
;461:	UI_FillRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorBlack );
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 4
CNSTI4 4
ASGNI4
ADDRLP4 8
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LSHI4
ADDRLP4 8
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 462
;462:	UI_DrawRect( x + BIGCHAR_WIDTH/2, y + BIGCHAR_HEIGHT/2, ( width + 1 ) * BIGCHAR_WIDTH, ( lines + 1 ) * BIGCHAR_HEIGHT, colorWhite );
ADDRLP4 12
CNSTI4 8
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 16
CNSTI4 4
ASGNI4
ADDRLP4 20
CNSTI4 16
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LSHI4
ADDRLP4 20
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 463
;463:}
LABELV $337
endproc UI_DrawTextBox 24 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 466
;464:
;465:qboolean UI_CursorInRect (int x, int y, int width, int height)
;466:{
line 467
;467:	if (uiInfo.uiDC.cursorx < x ||
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uiInfo+240
INDIRI4
ADDRLP4 0
INDIRI4
LTI4 $347
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uiInfo+244
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $347
ADDRGP4 uiInfo+240
INDIRI4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
GTI4 $347
ADDRGP4 uiInfo+244
INDIRI4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
LEI4 $339
LABELV $347
line 471
;468:		uiInfo.uiDC.cursory < y ||
;469:		uiInfo.uiDC.cursorx > x+width ||
;470:		uiInfo.uiDC.cursory > y+height)
;471:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $338
JUMPV
LABELV $339
line 473
;472:
;473:	return qtrue;
CNSTI4 1
RETI4
LABELV $338
endproc UI_CursorInRect 8 0
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetBotNameByNumber
import UI_LoadBots
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_G2API_SetBoneAngles
import trap_R_RemapShader
import trap_RealTime
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_S_StartBackgroundTrack
import trap_S_StopBackgroundTrack
import trap_AnyLanguage_ReadCharFromString
import trap_R_Font_DrawString
import trap_R_Font_HeightPixels
import trap_R_Font_StrLenChars
import trap_R_Font_StrLenPixels
import trap_R_RegisterFont
import trap_MemoryRemaining
import trap_LAN_CompareServers
import trap_LAN_ServerStatus
import trap_LAN_ResetPings
import trap_LAN_RemoveServer
import trap_LAN_AddServer
import trap_LAN_UpdateVisiblePings
import trap_LAN_ServerIsVisible
import trap_LAN_MarkServerVisible
import trap_LAN_SaveCachedServers
import trap_LAN_LoadCachedServers
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerPing
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
bss
export m_entersound
align 4
LABELV m_entersound
skip 4
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Init
import uiInfo
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import UI_LoadForceConfig_List
import UI_LoadArenas
import UI_ShowPostGame
import UI_AdjustTimeByGame
import _UI_SetActiveMenu
import UI_LoadMenus
import UI_Load
import UI_Report
import UI_FeederSelection
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_serverStatusTimeOut
import ui_bigFont
import ui_smallFont
import ui_scoreTime
import ui_scoreShutoutBonus
import ui_scoreSkillBonus
import ui_scoreTimeBonus
import ui_scoreBase
import ui_scoreTeam
import ui_scorePerfect
import ui_scoreScore
import ui_scoreGauntlets
import ui_scoreAssists
import ui_scoreDefends
import ui_scoreExcellents
import ui_scoreImpressives
import ui_scoreAccuracy
import ui_singlePlayerActive
import ui_lastServerRefresh_3
import ui_lastServerRefresh_2
import ui_lastServerRefresh_1
import ui_lastServerRefresh_0
import ui_selectedPlayerName
import ui_selectedPlayer
import ui_currentOpponent
import ui_mapIndex
import ui_currentNetMap
import ui_currentMap
import ui_currentTier
import ui_menuFiles
import ui_opponentName
import ui_dedicated
import ui_serverFilterType
import ui_netSource
import ui_joinGameType
import ui_actualNetGameType
import ui_netGameType
import ui_gameType
import ui_fragLimit
import ui_captureLimit
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_selectedModelIndex
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import trap_SP_GetStringTextString
import trap_SP_Register
import trap_SP_RegisterServer
import trap_PC_RemoveAllGlobalDefines
import trap_PC_LoadGlobalDefines
import trap_PC_SourceFileAndLine
import trap_PC_ReadToken
import trap_PC_FreeSource
import trap_PC_LoadSource
import trap_PC_AddGlobalDefine
import Controls_SetDefaults
import Controls_SetConfig
import Controls_GetConfig
import UI_OutOfMemory
import UI_InitMemory
import UI_Alloc
import Display_CacheAll
import Menu_SetFeederSelection
import Menu_Paint
import Menus_CloseAll
import LerpColor
import Display_HandleKey
import Menus_CloseByName
import Menus_ShowByName
import Menus_FindByName
import Menus_OpenByName
import Display_KeyBindPending
import Display_CursorType
import Display_MouseMove
import Display_CaptureItem
import Display_GetContext
import Menus_Activate
import Menus_AnyFullScreenVisible
import Menu_Reset
import Menus_ActivateByName
import Menu_PaintAll
import Menu_New
import Menu_Count
import PC_Script_Parse
import PC_String_Parse
import PC_Rect_Parse
import PC_Int_Parse
import PC_Color_Parse
import PC_Float_Parse
import Script_Parse
import String_Parse
import Rect_Parse
import Int_Parse
import Color_Parse
import Float_Parse
import Menu_ScrollFeeder
import Menu_HandleMouseMove
import Menu_HandleKey
import Menu_GetFocused
import Menu_PostParse
import Item_Init
import Menu_Init
import Display_ExpandMacros
import Init_Display
import String_Report
import String_Init
import String_Alloc
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
LABELV $318
char 1 117
char 1 105
char 1 95
char 1 99
char 1 100
char 1 107
char 1 101
char 1 121
char 1 0
align 1
LABELV $315
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 97
char 1 109
char 1 79
char 1 114
char 1 100
char 1 101
char 1 114
char 1 115
char 1 0
align 1
LABELV $312
char 1 117
char 1 105
char 1 95
char 1 99
char 1 97
char 1 99
char 1 104
char 1 101
char 1 0
align 1
LABELV $309
char 1 112
char 1 111
char 1 115
char 1 116
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $304
char 1 114
char 1 101
char 1 109
char 1 97
char 1 112
char 1 83
char 1 104
char 1 97
char 1 100
char 1 101
char 1 114
char 1 0
align 1
LABELV $301
char 1 100
char 1 101
char 1 118
char 1 101
char 1 108
char 1 111
char 1 112
char 1 101
char 1 114
char 1 0
align 1
LABELV $298
char 1 117
char 1 105
char 1 95
char 1 111
char 1 112
char 1 101
char 1 110
char 1 109
char 1 101
char 1 110
char 1 117
char 1 0
align 1
LABELV $295
char 1 117
char 1 105
char 1 95
char 1 108
char 1 111
char 1 97
char 1 100
char 1 0
align 1
LABELV $292
char 1 117
char 1 105
char 1 95
char 1 114
char 1 101
char 1 112
char 1 111
char 1 114
char 1 116
char 1 0
align 1
LABELV $289
char 1 117
char 1 105
char 1 95
char 1 116
char 1 101
char 1 115
char 1 116
char 1 0
align 1
LABELV $282
char 1 117
char 1 105
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $281
char 1 103
char 1 95
char 1 102
char 1 114
char 1 105
char 1 101
char 1 110
char 1 100
char 1 108
char 1 121
char 1 70
char 1 105
char 1 114
char 1 101
char 1 0
align 1
LABELV $280
char 1 117
char 1 105
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $279
char 1 115
char 1 118
char 1 95
char 1 112
char 1 117
char 1 114
char 1 101
char 1 0
align 1
LABELV $278
char 1 117
char 1 105
char 1 95
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $277
char 1 103
char 1 95
char 1 87
char 1 97
char 1 114
char 1 109
char 1 117
char 1 112
char 1 0
align 1
LABELV $276
char 1 117
char 1 105
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
LABELV $275
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
LABELV $274
char 1 117
char 1 105
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 84
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $273
char 1 99
char 1 103
char 1 95
char 1 100
char 1 114
char 1 97
char 1 119
char 1 84
char 1 105
char 1 109
char 1 101
char 1 114
char 1 0
align 1
LABELV $272
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 68
char 1 117
char 1 101
char 1 108
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $271
char 1 100
char 1 117
char 1 101
char 1 108
char 1 95
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
LABELV $270
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 70
char 1 114
char 1 97
char 1 103
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $269
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
LABELV $268
char 1 117
char 1 105
char 1 95
char 1 115
char 1 97
char 1 118
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 76
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $267
char 1 99
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 108
char 1 105
char 1 109
char 1 105
char 1 116
char 1 0
align 1
LABELV $241
char 1 103
char 1 95
char 1 115
char 1 112
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 0
align 1
LABELV $223
char 1 117
char 1 105
char 1 95
char 1 109
char 1 97
char 1 116
char 1 99
char 1 104
char 1 83
char 1 116
char 1 97
char 1 114
char 1 116
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $206
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
LABELV $205
char 1 109
char 1 97
char 1 112
char 1 110
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $202
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $193
char 1 103
char 1 97
char 1 109
char 1 101
char 1 115
char 1 47
char 1 37
char 1 115
char 1 0
align 1
LABELV $184
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $183
char 1 103
char 1 97
char 1 109
char 1 101
char 1 115
char 1 0
align 1
LABELV $177
char 1 112
char 1 114
char 1 111
char 1 116
char 1 111
char 1 99
char 1 111
char 1 108
char 1 0
align 1
LABELV $176
char 1 100
char 1 101
char 1 109
char 1 111
char 1 115
char 1 47
char 1 37
char 1 115
char 1 95
char 1 37
char 1 100
char 1 46
char 1 100
char 1 109
char 1 95
char 1 37
char 1 100
char 1 0
align 1
LABELV $171
char 1 103
char 1 97
char 1 109
char 1 101
char 1 115
char 1 47
char 1 37
char 1 115
char 1 95
char 1 37
char 1 105
char 1 46
char 1 103
char 1 97
char 1 109
char 1 101
char 1 0
align 1
LABELV $169
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 50
char 1 0
align 1
LABELV $168
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 50
char 1 0
align 1
LABELV $167
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 104
char 1 117
char 1 116
char 1 111
char 1 117
char 1 116
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 50
char 1 0
align 1
LABELV $166
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 50
char 1 0
align 1
LABELV $165
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 50
char 1 0
align 1
LABELV $164
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 50
char 1 0
align 1
LABELV $163
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 50
char 1 0
align 1
LABELV $162
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 80
char 1 101
char 1 114
char 1 102
char 1 101
char 1 99
char 1 116
char 1 50
char 1 0
align 1
LABELV $161
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 50
char 1 0
align 1
LABELV $160
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 71
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 115
char 1 50
char 1 0
align 1
LABELV $159
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 115
char 1 50
char 1 0
align 1
LABELV $158
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 68
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 115
char 1 50
char 1 0
align 1
LABELV $157
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 69
char 1 120
char 1 99
char 1 101
char 1 108
char 1 108
char 1 101
char 1 110
char 1 116
char 1 115
char 1 50
char 1 0
align 1
LABELV $156
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 73
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 105
char 1 118
char 1 101
char 1 115
char 1 50
char 1 0
align 1
LABELV $155
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 99
char 1 99
char 1 117
char 1 114
char 1 97
char 1 99
char 1 121
char 1 50
char 1 0
align 1
LABELV $152
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 67
char 1 97
char 1 112
char 1 116
char 1 117
char 1 114
char 1 101
char 1 115
char 1 0
align 1
LABELV $151
char 1 37
char 1 48
char 1 50
char 1 105
char 1 58
char 1 37
char 1 48
char 1 50
char 1 105
char 1 0
align 1
LABELV $150
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 0
align 1
LABELV $149
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 104
char 1 117
char 1 116
char 1 111
char 1 117
char 1 116
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $148
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 107
char 1 105
char 1 108
char 1 108
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $147
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 105
char 1 109
char 1 101
char 1 66
char 1 111
char 1 110
char 1 117
char 1 115
char 1 0
align 1
LABELV $146
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 66
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $145
char 1 37
char 1 105
char 1 32
char 1 116
char 1 111
char 1 32
char 1 37
char 1 105
char 1 0
align 1
LABELV $144
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 84
char 1 101
char 1 97
char 1 109
char 1 0
align 1
LABELV $143
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 80
char 1 101
char 1 114
char 1 102
char 1 101
char 1 99
char 1 116
char 1 0
align 1
LABELV $142
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 83
char 1 99
char 1 111
char 1 114
char 1 101
char 1 0
align 1
LABELV $141
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 71
char 1 97
char 1 117
char 1 110
char 1 116
char 1 108
char 1 101
char 1 116
char 1 115
char 1 0
align 1
LABELV $140
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 115
char 1 115
char 1 105
char 1 115
char 1 116
char 1 115
char 1 0
align 1
LABELV $139
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 68
char 1 101
char 1 102
char 1 101
char 1 110
char 1 100
char 1 115
char 1 0
align 1
LABELV $138
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 69
char 1 120
char 1 99
char 1 101
char 1 108
char 1 108
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $137
char 1 37
char 1 105
char 1 0
align 1
LABELV $136
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 73
char 1 109
char 1 112
char 1 114
char 1 101
char 1 115
char 1 115
char 1 105
char 1 118
char 1 101
char 1 115
char 1 0
align 1
LABELV $135
char 1 37
char 1 105
char 1 37
char 1 37
char 1 0
align 1
LABELV $134
char 1 117
char 1 105
char 1 95
char 1 115
char 1 99
char 1 111
char 1 114
char 1 101
char 1 65
char 1 99
char 1 99
char 1 117
char 1 114
char 1 97
char 1 99
char 1 121
char 1 0
align 1
LABELV $128
char 1 100
char 1 49
char 1 10
char 1 0
align 1
LABELV $119
char 1 37
char 1 115
char 1 0
