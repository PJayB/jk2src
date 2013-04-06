export G_TestEntityPosition
code
proc G_TestEntityPosition 1104 28
file "../g_mover.c"
line 33
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:
;7:
;8:/*
;9:===============================================================================
;10:
;11:PUSHMOVE
;12:
;13:===============================================================================
;14:*/
;15:
;16:void MatchTeam( gentity_t *teamLeader, int moverState, int time );
;17:
;18:typedef struct {
;19:	gentity_t	*ent;
;20:	vec3_t	origin;
;21:	vec3_t	angles;
;22:	float	deltayaw;
;23:} pushed_t;
;24:pushed_t	pushed[MAX_GENTITIES], *pushed_p;
;25:
;26:
;27:/*
;28:============
;29:G_TestEntityPosition
;30:
;31:============
;32:*/
;33:gentity_t	*G_TestEntityPosition( gentity_t *ent ) {
line 37
;34:	trace_t	tr;
;35:	int		mask;
;36:
;37:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 0
EQI4 $80
line 38
;38:		mask = ent->clipmask;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 39
;39:	} else {
ADDRGP4 $81
JUMPV
LABELV $80
line 40
;40:		mask = MASK_SOLID;
ADDRLP4 1080
CNSTI4 1
ASGNI4
line 41
;41:	}
LABELV $81
line 42
;42:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $82
line 44
;43:		vec3_t vMax;
;44:		VectorCopy(ent->r.maxs, vMax);
ADDRLP4 1084
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 45
;45:		if (vMax[2] < 1)
ADDRLP4 1084+8
INDIRF4
CNSTF4 1065353216
GEF4 $84
line 46
;46:		{
line 47
;47:			vMax[2] = 1;
ADDRLP4 1084+8
CNSTF4 1065353216
ASGNF4
line 48
;48:		}
LABELV $84
line 49
;49:		trap_Trace( &tr, ent->client->ps.origin, ent->r.mins, vMax, ent->client->ps.origin, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1100
ADDRLP4 1096
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1084
ARGP4
ADDRLP4 1100
INDIRP4
ARGP4
ADDRLP4 1096
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 50
;50:	} else {
ADDRGP4 $83
JUMPV
LABELV $82
line 51
;51:		trap_Trace( &tr, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, ent->s.pos.trBase, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 1084
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
ADDRLP4 1084
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 1084
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 1088
INDIRP4
ARGP4
ADDRLP4 1084
INDIRP4
INDIRI4
ARGI4
ADDRLP4 1080
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 52
;52:	}
LABELV $83
line 54
;53:	
;54:	if (tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $88
line 55
;55:		return &g_entities[ tr.entityNum ];
CNSTI4 828
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $79
JUMPV
LABELV $88
line 57
;56:		
;57:	return NULL;
CNSTP4 0
RETP4
LABELV $79
endproc G_TestEntityPosition 1104 28
export G_CreateRotationMatrix
proc G_CreateRotationMatrix 4 16
line 65
;58:}
;59:
;60:/*
;61:================
;62:G_CreateRotationMatrix
;63:================
;64:*/
;65:void G_CreateRotationMatrix(vec3_t angles, vec3_t matrix[3]) {
line 66
;66:	AngleVectors(angles, matrix[0], matrix[1], matrix[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 67
;67:	VectorInverse(matrix[1]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 68
;68:}
LABELV $92
endproc G_CreateRotationMatrix 4 16
export G_TransposeMatrix
proc G_TransposeMatrix 24 0
line 75
;69:
;70:/*
;71:================
;72:G_TransposeMatrix
;73:================
;74:*/
;75:void G_TransposeMatrix(vec3_t matrix[3], vec3_t transpose[3]) {
line 77
;76:	int i, j;
;77:	for (i = 0; i < 3; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $94
line 78
;78:		for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $98
line 79
;79:			transpose[i][j] = matrix[j][i];
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRF4
ASGNF4
line 80
;80:		}
LABELV $99
line 78
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $98
line 81
;81:	}
LABELV $95
line 77
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $94
line 82
;82:}
LABELV $93
endproc G_TransposeMatrix 24 0
export G_RotatePoint
proc G_RotatePoint 24 0
line 89
;83:
;84:/*
;85:================
;86:G_RotatePoint
;87:================
;88:*/
;89:void G_RotatePoint(vec3_t point, vec3_t matrix[3]) {
line 92
;90:	vec3_t tvec;
;91:
;92:	VectorCopy(point, tvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 93
;93:	point[0] = DotProduct(matrix[0], tvec);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 94
;94:	point[1] = DotProduct(matrix[1], tvec);
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 95
;95:	point[2] = DotProduct(matrix[2], tvec);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 96
;96:}
LABELV $102
endproc G_RotatePoint 24 0
export G_TryPushingEntity
proc G_TryPushingEntity 172 32
line 105
;97:
;98:/*
;99:==================
;100:G_TryPushingEntity
;101:
;102:Returns qfalse if the move is blocked
;103:==================
;104:*/
;105:qboolean	G_TryPushingEntity( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 112
;106:	vec3_t		matrix[3], transpose[3];
;107:	vec3_t		org, org2, move2;
;108:	gentity_t	*block;
;109:
;110:	// EF_MOVER_STOP will just stop when contacting another entity
;111:	// instead of pushing it, but entities can still ride on top of it
;112:	if ( ( pusher->s.eFlags & EF_MOVER_STOP ) && 
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $110
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
EQI4 $110
line 113
;113:		check->s.groundEntityNum != pusher->s.number ) {
line 114
;114:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $109
JUMPV
LABELV $110
line 118
;115:	}
;116:
;117:	// save off the old position
;118:	if (pushed_p > &pushed[MAX_GENTITIES]) {
ADDRGP4 pushed_p
INDIRP4
CVPU4 4
ADDRGP4 pushed+32768
CVPU4 4
LEU4 $112
line 119
;119:		G_Error( "pushed_p > &pushed[MAX_GENTITIES]" );
ADDRGP4 $115
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 120
;120:	}
LABELV $112
line 121
;121:	pushed_p->ent = check;
ADDRGP4 pushed_p
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 122
;122:	VectorCopy (check->s.pos.trBase, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 123
;123:	VectorCopy (check->s.apos.trBase, pushed_p->angles);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 124
;124:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
line 125
;125:		pushed_p->deltayaw = check->client->ps.delta_angles[YAW];
ADDRGP4 pushed_p
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 126
;126:		VectorCopy (check->client->ps.origin, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 127
;127:	}
LABELV $116
line 128
;128:	pushed_p++;
ADDRLP4 116
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 132
;129:
;130:	// try moving the contacted entity 
;131:	// figure movement due to the pusher's amove
;132:	G_CreateRotationMatrix( amove, transpose );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_CreateRotationMatrix
CALLV
pop
line 133
;133:	G_TransposeMatrix( transpose, matrix );
ADDRLP4 76
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_TransposeMatrix
CALLV
pop
line 134
;134:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 135
;135:		VectorSubtract (check->client->ps.origin, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 136
;136:	}
ADDRGP4 $119
JUMPV
LABELV $118
line 137
;137:	else {
line 138
;138:		VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 139
;139:	}
LABELV $119
line 140
;140:	VectorCopy( org, org2 );
ADDRLP4 24
ADDRLP4 12
INDIRB
ASGNB 12
line 141
;141:	G_RotatePoint( org2, matrix );
ADDRLP4 24
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_RotatePoint
CALLV
pop
line 142
;142:	VectorSubtract (org2, org, move2);
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 144
;143:	// add movement
;144:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 145
;145:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 146
;146:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $132
line 147
;147:		VectorAdd (check->client->ps.origin, move, check->client->ps.origin);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 148
;148:		VectorAdd (check->client->ps.origin, move2, check->client->ps.origin);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 150
;149:		// make sure the client's view rotates when on a rotating mover
;150:		check->client->ps.delta_angles[YAW] += ANGLE2SHORT(amove[YAW]);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 151
;151:	}
LABELV $132
line 154
;152:
;153:	// may have pushed them off an edge
;154:	if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $136
line 155
;155:		check->s.groundEntityNum = ENTITYNUM_NONE;//-1;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1023
ASGNI4
line 156
;156:	}
LABELV $136
line 158
;157:
;158:	block = G_TestEntityPosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 144
INDIRP4
ASGNP4
line 159
;159:	if (!block) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $138
line 161
;160:		// pushed ok
;161:		if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
line 162
;162:			VectorCopy( check->client->ps.origin, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 163
;163:		} else {
ADDRGP4 $141
JUMPV
LABELV $140
line 164
;164:			VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 165
;165:		}
LABELV $141
line 166
;166:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 167
;167:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $109
JUMPV
LABELV $138
line 170
;168:	}
;169:
;170:	if (check->takedamage && !check->client && check->s.weapon && check->r.ownerNum < MAX_CLIENTS &&
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
CNSTI4 0
ASGNI4
ADDRLP4 148
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $142
ADDRLP4 148
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
ADDRLP4 148
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
ADDRLP4 152
INDIRI4
EQI4 $142
ADDRLP4 148
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 32
GEI4 $142
ADDRLP4 148
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 500
GEI4 $142
line 172
;171:		check->health < 500)
;172:	{
line 173
;173:		if (check->health > 0)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
LEI4 $144
line 174
;174:		{
line 175
;175:			G_Damage(check, pusher, pusher, vec3_origin, check->r.currentOrigin, 999, 0, MOD_UNKNOWN);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRLP4 160
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 368
ADDP4
ARGP4
CNSTI4 999
ARGI4
ADDRLP4 164
CNSTI4 0
ASGNI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 176
;176:		}
LABELV $144
line 177
;177:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $109
JUMPV
LABELV $142
line 182
;178:	}
;179:	// if it is ok to leave in the old position, do it
;180:	// this is only relevent for riding entities, not pushed
;181:	// Sliding trapdoors can cause this.
;182:	VectorCopy( (pushed_p-1)->origin, check->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 183
;183:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $146
line 184
;184:		VectorCopy( (pushed_p-1)->origin, check->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 185
;185:	}
LABELV $146
line 186
;186:	VectorCopy( (pushed_p-1)->angles, check->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -16
ADDP4
INDIRB
ASGNB 12
line 187
;187:	block = G_TestEntityPosition (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 156
INDIRP4
ASGNP4
line 188
;188:	if ( !block ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
line 189
;189:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 -1
ASGNI4
line 190
;190:		pushed_p--;
ADDRLP4 160
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
line 191
;191:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $109
JUMPV
LABELV $148
line 195
;192:	}
;193:
;194:	// blocked
;195:	return qfalse;
CNSTI4 0
RETI4
LABELV $109
endproc G_TryPushingEntity 172 32
export G_MoverPush
proc G_MoverPush 4244 32
line 210
;196:}
;197:
;198:
;199:void G_ExplodeMissile( gentity_t *ent );
;200:
;201:/*
;202:============
;203:G_MoverPush
;204:
;205:Objects need to be moved back on a failed push,
;206:otherwise riders would continue to slide.
;207:If qfalse is returned, *obstacle will be the blocking entity
;208:============
;209:*/
;210:qboolean G_MoverPush( gentity_t *pusher, vec3_t move, vec3_t amove, gentity_t **obstacle ) {
line 219
;211:	int			i, e;
;212:	gentity_t	*check;
;213:	vec3_t		mins, maxs;
;214:	pushed_t	*p;
;215:	int			entityList[MAX_GENTITIES];
;216:	int			listedEntities;
;217:	vec3_t		totalMins, totalMaxs;
;218:
;219:	*obstacle = NULL;
ADDRFP4 12
INDIRP4
CNSTP4 0
ASGNP4
line 224
;220:
;221:
;222:	// mins/maxs are the bounds at the destination
;223:	// totalMins / totalMaxs are the bounds for the entire move
;224:	if ( pusher->r.currentAngles[0] || pusher->r.currentAngles[1] || pusher->r.currentAngles[2]
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
CNSTF4 0
ASGNF4
ADDRLP4 4164
INDIRP4
CNSTI4 380
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $157
ADDRLP4 4164
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $157
ADDRLP4 4164
INDIRP4
CNSTI4 388
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $157
ADDRLP4 4172
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $157
ADDRLP4 4172
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $157
ADDRLP4 4172
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
EQF4 $151
LABELV $157
line 225
;225:		|| amove[0] || amove[1] || amove[2] ) {
line 228
;226:		float		radius;
;227:
;228:		radius = RadiusFromBounds( pusher->r.mins, pusher->r.maxs );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 316
ADDP4
ARGP4
ADDRLP4 4180
INDIRP4
CNSTI4 328
ADDP4
ARGP4
ADDRLP4 4184
ADDRGP4 RadiusFromBounds
CALLF4
ASGNF4
ADDRLP4 4176
ADDRLP4 4184
INDIRF4
ASGNF4
line 229
;229:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $158
line 230
;230:			mins[i] = pusher->r.currentOrigin[i] + move[i] - radius;
ADDRLP4 4188
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4188
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4188
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 4188
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
SUBF4
ASGNF4
line 231
;231:			maxs[i] = pusher->r.currentOrigin[i] + move[i] + radius;
ADDRLP4 4192
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4192
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4192
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDP4
INDIRF4
ADDRLP4 4192
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
ADDF4
ASGNF4
line 232
;232:			totalMins[i] = mins[i] - move[i];
ADDRLP4 4196
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4196
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4196
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 4196
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 233
;233:			totalMaxs[i] = maxs[i] - move[i];
ADDRLP4 4200
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4200
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4200
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ADDRLP4 4200
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 234
;234:		}
LABELV $159
line 229
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $158
line 235
;235:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 236
;236:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $162
line 237
;237:			mins[i] = pusher->r.absmin[i] + move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 238
;238:			maxs[i] = pusher->r.absmax[i] + move[i];
ADDRLP4 4180
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 239
;239:		}
LABELV $163
line 236
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $162
line 241
;240:
;241:		VectorCopy( pusher->r.absmin, totalMins );
ADDRLP4 4140
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRB
ASGNB 12
line 242
;242:		VectorCopy( pusher->r.absmax, totalMaxs );
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRB
ASGNB 12
line 243
;243:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $166
line 244
;244:			if ( move[i] > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $170
line 245
;245:				totalMaxs[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4152
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 246
;246:			} else {
ADDRGP4 $171
JUMPV
LABELV $170
line 247
;247:				totalMins[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4140
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 248
;248:			}
LABELV $171
line 249
;249:		}
LABELV $167
line 243
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $166
line 250
;250:	}
LABELV $152
line 253
;251:
;252:	// unlink the pusher so we don't get it in the entityList
;253:	trap_UnlinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 255
;254:
;255:	listedEntities = trap_EntitiesInBox( totalMins, totalMaxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4176
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4176
INDIRI4
ASGNI4
line 258
;256:
;257:	// move the pusher to it's final position
;258:	VectorAdd( pusher->r.currentOrigin, move, pusher->r.currentOrigin );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 372
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 259
;259:	VectorAdd( pusher->r.currentAngles, amove, pusher->r.currentAngles );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 380
ADDP4
ASGNP4
ADDRLP4 4192
INDIRP4
ADDRLP4 4192
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4196
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
ASGNP4
ADDRLP4 4196
INDIRP4
ADDRLP4 4196
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4200
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
ASGNP4
ADDRLP4 4200
INDIRP4
ADDRLP4 4200
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 260
;260:	trap_LinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 263
;261:
;262:	// see if any solid entities are inside the final position
;263:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $175
JUMPV
LABELV $172
line 264
;264:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 8
CNSTI4 828
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 267
;265:
;266:		// only push items and players
;267:		if ( /*check->s.eType != ET_ITEM &&*/ check->s.eType != ET_PLAYER && !check->physicsObject ) {
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $176
ADDRLP4 8
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
NEI4 $176
line 268
;268:			continue;
ADDRGP4 $173
JUMPV
LABELV $176
line 272
;269:		}
;270:
;271:		// if the entity is standing on the pusher, it will definitely be moved
;272:		if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRLP4 8
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $178
line 274
;273:			// see if the ent needs to be tested
;274:			if ( check->r.absmin[0] >= maxs[0]
ADDRLP4 8
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $190
ADDRLP4 8
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
GEF4 $190
ADDRLP4 8
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
GEF4 $190
ADDRLP4 8
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $190
ADDRLP4 8
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
LEF4 $190
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
GTF4 $180
LABELV $190
line 279
;275:			|| check->r.absmin[1] >= maxs[1]
;276:			|| check->r.absmin[2] >= maxs[2]
;277:			|| check->r.absmax[0] <= mins[0]
;278:			|| check->r.absmax[1] <= mins[1]
;279:			|| check->r.absmax[2] <= mins[2] ) {
line 280
;280:				continue;
ADDRGP4 $173
JUMPV
LABELV $180
line 284
;281:			}
;282:			// see if the ent's bbox is inside the pusher's final position
;283:			// this does allow a fast moving object to pass through a thin entity...
;284:			if (!G_TestEntityPosition (check)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4212
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 4212
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $191
line 285
;285:				continue;
ADDRGP4 $173
JUMPV
LABELV $191
line 287
;286:			}
;287:		}
LABELV $178
line 290
;288:
;289:		// the entity needs to be pushed
;290:		if ( G_TryPushingEntity( check, pusher, move, amove ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4208
ADDRGP4 G_TryPushingEntity
CALLI4
ASGNI4
ADDRLP4 4208
INDIRI4
CNSTI4 0
EQI4 $193
line 291
;291:			continue;
ADDRGP4 $173
JUMPV
LABELV $193
line 294
;292:		}
;293:
;294:		if (pusher->damage && check->client && (pusher->spawnflags & 32))
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
CNSTI4 0
ASGNI4
ADDRLP4 4212
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDRLP4 4216
INDIRI4
EQI4 $195
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $195
ADDRLP4 4212
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 32
BANDI4
ADDRLP4 4216
INDIRI4
EQI4 $195
line 295
;295:		{
line 296
;296:			G_Damage( check, pusher, pusher, NULL, NULL, pusher->damage, 0, MOD_CRUSH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRLP4 4224
CNSTP4 0
ASGNP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4220
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 297
;297:			continue;
ADDRGP4 $173
JUMPV
LABELV $195
line 303
;298:		}
;299:
;300:		// the move was blocked an entity
;301:
;302:		// bobbing entities are instant-kill and never get blocked
;303:		if ( pusher->s.pos.trType == TR_SINE || pusher->s.apos.trType == TR_SINE ) {
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
CNSTI4 4
ASGNI4
ADDRLP4 4220
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4224
INDIRI4
EQI4 $199
ADDRLP4 4220
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4224
INDIRI4
NEI4 $197
LABELV $199
line 304
;304:			G_Damage( check, pusher, pusher, NULL, NULL, 99999, 0, MOD_CRUSH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4228
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4232
CNSTP4 0
ASGNP4
ADDRLP4 4232
INDIRP4
ARGP4
ADDRLP4 4232
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 305
;305:			continue;
ADDRGP4 $173
JUMPV
LABELV $197
line 310
;306:		}
;307:
;308:		
;309:		// save off the obstacle so we can call the block function (crush, etc)
;310:		*obstacle = check;
ADDRFP4 12
INDIRP4
ADDRLP4 8
INDIRP4
ASGNP4
line 315
;311:
;312:		// move back any entities we already moved
;313:		// go backwards, so if the same entity was pushed
;314:		// twice, it goes back to the original position
;315:		for ( p=pushed_p-1 ; p>=pushed ; p-- ) {
ADDRLP4 0
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
ADDRGP4 $203
JUMPV
LABELV $200
line 316
;316:			VectorCopy (p->origin, p->ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 317
;317:			VectorCopy (p->angles, p->ent->s.apos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRB
ASGNB 12
line 318
;318:			if ( p->ent->client ) {
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
line 319
;319:				p->ent->client->ps.delta_angles[YAW] = p->deltayaw;
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 320
;320:				VectorCopy (p->origin, p->ent->client->ps.origin);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 321
;321:			}
LABELV $204
line 322
;322:			trap_LinkEntity (p->ent);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 323
;323:		}
LABELV $201
line 315
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
LABELV $203
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 pushed
CVPU4 4
GEU4 $200
line 324
;324:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $150
JUMPV
LABELV $173
line 263
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $175
ADDRLP4 12
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $172
line 327
;325:	}
;326:
;327:	return qtrue;
CNSTI4 1
RETI4
LABELV $150
endproc G_MoverPush 4244 32
export G_MoverTeam
proc G_MoverTeam 72 16
line 336
;328:}
;329:
;330:
;331:/*
;332:=================
;333:G_MoverTeam
;334:=================
;335:*/
;336:void G_MoverTeam( gentity_t *ent ) {
line 341
;337:	vec3_t		move, amove;
;338:	gentity_t	*part, *obstacle;
;339:	vec3_t		origin, angles;
;340:
;341:	obstacle = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 346
;342:
;343:	// make sure all team slaves can move before commiting
;344:	// any moves or calling any think functions
;345:	// if the move is blocked, all moved objects will be backed out
;346:	pushed_p = pushed;
ADDRGP4 pushed_p
ADDRGP4 pushed
ASGNP4
line 347
;347:	for (part = ent ; part ; part=part->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $210
JUMPV
LABELV $207
line 349
;348:		// get current position
;349:		BG_EvaluateTrajectory( &part->s.pos, level.time, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 350
;350:		BG_EvaluateTrajectory( &part->s.apos, level.time, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 351
;351:		VectorSubtract( origin, part->r.currentOrigin, move );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 372
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 376
ADDP4
INDIRF4
SUBF4
ASGNF4
line 352
;352:		VectorSubtract( angles, part->r.currentAngles, amove );
ADDRLP4 16
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRF4
SUBF4
ASGNF4
line 353
;353:		if ( !G_MoverPush( part, move, amove, &obstacle ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ADDRGP4 G_MoverPush
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $221
line 354
;354:			break;	// move was blocked
ADDRGP4 $209
JUMPV
LABELV $221
line 356
;355:		}
;356:	}
LABELV $208
line 347
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
LABELV $210
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $207
LABELV $209
line 358
;357:
;358:	if (part) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $223
line 360
;359:		// go back to the previous position
;360:		for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $228
JUMPV
LABELV $225
line 361
;361:			part->s.pos.trTime += level.time - level.previousTime;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ADDI4
ASGNI4
line 362
;362:			part->s.apos.trTime += level.time - level.previousTime;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ADDI4
ASGNI4
line 363
;363:			BG_EvaluateTrajectory( &part->s.pos, level.time, part->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 364
;364:			BG_EvaluateTrajectory( &part->s.apos, level.time, part->r.currentAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 380
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 365
;365:			trap_LinkEntity( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 366
;366:		}
LABELV $226
line 360
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
LABELV $228
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
line 369
;367:
;368:		// if the pusher has a "blocked" function, call it
;369:		if (ent->blocked) {
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 370
;370:			ent->blocked( ent, obstacle );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 644
ADDP4
INDIRP4
CALLV
pop
line 371
;371:		}
line 372
;372:		return;
ADDRGP4 $206
JUMPV
LABELV $223
line 376
;373:	}
;374:
;375:	// the move succeeded
;376:	for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $240
JUMPV
LABELV $237
line 378
;377:		// call the reached function if time is at or past end point
;378:		if ( part->s.pos.trType == TR_LINEAR_STOP ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $241
line 379
;379:			if ( level.time >= part->s.pos.trTime + part->s.pos.trDuration ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
LTI4 $243
line 380
;380:				if ( part->reached ) {
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $246
line 381
;381:					part->reached( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRP4
CALLV
pop
line 382
;382:				}
LABELV $246
line 383
;383:			}
LABELV $243
line 384
;384:		}
LABELV $241
line 385
;385:	}
LABELV $238
line 376
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
LABELV $240
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $237
line 386
;386:}
LABELV $206
endproc G_MoverTeam 72 16
export G_RunMover
proc G_RunMover 8 4
line 394
;387:
;388:/*
;389:================
;390:G_RunMover
;391:
;392:================
;393:*/
;394:void G_RunMover( gentity_t *ent ) {
line 397
;395:	// if not a team captain, don't do anything, because
;396:	// the captain will handle everything
;397:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $249
line 398
;398:		return;
ADDRGP4 $248
JUMPV
LABELV $249
line 402
;399:	}
;400:
;401:	// if stationary at one of the positions, don't move anything
;402:	if ( ent->s.pos.trType != TR_STATIONARY || ent->s.apos.trType != TR_STATIONARY ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $253
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $251
LABELV $253
line 403
;403:		G_MoverTeam( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_MoverTeam
CALLV
pop
line 404
;404:	}
LABELV $251
line 407
;405:
;406:	// check think function
;407:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 408
;408:}
LABELV $248
endproc G_RunMover 8 4
export SetMoverState
proc SetMoverState 56 12
line 425
;409:
;410:/*
;411:============================================================================
;412:
;413:GENERAL MOVERS
;414:
;415:Doors, plats, and buttons are all binary (two position) movers
;416:Pos1 is "at rest", pos2 is "activated"
;417:============================================================================
;418:*/
;419:
;420:/*
;421:===============
;422:SetMoverState
;423:===============
;424:*/
;425:void SetMoverState( gentity_t *ent, moverState_t moverState, int time ) {
line 429
;426:	vec3_t			delta;
;427:	float			f;
;428:
;429:	ent->moverState = moverState;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 431
;430:
;431:	ent->s.pos.trTime = time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 432
;432:	switch( moverState ) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $255
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $255
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $270
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $270
address $258
address $259
address $260
address $265
code
LABELV $258
line 434
;433:	case MOVER_POS1:
;434:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 548
ADDP4
INDIRB
ASGNB 12
line 435
;435:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 436
;436:		break;
ADDRGP4 $256
JUMPV
LABELV $259
line 438
;437:	case MOVER_POS2:
;438:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 439
;439:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 440
;440:		break;
ADDRGP4 $256
JUMPV
LABELV $260
line 442
;441:	case MOVER_1TO2:
;442:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 548
ADDP4
INDIRB
ASGNB 12
line 443
;443:		VectorSubtract( ent->pos2, ent->pos1, delta );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
SUBF4
ASGNF4
line 444
;444:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 445
;445:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 446
;446:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 447
;447:		break;
ADDRGP4 $256
JUMPV
LABELV $265
line 449
;448:	case MOVER_2TO1:
;449:		VectorCopy( ent->pos2, ent->s.pos.trBase );
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
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 450
;450:		VectorSubtract( ent->pos1, ent->pos2, delta );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 52
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
SUBF4
ASGNF4
line 451
;451:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 452
;452:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 453
;453:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 454
;454:		break;
LABELV $255
LABELV $256
line 456
;455:	}
;456:	BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin );	
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 368
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 457
;457:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 458
;458:}
LABELV $254
endproc SetMoverState 56 12
export MatchTeam
proc MatchTeam 4 12
line 468
;459:
;460:/*
;461:================
;462:MatchTeam
;463:
;464:All entities in a mover team will move from pos1 to pos2
;465:in the same amount of time
;466:================
;467:*/
;468:void MatchTeam( gentity_t *teamLeader, int moverState, int time ) {
line 471
;469:	gentity_t		*slave;
;470:
;471:	for ( slave = teamLeader ; slave ; slave = slave->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $276
JUMPV
LABELV $273
line 472
;472:		SetMoverState( slave, moverState, time );
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 473
;473:	}
LABELV $274
line 471
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
LABELV $276
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $273
line 474
;474:}
LABELV $272
endproc MatchTeam 4 12
export ReturnToPos1
proc ReturnToPos1 8 12
line 483
;475:
;476:
;477:
;478:/*
;479:================
;480:ReturnToPos1
;481:================
;482:*/
;483:void ReturnToPos1( gentity_t *ent ) {
line 484
;484:	MatchTeam( ent, MOVER_2TO1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 487
;485:
;486:	// looping sound
;487:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 490
;488:
;489:	// starting sound
;490:	if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $279
line 491
;491:		G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 492
;492:	}
LABELV $279
line 493
;493:}
LABELV $277
endproc ReturnToPos1 8 12
export Reached_BinaryMover
proc Reached_BinaryMover 12 12
line 501
;494:
;495:
;496:/*
;497:================
;498:Reached_BinaryMover
;499:================
;500:*/
;501:void Reached_BinaryMover( gentity_t *ent ) {
line 504
;502:
;503:	// stop the looping sound
;504:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 506
;505:
;506:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 2
NEI4 $282
line 508
;507:		// reached pos2
;508:		SetMoverState( ent, MOVER_POS2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 511
;509:
;510:		// play sound
;511:		if ( ent->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $285
line 512
;512:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos2 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 513
;513:		}
LABELV $285
line 515
;514:
;515:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 518
;516:
;517:		// return to pos1 after a delay
;518:		ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 519
;519:		ent->nextthink = level.time + ent->wait;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 521
;520:
;521:		if (ent->delay)
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $288
line 522
;522:		{
line 523
;523:			ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 524
;524:			ent->nextthink = level.time + ent->delay;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
line 525
;525:		}
LABELV $288
line 528
;526:
;527:		// fire targets
;528:		if ( !ent->activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $291
line 529
;529:			ent->activator = ent;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 530
;530:		}
LABELV $291
line 531
;531:		G_UseTargets( ent, ent->activator );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 532
;532:	} else if ( ent->moverState == MOVER_2TO1 ) {
ADDRGP4 $283
JUMPV
LABELV $282
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 3
NEI4 $293
line 534
;533:		// reached pos1
;534:		SetMoverState( ent, MOVER_POS1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 537
;535:
;536:		// play sound
;537:		if ( ent->soundPos1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
CNSTI4 0
EQI4 $296
line 538
;538:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 539
;539:		}
LABELV $296
line 541
;540:
;541:		ent->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 543
;542:
;543:		if (ent->delay)
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $298
line 544
;544:		{ //it won't go back up again this way until after the delay
line 545
;545:			ent->last_move_time = level.time + ent->delay;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDI4
ASGNI4
line 546
;546:		}
LABELV $298
line 549
;547:
;548:		// close areaportals
;549:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
ADDRLP4 4
INDIRP4
CVPU4 4
EQU4 $303
ADDRLP4 8
INDIRU4
CNSTU4 0
NEU4 $294
LABELV $303
line 550
;550:			trap_AdjustAreaPortalState( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 551
;551:		}
line 552
;552:	} else {
ADDRGP4 $294
JUMPV
LABELV $293
line 553
;553:		G_Error( "Reached_BinaryMover: bad moverState" );
ADDRGP4 $304
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 554
;554:	}
LABELV $294
LABELV $283
line 555
;555:}
LABELV $281
endproc Reached_BinaryMover 12 12
export Use_BinaryMover
proc Use_BinaryMover 20 12
line 563
;556:
;557:
;558:/*
;559:================
;560:Use_BinaryMover
;561:================
;562:*/
;563:void Use_BinaryMover( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 568
;564:	int		total;
;565:	int		partial;
;566:
;567:	// only the master should be used
;568:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $306
line 569
;569:		Use_BinaryMover( ent->teammaster, other, activator );
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 570
;570:		return;
ADDRGP4 $305
JUMPV
LABELV $306
line 573
;571:	}
;572:
;573:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 575
;574:
;575:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
NEI4 $308
line 578
;576:		// start moving 50 msec later, becase if this was player
;577:		// triggered, level.time hasn't been advanced yet
;578:		MatchTeam( ent, MOVER_1TO2, level.time + 50 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 581
;579:
;580:		// starting sound
;581:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $311
line 582
;582:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 583
;583:		}
LABELV $311
line 586
;584:
;585:		// looping sound
;586:		ent->s.loopSound = ent->soundLoop;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 589
;587:
;588:		// open areaportal
;589:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 740
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
ADDRLP4 12
INDIRP4
CVPU4 4
EQU4 $315
ADDRLP4 16
INDIRU4
CNSTU4 0
NEU4 $305
LABELV $315
line 590
;590:			trap_AdjustAreaPortalState( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 591
;591:		}
line 592
;592:		return;
ADDRGP4 $305
JUMPV
LABELV $308
line 596
;593:	}
;594:
;595:	// if all the way up, just delay before coming down
;596:	if ( ent->moverState == MOVER_POS2 && other && other->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $316
ADDRLP4 8
ADDRFP4 4
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
EQU4 $316
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRU4
EQU4 $316
line 598
;597:		//rww - don't delay if we're not being used by a player
;598:		ent->nextthink = level.time + ent->wait;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 599
;599:		return;
ADDRGP4 $305
JUMPV
LABELV $316
line 603
;600:	}
;601:
;602:	// only partway down before reversing
;603:	if ( ent->moverState == MOVER_2TO1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 3
NEI4 $319
line 604
;604:		total = ent->s.pos.trDuration;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 605
;605:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 606
;606:		if ( partial > total ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $322
line 607
;607:			partial = total;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 608
;608:		}
LABELV $322
line 610
;609:
;610:		MatchTeam( ent, MOVER_1TO2, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 612
;611:
;612:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 613
;613:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 614
;614:		}
line 615
;615:		return;
ADDRGP4 $305
JUMPV
LABELV $319
line 619
;616:	}
;617:
;618:	// only partway up before reversing
;619:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 2
NEI4 $327
line 620
;620:		total = ent->s.pos.trDuration;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 621
;621:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 622
;622:		if ( partial > total ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $330
line 623
;623:			partial = total;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 624
;624:		}
LABELV $330
line 626
;625:
;626:		MatchTeam( ent, MOVER_2TO1, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 628
;627:
;628:		if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $305
line 629
;629:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 66
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 630
;630:		}
line 631
;631:		return;
LABELV $327
line 633
;632:	}
;633:}
LABELV $305
endproc Use_BinaryMover 20 12
export InitMover
proc InitMover 96 12
line 645
;634:
;635:
;636:
;637:/*
;638:================
;639:InitMover
;640:
;641:"pos1", "pos2", and "speed" should be set before calling,
;642:so the movement delta can be calculated
;643:================
;644:*/
;645:void InitMover( gentity_t *ent ) {
line 655
;646:	vec3_t		move;
;647:	float		distance;
;648:	float		light;
;649:	vec3_t		color;
;650:	qboolean	lightSet, colorSet;
;651:	char		*sound;
;652:
;653:	// if the "model2" key is set, use a seperate model
;654:	// for drawing, but clip against the brushes
;655:	if ( ent->model2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $336
line 656
;656:		ent->s.modelindex2 = G_ModelIndex( ent->model2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 480
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 216
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 657
;657:	}
LABELV $336
line 660
;658:
;659:	// if the "loopsound" key is set, use a constant looping sound when moving
;660:	if ( G_SpawnString( "noise", "100", &sound ) ) {
ADDRGP4 $340
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 44
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $338
line 661
;661:		ent->s.loopSound = G_SoundIndex( sound );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 662
;662:	}
LABELV $338
line 665
;663:
;664:	// if the "color" or "light" keys are set, setup constantLight
;665:	lightSet = G_SpawnFloat( "light", "100", &light );
ADDRGP4 $342
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 48
INDIRI4
ASGNI4
line 666
;666:	colorSet = G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $343
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnVector
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 667
;667:	if ( lightSet || colorSet ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $347
ADDRLP4 32
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $345
LABELV $347
line 670
;668:		int		r, g, b, i;
;669:
;670:		r = color[0] * 255;
ADDRLP4 60
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 671
;671:		if ( r > 255 ) {
ADDRLP4 60
INDIRI4
CNSTI4 255
LEI4 $348
line 672
;672:			r = 255;
ADDRLP4 60
CNSTI4 255
ASGNI4
line 673
;673:		}
LABELV $348
line 674
;674:		g = color[1] * 255;
ADDRLP4 64
CNSTF4 1132396544
ADDRLP4 12+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 675
;675:		if ( g > 255 ) {
ADDRLP4 64
INDIRI4
CNSTI4 255
LEI4 $351
line 676
;676:			g = 255;
ADDRLP4 64
CNSTI4 255
ASGNI4
line 677
;677:		}
LABELV $351
line 678
;678:		b = color[2] * 255;
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 12+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 679
;679:		if ( b > 255 ) {
ADDRLP4 68
INDIRI4
CNSTI4 255
LEI4 $354
line 680
;680:			b = 255;
ADDRLP4 68
CNSTI4 255
ASGNI4
line 681
;681:		}
LABELV $354
line 682
;682:		i = light / 4;
ADDRLP4 72
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 683
;683:		if ( i > 255 ) {
ADDRLP4 72
INDIRI4
CNSTI4 255
LEI4 $356
line 684
;684:			i = 255;
ADDRLP4 72
CNSTI4 255
ASGNI4
line 685
;685:		}
LABELV $356
line 686
;686:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 68
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 72
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 687
;687:	}
LABELV $345
line 690
;688:
;689:
;690:	ent->use = Use_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 Use_BinaryMover
ASGNP4
line 691
;691:	ent->reached = Reached_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 Reached_BinaryMover
ASGNP4
line 693
;692:
;693:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 694
;694:	ent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 128
ASGNI4
line 695
;695:	ent->s.eType = ET_MOVER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 6
ASGNI4
line 696
;696:	VectorCopy (ent->pos1, ent->r.currentOrigin);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 548
ADDP4
INDIRB
ASGNB 12
line 697
;697:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 699
;698:
;699:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 700
;700:	VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 548
ADDP4
INDIRB
ASGNB 12
line 703
;701:
;702:	// calculate time to reach second position from speed
;703:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 72
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
SUBF4
ASGNF4
line 704
;704:	distance = VectorLength( move );
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 76
INDIRF4
ASGNF4
line 705
;705:	if ( ! ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
CNSTF4 0
NEF4 $360
line 706
;706:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 1120403456
ASGNF4
line 707
;707:	}
LABELV $360
line 708
;708:	VectorScale( move, ent->speed, ent->s.pos.trDelta );
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
ASGNF4
line 709
;709:	ent->s.pos.trDuration = distance * 1000 / ent->speed;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 92
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 710
;710:	if ( ent->s.pos.trDuration <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
GTI4 $364
line 711
;711:		ent->s.pos.trDuration = 1;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 712
;712:	}
LABELV $364
line 713
;713:}
LABELV $335
endproc InitMover 96 12
export Blocked_Door
proc Blocked_Door 24 32
line 732
;714:
;715:
;716:/*
;717:===============================================================================
;718:
;719:DOOR
;720:
;721:A use can be triggered either by a touch function, by being shot, or by being
;722:targeted by another entity.
;723:
;724:===============================================================================
;725:*/
;726:
;727:/*
;728:================
;729:Blocked_Door
;730:================
;731:*/
;732:void Blocked_Door( gentity_t *ent, gentity_t *other ) {
line 734
;733:	// remove anything other than a client
;734:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $367
line 736
;735:		// except CTF flags!!!!
;736:		if( other->s.eType == ET_ITEM && other->item->giType == IT_TEAM ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $369
ADDRLP4 0
INDIRP4
CNSTI4 824
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $369
line 737
;737:			Team_DroppedFlagThink( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Team_DroppedFlagThink
CALLV
pop
line 738
;738:			return;
ADDRGP4 $366
JUMPV
LABELV $369
line 740
;739:		}
;740:		if (other->physicsObject && other->health && other->takedamage && other->inuse && !other->client)
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $371
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $371
ADDRLP4 4
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $371
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $371
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $371
line 741
;741:		{ //it would otherwise just remove us, so do 99999 damage instead
line 742
;742:			G_Damage( other, ent, ent, NULL, NULL, 99999, DAMAGE_NO_ARMOR, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
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
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 2
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 743
;743:		}
ADDRGP4 $366
JUMPV
LABELV $371
line 744
;744:		else if (other->physicsObject && other->inuse && !other->client && other->s.weapon == WP_DET_PACK && other->think)
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $373
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $373
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 12
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
NEU4 $373
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 13
NEI4 $373
ADDRLP4 12
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $373
line 745
;745:		{ //detpack is about to explode
line 746
;746:			return;
ADDRGP4 $366
JUMPV
LABELV $373
line 748
;747:		}
;748:		else if (other->isSaberEntity)
ADDRFP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 0
EQI4 $375
line 749
;749:		{
line 750
;750:			return;
ADDRGP4 $366
JUMPV
LABELV $375
line 753
;751:		}
;752:		else
;753:		{
line 754
;754:			G_TempEntity( other->s.origin, EV_ITEM_POP );
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 58
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 755
;755:			G_FreeEntity( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 756
;756:		}
line 757
;757:		return;
ADDRGP4 $366
JUMPV
LABELV $367
line 760
;758:	}
;759:
;760:	if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $377
line 761
;761:		if (ent->activator && ent->activator->inuse && ent->activator->client)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $379
ADDRLP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $379
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $379
line 762
;762:		{
line 763
;763:			G_Damage( other, ent->activator, ent->activator, NULL, NULL, ent->damage, DAMAGE_NO_ARMOR|DAMAGE_NO_PROTECTION, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
CNSTP4 0
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 764
;764:		}
ADDRGP4 $380
JUMPV
LABELV $379
line 766
;765:		else
;766:		{
line 767
;767:			G_Damage( other, ent, ent, NULL, NULL, ent->damage, DAMAGE_NO_ARMOR|DAMAGE_NO_PROTECTION, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
CNSTP4 0
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 768
;768:		}
LABELV $380
line 769
;769:	}
LABELV $377
line 770
;770:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $381
line 771
;771:		return;		// crushers don't reverse
ADDRGP4 $366
JUMPV
LABELV $381
line 775
;772:	}
;773:
;774:	// reverse direction
;775:	Use_BinaryMover( ent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 776
;776:}
LABELV $366
endproc Blocked_Door 24 32
proc Touch_DoorTriggerSpectator 72 12
line 783
;777:
;778:/*
;779:================
;780:Touch_DoorTriggerSpectator
;781:================
;782:*/
;783:static void Touch_DoorTriggerSpectator( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 787
;784:	int i, axis;
;785:	vec3_t origin, dir, angles;
;786:
;787:	axis = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
ASGNI4
line 788
;788:	VectorClear(dir);
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 789
;789:	if (fabs(other->s.origin[axis] - ent->r.absmax[axis]) <
ADDRLP4 48
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $386
line 790
;790:		fabs(other->s.origin[axis] - ent->r.absmin[axis])) {
line 791
;791:		origin[axis] = ent->r.absmin[axis] - 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 792
;792:		dir[axis] = -1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 3212836864
ASGNF4
line 793
;793:	}
ADDRGP4 $387
JUMPV
LABELV $386
line 794
;794:	else {
line 795
;795:		origin[axis] = ent->r.absmax[axis] + 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 796
;796:		dir[axis] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 1065353216
ASGNF4
line 797
;797:	}
LABELV $387
line 798
;798:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $388
line 799
;799:		if (i == axis) continue;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $392
ADDRGP4 $389
JUMPV
LABELV $392
line 800
;800:		origin[i] = (ent->r.absmin[i] + ent->r.absmax[i]) * 0.5;
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
CNSTF4 1056964608
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 344
ADDP4
ADDP4
INDIRF4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 801
;801:	}
LABELV $389
line 798
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $388
line 802
;802:	vectoangles(dir, angles);
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 803
;803:	TeleportPlayer(other, origin, angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 804
;804:}
LABELV $383
endproc Touch_DoorTriggerSpectator 72 12
export Touch_DoorTrigger
proc Touch_DoorTrigger 8 12
line 811
;805:
;806:/*
;807:================
;808:Touch_DoorTrigger
;809:================
;810:*/
;811:void Touch_DoorTrigger( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 812
;812:	if ( other->client && other->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $395
ADDRLP4 0
INDIRP4
CNSTI4 1520
ADDP4
INDIRI4
CNSTI4 3
NEI4 $395
line 814
;813:		// if the door is not open and not opening
;814:		if ( ent->parent->moverState != MOVER_1TO2 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $396
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $396
line 815
;815:			ent->parent->moverState != MOVER_POS2) {
line 816
;816:			Touch_DoorTriggerSpectator( ent, other, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Touch_DoorTriggerSpectator
CALLV
pop
line 817
;817:		}
line 818
;818:	}
ADDRGP4 $396
JUMPV
LABELV $395
line 819
;819:	else if ( ent->parent->moverState != MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 2
EQI4 $399
line 820
;820:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 821
;821:	}
LABELV $399
LABELV $396
line 822
;822:}
LABELV $394
endproc Touch_DoorTrigger 8 12
export Think_SpawnNewDoorTrigger
proc Think_SpawnNewDoorTrigger 52 12
line 833
;823:
;824:
;825:/*
;826:======================
;827:Think_SpawnNewDoorTrigger
;828:
;829:All of the parts of a door have been spawned, so create
;830:a trigger that encloses all of them
;831:======================
;832:*/
;833:void Think_SpawnNewDoorTrigger( gentity_t *ent ) {
line 839
;834:	gentity_t		*other;
;835:	vec3_t		mins, maxs;
;836:	int			i, best;
;837:
;838:	// set all of the slaves as shootable
;839:	if (ent->takedamage)
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRI4
CNSTI4 0
EQI4 $402
line 840
;840:	{
line 841
;841:		for ( other = ent ; other ; other = other->teamchain )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $407
JUMPV
LABELV $404
line 842
;842:		{
line 843
;843:			other->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 844
;844:		}
LABELV $405
line 841
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
LABELV $407
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $404
line 845
;845:	}
LABELV $402
line 848
;846:
;847:	// find the bounds of everything on the team
;848:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
INDIRB
ASGNB 12
line 849
;849:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 356
ADDP4
INDIRB
ASGNB 12
line 851
;850:
;851:	for (other = ent->teamchain ; other ; other=other->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $411
JUMPV
LABELV $408
line 852
;852:		AddPointToBounds (other->r.absmin, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 853
;853:		AddPointToBounds (other->r.absmax, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 356
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 854
;854:	}
LABELV $409
line 851
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRP4
ASGNP4
LABELV $411
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $408
line 857
;855:
;856:	// find the thinnest axis, which will be the one we expand
;857:	best = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 858
;858:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $412
line 859
;859:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 44
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 44
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $416
line 860
;860:			best = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 861
;861:		}
LABELV $416
line 862
;862:	}
LABELV $413
line 858
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $412
line 863
;863:	maxs[best] += 120;
ADDRLP4 36
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 864
;864:	mins[best] -= 120;
ADDRLP4 40
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1123024896
SUBF4
ASGNF4
line 867
;865:
;866:	// create a trigger with this size
;867:	other = G_Spawn ();
ADDRLP4 44
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 868
;868:	other->classname = "door_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $418
ASGNP4
line 869
;869:	VectorCopy (mins, other->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 870
;870:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 871
;871:	other->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 872
;872:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 873
;873:	other->touch = Touch_DoorTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 Touch_DoorTrigger
ASGNP4
line 875
;874:	// remember the thinnest axis
;875:	other->count = best;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 876
;876:	trap_LinkEntity (other);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 878
;877:
;878:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 879
;879:}
LABELV $401
endproc Think_SpawnNewDoorTrigger 52 12
export Think_MatchTeam
proc Think_MatchTeam 4 12
line 881
;880:
;881:void Think_MatchTeam( gentity_t *ent ) {
line 882
;882:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 883
;883:}
LABELV $420
endproc Think_MatchTeam 4 12
export SP_func_door
proc SP_func_door 104 12
line 906
;884:
;885:
;886:/*QUAKED func_door (0 .5 .8) ? START_OPEN x CRUSHER
;887:TOGGLE		wait in both the start and end states for a trigger event.
;888:START_OPEN	the door to moves to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not useful for touch or takedamage doors).
;889:NOMONSTER	monsters will not trigger this door
;890:
;891:"model2"	.md3 model to also draw
;892:"angle"		determines the opening direction
;893:"targetname" if set, no touch field will be spawned and a remote button or trigger field activates the door.
;894:"speed"		movement speed (100 default)
;895:"wait"		wait before returning (3 default, -1 = never return)
;896:"lip"		lip remaining at end of move (8 default)
;897:"dmg"		damage to inflict when blocked (2 default)
;898:"color"		constantLight color
;899:"light"		constantLight radius
;900:"health"	if set, the door must be shot open
;901:"soundstart"	Sound door makes when it starts
;902:"soundmove"	Sound door makes when it starts
;903:"soundstop"	Sound door makes when it stops
;904:"sound"		Set to 0 to disable sounds on door, 1 to enable. Default is 1.
;905:*/
;906:void SP_func_door (gentity_t *ent) {
line 912
;907:	vec3_t	abs_movedir;
;908:	float	distance;
;909:	vec3_t	size;
;910:	float	lip;
;911:	char	*sound;
;912:	int		soundon = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 914
;913:
;914:	G_SpawnInt("sound", "1", &soundon);
ADDRGP4 $423
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 916
;915:
;916:	if (soundon)
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $425
line 917
;917:	{
line 918
;918:		G_SpawnString("soundstart", "sound/movers/doors/door1start.wav", &sound);
ADDRGP4 $427
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 919
;919:		ent->sound1to2 = ent->sound2to1 = G_SoundIndex(sound);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 921
;920:
;921:		G_SpawnString("soundstop", "sound/movers/doors/door1stop.wav", &sound);
ADDRGP4 $429
ARGP4
ADDRGP4 $430
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 922
;922:		ent->soundPos1 = ent->soundPos2 = G_SoundIndex(sound);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
ADDRLP4 52
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 924
;923:
;924:		G_SpawnString("soundmove", "sound/movers/doors/door1move.wav", &sound);
ADDRGP4 $431
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 925
;925:		ent->soundLoop = G_SoundIndex(sound);
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 926
;926:	}
ADDRGP4 $426
JUMPV
LABELV $425
line 928
;927:	else
;928:	{
line 929
;929:		ent->sound1to2 = ent->sound2to1 = ent->soundPos1 = ent->soundPos2 = 0;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 930
;930:	}
LABELV $426
line 932
;931:
;932:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 935
;933:
;934:	// default speed of 400
;935:	if (!ent->speed)
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
CNSTF4 0
NEF4 $433
line 936
;936:		ent->speed = 400;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 1137180672
ASGNF4
LABELV $433
line 939
;937:
;938:	// default wait of 2 seconds
;939:	if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
CNSTF4 0
NEF4 $435
line 940
;940:		ent->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTF4 1073741824
ASGNF4
LABELV $435
line 941
;941:	ent->wait *= 1000;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTF4 1148846080
ADDRLP4 40
INDIRP4
INDIRF4
MULF4
ASGNF4
line 944
;942:
;943:	// default lip of 8 units
;944:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $437
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 947
;945:
;946:	// default damage of 2 points
;947:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $439
ARGP4
ADDRGP4 $440
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 950
;948:
;949:	// first position at start
;950:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 953
;951:
;952:	// calculate second position
;953:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 955
;954:
;955:	G_SetMovedir (ent->s.angles, ent->movedir);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 956
;956:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 56
INDIRF4
ASGNF4
line 957
;957:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
ASGNF4
line 958
;958:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 64
INDIRF4
ASGNF4
line 959
;959:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 68
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 68
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 72
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ASGNF4
line 960
;960:	distance = DotProduct( abs_movedir, size ) - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 36
INDIRF4
SUBF4
ASGNF4
line 961
;961:	VectorMA( ent->pos1, distance, ent->movedir, ent->pos2 );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 964
;962:
;963:	// if "start_open", reverse position 1 and 2
;964:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $449
line 967
;965:		vec3_t	temp;
;966:
;967:		VectorCopy( ent->pos2, temp );
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 968
;968:		VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 969
;969:		VectorCopy( temp, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 88
INDIRB
ASGNB 12
line 970
;970:	}
LABELV $449
line 972
;971:
;972:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 974
;973:
;974:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 976
;975:
;976:	if ( ! (ent->flags & FL_TEAMSLAVE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $452
line 979
;977:		int health;
;978:
;979:		G_SpawnInt( "health", "0", &health );
ADDRGP4 $454
ARGP4
ADDRGP4 $455
ARGP4
ADDRLP4 88
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 980
;980:		if ( health ) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $456
line 981
;981:			ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 982
;982:		}
LABELV $456
line 983
;983:		if ( ent->targetname || health ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $460
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $458
LABELV $460
line 985
;984:			// non touch/shoot doors
;985:			ent->think = Think_MatchTeam;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 Think_MatchTeam
ASGNP4
line 986
;986:		} else {
ADDRGP4 $459
JUMPV
LABELV $458
line 987
;987:			ent->think = Think_SpawnNewDoorTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 Think_SpawnNewDoorTrigger
ASGNP4
line 988
;988:		}
LABELV $459
line 989
;989:	}
LABELV $452
line 990
;990:}
LABELV $422
endproc SP_func_door 104 12
export Touch_Plat
proc Touch_Plat 32 0
line 1007
;991:
;992:/*
;993:===============================================================================
;994:
;995:PLAT
;996:
;997:===============================================================================
;998:*/
;999:
;1000:/*
;1001:==============
;1002:Touch_Plat
;1003:
;1004:Don't allow decent if a living player is on it
;1005:===============
;1006:*/
;1007:void Touch_Plat( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1008
;1008:	if ( !other->client || other->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $464
ADDRLP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $462
LABELV $464
line 1009
;1009:		return;
ADDRGP4 $461
JUMPV
LABELV $462
line 1012
;1010:	}
;1011:	
;1012:	if (other && other->client && ent->delay && ent->moverState == MOVER_POS2)
ADDRLP4 4
ADDRFP4 4
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
EQU4 $465
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $465
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $465
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $465
line 1013
;1013:	{ //This means I don't care if you're touching me, I already intend to go back down on a set interval.
line 1014
;1014:		return;
ADDRGP4 $461
JUMPV
LABELV $465
line 1016
;1015:	}
;1016:	if (other && other->client && ent->delay && ent->moverState == MOVER_POS1 && ent->nextthink >= level.time)
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $467
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 20
INDIRU4
EQU4 $467
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRLP4 24
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $467
ADDRLP4 24
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $467
ADDRLP4 24
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $467
line 1017
;1017:	{
line 1018
;1018:		return;
ADDRGP4 $461
JUMPV
LABELV $467
line 1022
;1019:	}
;1020:
;1021:	// delay return-to-pos1 by one second
;1022:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
NEI4 $470
line 1023
;1023:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1024
;1024:	}
LABELV $470
line 1025
;1025:}
LABELV $461
endproc Touch_Plat 32 0
export Touch_PlatCenterTrigger
proc Touch_PlatCenterTrigger 8 12
line 1034
;1026:
;1027:/*
;1028:==============
;1029:Touch_PlatCenterTrigger
;1030:
;1031:If the plat is at the bottom position, start it going up
;1032:===============
;1033:*/
;1034:void Touch_PlatCenterTrigger(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1035
;1035:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $474
line 1036
;1036:		return;
ADDRGP4 $473
JUMPV
LABELV $474
line 1039
;1037:	}
;1038:
;1039:	if ( ent->parent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
NEI4 $476
line 1040
;1040:		if (ent->parent->delay && ent->parent->last_move_time >= level.time)
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $478
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LTI4 $478
line 1041
;1041:		{
line 1042
;1042:			return;
ADDRGP4 $473
JUMPV
LABELV $478
line 1045
;1043:		}
;1044:
;1045:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1046
;1046:	}
LABELV $476
line 1047
;1047:}
LABELV $473
endproc Touch_PlatCenterTrigger 8 12
export SpawnPlatTrigger
proc SpawnPlatTrigger 60 4
line 1059
;1048:
;1049:
;1050:/*
;1051:================
;1052:SpawnPlatTrigger
;1053:
;1054:Spawn a trigger in the middle of the plat's low position
;1055:Elevator cars require that the trigger extend through the entire low position,
;1056:not just sit on top of it.
;1057:================
;1058:*/
;1059:void SpawnPlatTrigger( gentity_t *ent ) {
line 1065
;1060:	gentity_t	*trigger;
;1061:	vec3_t	tmin, tmax;
;1062:
;1063:	// the middle trigger will be a thin trigger just
;1064:	// above the starting position
;1065:	trigger = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1066
;1066:	trigger->classname = "plat_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
ADDRGP4 $482
ASGNP4
line 1067
;1067:	trigger->touch = Touch_PlatCenterTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 Touch_PlatCenterTrigger
ASGNP4
line 1068
;1068:	trigger->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 1024
ASGNI4
line 1069
;1069:	trigger->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1071
;1070:	
;1071:	tmin[0] = ent->pos1[0] + ent->r.mins[0] + 33;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1072
;1072:	tmin[1] = ent->pos1[1] + ent->r.mins[1] + 33;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1073
;1073:	tmin[2] = ent->pos1[2] + ent->r.mins[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1075
;1074:
;1075:	tmax[0] = ent->pos1[0] + ent->r.maxs[0] - 33;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1076
;1076:	tmax[1] = ent->pos1[1] + ent->r.maxs[1] - 33;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+4
ADDRLP4 48
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1077
;1077:	tmax[2] = ent->pos1[2] + ent->r.maxs[2] + 8;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+8
ADDRLP4 52
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1079
;1078:
;1079:	if ( tmax[0] <= tmin[0] ) {
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
GTF4 $487
line 1080
;1080:		tmin[0] = ent->pos1[0] + (ent->r.mins[0] + ent->r.maxs[0]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1081
;1081:		tmax[0] = tmin[0] + 1;
ADDRLP4 16
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1082
;1082:	}
LABELV $487
line 1083
;1083:	if ( tmax[1] <= tmin[1] ) {
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
GTF4 $489
line 1084
;1084:		tmin[1] = ent->pos1[1] + (ent->r.mins[1] + ent->r.maxs[1]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1085
;1085:		tmax[1] = tmin[1] + 1;
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1086
;1086:	}
LABELV $489
line 1088
;1087:	
;1088:	VectorCopy (tmin, trigger->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1089
;1089:	VectorCopy (tmax, trigger->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1091
;1090:
;1091:	trap_LinkEntity (trigger);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1092
;1092:}
LABELV $481
endproc SpawnPlatTrigger 60 4
export SP_func_plat
proc SP_func_plat 48 12
line 1113
;1093:
;1094:
;1095:/*QUAKED func_plat (0 .5 .8) ?
;1096:Plats are always drawn in the extended position so they will light correctly.
;1097:
;1098:"lip"		default 8, protrusion above rest position
;1099:"height"	total height of movement, defaults to model height
;1100:"speed"		overrides default 200.
;1101:"dmg"		overrides default 2
;1102:"model2"	.md3 model to also draw
;1103:"color"		constantLight color
;1104:"light"		constantLight radius
;1105:"delay"		After reaching pos2, plat will go back to pos1 after this many ms.
;1106:			Once plat goes to pos1 form pos2, it will also wait this many ms before
;1107:			it will activate and return to pos2.
;1108:"soundmove"	Sound door makes when it moves
;1109:"soundstart"	Sound door makes when it moves
;1110:"soundstop"	Sound door makes when it stops
;1111:"sound"		Set to 0 to disable sounds on door, 1 to enable. Default is 1.
;1112:*/
;1113:void SP_func_plat (gentity_t *ent) {
line 1116
;1114:	float		lip, height;
;1115:	char		*sound;
;1116:	int			soundon = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1118
;1117:
;1118:	G_SpawnInt("sound", "1", &soundon);
ADDRGP4 $423
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1120
;1119:
;1120:	if (soundon)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $497
line 1121
;1121:	{
line 1122
;1122:		G_SpawnString("soundstart", "sound/movers/doors/door1start.wav", &sound);
ADDRGP4 $427
ARGP4
ADDRGP4 $428
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1123
;1123:		ent->sound1to2 = ent->sound2to1 = G_SoundIndex(sound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1125
;1124:
;1125:		G_SpawnString("soundstop", "sound/movers/doors/door1stop.wav", &sound);
ADDRGP4 $429
ARGP4
ADDRGP4 $430
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1126
;1126:		ent->soundPos1 = ent->soundPos2 = G_SoundIndex(sound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1128
;1127:
;1128:		G_SpawnString("soundmove", "sound/movers/doors/door1move.wav", &sound);
ADDRGP4 $431
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1129
;1129:		ent->soundLoop = G_SoundIndex(sound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1130
;1130:	}
ADDRGP4 $498
JUMPV
LABELV $497
line 1132
;1131:	else
;1132:	{
line 1133
;1133:		ent->sound1to2 = ent->sound2to1 = ent->soundPos1 = ent->soundPos2 = 0;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1134
;1134:	}
LABELV $498
line 1136
;1135:
;1136:	VectorClear (ent->s.angles);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
CNSTF4 0
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 16
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 1138
;1137:
;1138:	G_SpawnFloat( "speed", "200", &ent->speed );
ADDRGP4 $499
ARGP4
ADDRGP4 $500
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1139
;1139:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $439
ARGP4
ADDRGP4 $440
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1140
;1140:	G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $501
ARGP4
ADDRGP4 $424
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1141
;1141:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $437
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1143
;1142:
;1143:	G_SpawnInt("delay", "0", &ent->delay);
ADDRGP4 $502
ARGP4
ADDRGP4 $455
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1145
;1144:
;1145:	ent->wait = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTF4 1148846080
ASGNF4
line 1148
;1146:
;1147:	// create second position
;1148:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1150
;1149:
;1150:	if ( !G_SpawnFloat( "height", "0", &height ) ) {
ADDRGP4 $505
ARGP4
ADDRGP4 $455
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 28
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $503
line 1151
;1151:		height = (ent->r.maxs[2] - ent->r.mins[2]) - lip;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 1152
;1152:	}
LABELV $503
line 1155
;1153:
;1154:	// pos1 is the rest (bottom) position, pos2 is the top
;1155:	VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1156
;1156:	VectorCopy( ent->pos2, ent->pos1 );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 1157
;1157:	ent->pos1[2] -= height;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 1159
;1158:
;1159:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1163
;1160:
;1161:	// touch function keeps the plat from returning while
;1162:	// a live player is standing on it
;1163:	ent->touch = Touch_Plat;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 Touch_Plat
ASGNP4
line 1165
;1164:
;1165:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 644
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1167
;1166:
;1167:	ent->parent = ent;	// so it can be treated as a door
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 44
INDIRP4
ASGNP4
line 1170
;1168:
;1169:	// spawn the trigger if one hasn't been custom made
;1170:	if ( !ent->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $506
line 1171
;1171:		SpawnPlatTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnPlatTrigger
CALLV
pop
line 1172
;1172:	}
LABELV $506
line 1173
;1173:}
LABELV $496
endproc SP_func_plat 48 12
export Touch_Button
proc Touch_Button 4 12
line 1190
;1174:
;1175:
;1176:/*
;1177:===============================================================================
;1178:
;1179:BUTTON
;1180:
;1181:===============================================================================
;1182:*/
;1183:
;1184:/*
;1185:==============
;1186:Touch_Button
;1187:
;1188:===============
;1189:*/
;1190:void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1191
;1191:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $509
line 1192
;1192:		return;
ADDRGP4 $508
JUMPV
LABELV $509
line 1195
;1193:	}
;1194:
;1195:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 0
NEI4 $511
line 1196
;1196:		Use_BinaryMover( ent, other, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1197
;1197:	}
LABELV $511
line 1198
;1198:}
LABELV $508
endproc Touch_Button 4 12
export SP_func_button
proc SP_func_button 92 12
line 1216
;1199:
;1200:
;1201:/*QUAKED func_button (0 .5 .8) ?
;1202:When a button is touched, it moves some distance in the direction of it's angle, triggers all of it's targets, waits some time, then returns to it's original position where it can be triggered again.
;1203:
;1204:"model2"	.md3 model to also draw
;1205:"angle"		determines the opening direction
;1206:"target"	all entities with a matching targetname will be used
;1207:"speed"		override the default 40 speed
;1208:"wait"		override the default 1 second wait (-1 = never return)
;1209:"lip"		override the default 4 pixel lip remaining at end of move
;1210:"health"	if set, the button must be killed instead of touched
;1211:"color"		constantLight color
;1212:"light"		constantLight radius
;1213:"sounduse"	Sound when used
;1214:"sound"		Set to 0 to disable sounds on button, 1 to enable. Default is 1.
;1215:*/
;1216:void SP_func_button( gentity_t *ent ) {
line 1222
;1217:	vec3_t		abs_movedir;
;1218:	float		distance;
;1219:	vec3_t		size;
;1220:	float		lip;
;1221:	char		*sound;
;1222:	int			soundon = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 1224
;1223:
;1224:	G_SpawnInt("sound", "1", &soundon);
ADDRGP4 $423
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1226
;1225:
;1226:	if (soundon)
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $514
line 1227
;1227:	{
line 1228
;1228:		G_SpawnString("sounduse", "sound/movers/doors/door1move.wav", &sound);
ADDRGP4 $516
ARGP4
ADDRGP4 $432
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1229
;1229:		ent->sound1to2 = G_SoundIndex(sound);
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1230
;1230:	}
ADDRGP4 $515
JUMPV
LABELV $514
line 1232
;1231:	else
;1232:	{
line 1233
;1233:		ent->sound1to2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1234
;1234:	}
LABELV $515
line 1236
;1235:
;1236:	ent->sound1to2 = G_SoundIndex("sound/movers/switches/switch3.wav");
ADDRGP4 $517
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 1238
;1237:	
;1238:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
CNSTF4 0
NEF4 $518
line 1239
;1239:		ent->speed = 40;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 1109393408
ASGNF4
line 1240
;1240:	}
LABELV $518
line 1242
;1241:
;1242:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
CNSTF4 0
NEF4 $520
line 1243
;1243:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTF4 1065353216
ASGNF4
line 1244
;1244:	}
LABELV $520
line 1245
;1245:	ent->wait *= 1000;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTF4 1148846080
ADDRLP4 44
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1248
;1246:
;1247:	// first position
;1248:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1251
;1249:
;1250:	// calculate second position
;1251:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1253
;1252:
;1253:	G_SpawnFloat( "lip", "4", &lip );
ADDRGP4 $437
ARGP4
ADDRGP4 $522
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1255
;1254:
;1255:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 612
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1256
;1256:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 60
INDIRF4
ASGNF4
line 1257
;1257:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 64
INDIRF4
ASGNF4
line 1258
;1258:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 68
INDIRF4
ASGNF4
line 1259
;1259:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 72
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 72
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 76
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1260
;1260:	distance = abs_movedir[0] * size[0] + abs_movedir[1] * size[1] + abs_movedir[2] * size[2] - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
line 1261
;1261:	VectorMA (ent->pos1, distance, ent->movedir, ent->pos2);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1263
;1262:
;1263:	if (ent->health) {
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
EQI4 $531
line 1265
;1264:		// shootable button
;1265:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1266
;1266:	} else {
ADDRGP4 $532
JUMPV
LABELV $531
line 1268
;1267:		// touchable button
;1268:		ent->touch = Touch_Button;
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
ADDRGP4 Touch_Button
ASGNP4
line 1269
;1269:	}
LABELV $532
line 1271
;1270:
;1271:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1272
;1272:}
LABELV $513
endproc SP_func_button 92 12
export Think_BeginMoving
proc Think_BeginMoving 0 0
line 1296
;1273:
;1274:
;1275:
;1276:/*
;1277:===============================================================================
;1278:
;1279:TRAIN
;1280:
;1281:===============================================================================
;1282:*/
;1283:
;1284:
;1285:#define TRAIN_START_ON		1
;1286:#define TRAIN_TOGGLE		2
;1287:#define TRAIN_BLOCK_STOPS	4
;1288:
;1289:/*
;1290:===============
;1291:Think_BeginMoving
;1292:
;1293:The wait time at a corner has completed, so start moving again
;1294:===============
;1295:*/
;1296:void Think_BeginMoving( gentity_t *ent ) {
line 1297
;1297:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1298
;1298:	ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 1299
;1299:}
LABELV $533
endproc Think_BeginMoving 0 0
export Reached_Train
proc Reached_Train 48 12
line 1306
;1300:
;1301:/*
;1302:===============
;1303:Reached_Train
;1304:===============
;1305:*/
;1306:void Reached_Train( gentity_t *ent ) {
line 1313
;1307:	gentity_t		*next;
;1308:	float			speed;
;1309:	vec3_t			move;
;1310:	float			length;
;1311:
;1312:	// copy the apropriate values
;1313:	next = ent->nextTrain;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
line 1314
;1314:	if ( !next || !next->nextTrain ) {
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $538
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $536
LABELV $538
line 1315
;1315:		return;		// just stop
ADDRGP4 $535
JUMPV
LABELV $536
line 1319
;1316:	}
;1317:
;1318:	// fire all other targets
;1319:	G_UseTargets( next, NULL );
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1322
;1320:
;1321:	// set the new trajectory
;1322:	ent->nextTrain = next->nextTrain;
ADDRLP4 32
CNSTI4 540
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1323
;1323:	VectorCopy( next->s.origin, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1324
;1324:	VectorCopy( next->nextTrain->s.origin, ent->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1327
;1325:
;1326:	// if the path_corner has a speed, use that
;1327:	if ( next->speed ) {
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
CNSTF4 0
EQF4 $539
line 1328
;1328:		speed = next->speed;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ASGNF4
line 1329
;1329:	} else {
ADDRGP4 $540
JUMPV
LABELV $539
line 1331
;1330:		// otherwise use the train's speed
;1331:		speed = ent->speed;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ASGNF4
line 1332
;1332:	}
LABELV $540
line 1333
;1333:	if ( speed < 1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $541
line 1334
;1334:		speed = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1335
;1335:	}
LABELV $541
line 1338
;1336:
;1337:	// calculate duration
;1338:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
CNSTI4 560
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 548
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 564
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 552
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 556
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1339
;1339:	length = VectorLength( move );
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1341
;1340:
;1341:	ent->s.pos.trDuration = length * 1000 / speed;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1344
;1342:
;1343:	// looping sound
;1344:	ent->s.loopSound = next->soundLoop;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
ASGNI4
line 1347
;1345:
;1346:	// start it going
;1347:	SetMoverState( ent, MOVER_1TO2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 1350
;1348:
;1349:	// if there is a "wait" value on the target, don't start moving yet
;1350:	if ( next->wait ) {
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
CNSTF4 0
EQF4 $546
line 1351
;1351:		ent->nextthink = level.time + next->wait * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1352
;1352:		ent->think = Think_BeginMoving;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 Think_BeginMoving
ASGNP4
line 1353
;1353:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1354
;1354:	}
LABELV $546
line 1355
;1355:}
LABELV $535
endproc Reached_Train 48 12
export Think_SetupTrainTargets
proc Think_SetupTrainTargets 28 12
line 1365
;1356:
;1357:
;1358:/*
;1359:===============
;1360:Think_SetupTrainTargets
;1361:
;1362:Link all the corners together
;1363:===============
;1364:*/
;1365:void Think_SetupTrainTargets( gentity_t *ent ) {
line 1368
;1366:	gentity_t		*path, *next, *start;
;1367:
;1368:	ent->nextTrain = G_Find( NULL, FOFS(targetname), ent->target );
CNSTP4 0
ARGP4
CNSTI4 588
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 1369
;1369:	if ( !ent->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $550
line 1370
;1370:		G_Printf( "func_train at %s with an unfound target\n",
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $552
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1372
;1371:			vtos(ent->r.absmin) );
;1372:		return;
ADDRGP4 $549
JUMPV
LABELV $550
line 1375
;1373:	}
;1374:
;1375:	start = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1376
;1376:	for ( path = ent->nextTrain ; path != start ; path = next ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $556
JUMPV
LABELV $553
line 1377
;1377:		if ( !start ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $557
line 1378
;1378:			start = path;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1379
;1379:		}
LABELV $557
line 1381
;1380:
;1381:		if ( !path->target ) {
ADDRLP4 4
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $559
line 1382
;1382:			G_Printf( "Train corner at %s without a target\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $561
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1384
;1383:				vtos(path->s.origin) );
;1384:			return;
ADDRGP4 $549
JUMPV
LABELV $559
line 1390
;1385:		}
;1386:
;1387:		// find a path_corner among the targets
;1388:		// there may also be other targets that get fired when the corner
;1389:		// is reached
;1390:		next = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $562
line 1391
;1391:		do {
line 1392
;1392:			next = G_Find( next, FOFS(targetname), path->target );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 588
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1393
;1393:			if ( !next ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $565
line 1394
;1394:				G_Printf( "Train corner at %s without a target path_corner\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $567
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1396
;1395:					vtos(path->s.origin) );
;1396:				return;
ADDRGP4 $549
JUMPV
LABELV $565
line 1398
;1397:			}
;1398:		} while ( strcmp( next->classname, "path_corner" ) );
LABELV $563
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 $568
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $562
line 1400
;1399:
;1400:		path->nextTrain = next;
ADDRLP4 4
INDIRP4
CNSTI4 540
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1401
;1401:	}
LABELV $554
line 1376
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $556
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $553
line 1404
;1402:
;1403:	// start the train moving from the first corner
;1404:	Reached_Train( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Reached_Train
CALLV
pop
line 1405
;1405:}
LABELV $549
endproc Think_SetupTrainTargets 28 12
export SP_path_corner
proc SP_path_corner 4 8
line 1415
;1406:
;1407:
;1408:
;1409:/*QUAKED path_corner (.5 .3 0) (-8 -8 -8) (8 8 8)
;1410:Train path corners.
;1411:Target: next path corner and other targets to fire
;1412:"speed" speed to move to the next corner
;1413:"wait" seconds to wait before behining move to next corner
;1414:*/
;1415:void SP_path_corner( gentity_t *self ) {
line 1416
;1416:	if ( !self->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $570
line 1417
;1417:		G_Printf ("path_corner with no targetname at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $572
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1418
;1418:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1419
;1419:		return;
LABELV $570
line 1422
;1420:	}
;1421:	// path corners don't need to be linked in
;1422:}
LABELV $569
endproc SP_path_corner 4 8
export SP_func_train
proc SP_func_train 12 8
line 1440
;1423:
;1424:
;1425:
;1426:/*QUAKED func_train (0 .5 .8) ? START_ON TOGGLE BLOCK_STOPS ? ? CRUSH_THROUGH
;1427:A train is a mover that moves between path_corner target points.
;1428:Trains MUST HAVE AN ORIGIN BRUSH.
;1429:The train spawns at the first target it is pointing at.
;1430:CRUSH_THROUGH spawnflag combined with a dmg value will make the train pass through
;1431:entities and damage them on contact as well.
;1432:"model2"	.md3 model to also draw
;1433:"speed"		default 100
;1434:"dmg"		default	2
;1435:"noise"		looping sound to play when the train is in motion
;1436:"target"	next path corner
;1437:"color"		constantLight color
;1438:"light"		constantLight radius
;1439:*/
;1440:void SP_func_train (gentity_t *self) {
line 1441
;1441:	VectorClear (self->s.angles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1443
;1442:
;1443:	if (self->spawnflags & TRAIN_BLOCK_STOPS) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $574
line 1444
;1444:		self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 1445
;1445:	} else {
ADDRGP4 $575
JUMPV
LABELV $574
line 1446
;1446:		if (!self->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $576
line 1447
;1447:			self->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 2
ASGNI4
line 1448
;1448:		}
LABELV $576
line 1449
;1449:	}
LABELV $575
line 1451
;1450:
;1451:	if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
CNSTF4 0
NEF4 $578
line 1452
;1452:		self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 1120403456
ASGNF4
line 1453
;1453:	}
LABELV $578
line 1455
;1454:
;1455:	if ( !self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $580
line 1456
;1456:		G_Printf ("func_train without a target at %s\n", vtos(self->r.absmin));
ADDRFP4 0
INDIRP4
CNSTI4 344
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $582
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1457
;1457:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1458
;1458:		return;
ADDRGP4 $573
JUMPV
LABELV $580
line 1461
;1459:	}
;1460:
;1461:	trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1462
;1462:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1464
;1463:
;1464:	self->reached = Reached_Train;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 Reached_Train
ASGNP4
line 1468
;1465:
;1466:	// start trains on the second frame, to make sure their targets have had
;1467:	// a chance to spawn
;1468:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1469
;1469:	self->think = Think_SetupTrainTargets;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 Think_SetupTrainTargets
ASGNP4
line 1470
;1470:}
LABELV $573
endproc SP_func_train 12 8
export SP_func_static
proc SP_func_static 12 8
line 1487
;1471:
;1472:/*
;1473:===============================================================================
;1474:
;1475:STATIC
;1476:
;1477:===============================================================================
;1478:*/
;1479:
;1480:
;1481:/*QUAKED func_static (0 .5 .8) ?
;1482:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;1483:"model2"	.md3 model to also draw
;1484:"color"		constantLight color
;1485:"light"		constantLight radius
;1486:*/
;1487:void SP_func_static( gentity_t *ent ) {
line 1488
;1488:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1489
;1489:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1490
;1490:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1491
;1491:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1492
;1492:}
LABELV $584
endproc SP_func_static 12 8
export SP_func_rotating
proc SP_func_rotating 16 8
line 1515
;1493:
;1494:
;1495:/*
;1496:===============================================================================
;1497:
;1498:ROTATING
;1499:
;1500:===============================================================================
;1501:*/
;1502:
;1503:
;1504:/*QUAKED func_rotating (0 .5 .8) ? START_ON - X_AXIS Y_AXIS
;1505:You need to have an origin brush as part of this entity.  The center of that brush will be
;1506:the point around which it is rotated. It will rotate around the Z axis by default.  You can
;1507:check either the X_AXIS or Y_AXIS box to change that.
;1508:
;1509:"model2"	.md3 model to also draw
;1510:"speed"		determines how fast it moves; default value is 100.
;1511:"dmg"		damage to inflict when blocked (2 default)
;1512:"color"		constantLight color
;1513:"light"		constantLight radius
;1514:*/
;1515:void SP_func_rotating (gentity_t *ent) {
line 1516
;1516:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
CNSTF4 0
NEF4 $586
line 1517
;1517:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTF4 1120403456
ASGNF4
line 1518
;1518:	}
LABELV $586
line 1521
;1519:
;1520:	// set the axis of rotation
;1521:	ent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 1522
;1522:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $588
line 1523
;1523:		ent->s.apos.trDelta[2] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ASGNF4
line 1524
;1524:	} else if ( ent->spawnflags & 8 ) {
ADDRGP4 $589
JUMPV
LABELV $588
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $590
line 1525
;1525:		ent->s.apos.trDelta[0] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ASGNF4
line 1526
;1526:	} else {
ADDRGP4 $591
JUMPV
LABELV $590
line 1527
;1527:		ent->s.apos.trDelta[1] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
ASGNF4
line 1528
;1528:	}
LABELV $591
LABELV $589
line 1530
;1529:
;1530:	if (!ent->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
NEI4 $592
line 1531
;1531:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 2
ASGNI4
line 1532
;1532:	}
LABELV $592
line 1534
;1533:
;1534:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1535
;1535:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1537
;1536:
;1537:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1538
;1538:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1539
;1539:	VectorCopy( ent->s.apos.trBase, ent->r.currentAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 380
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1541
;1540:
;1541:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1542
;1542:}
LABELV $585
endproc SP_func_rotating 16 8
export SP_func_bobbing
proc SP_func_bobbing 28 12
line 1564
;1543:
;1544:
;1545:/*
;1546:===============================================================================
;1547:
;1548:BOBBING
;1549:
;1550:===============================================================================
;1551:*/
;1552:
;1553:
;1554:/*QUAKED func_bobbing (0 .5 .8) ? X_AXIS Y_AXIS
;1555:Normally bobs on the Z axis
;1556:"model2"	.md3 model to also draw
;1557:"height"	amplitude of bob (32 default)
;1558:"speed"		seconds to complete a bob cycle (4 default)
;1559:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1560:"dmg"		damage to inflict when blocked (2 default)
;1561:"color"		constantLight color
;1562:"light"		constantLight radius
;1563:*/
;1564:void SP_func_bobbing (gentity_t *ent) {
line 1568
;1565:	float		height;
;1566:	float		phase;
;1567:
;1568:	G_SpawnFloat( "speed", "4", &ent->speed );
ADDRGP4 $499
ARGP4
ADDRGP4 $522
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1569
;1569:	G_SpawnFloat( "height", "32", &height );
ADDRGP4 $505
ARGP4
ADDRGP4 $595
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1570
;1570:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $439
ARGP4
ADDRGP4 $440
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1571
;1571:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $596
ARGP4
ADDRGP4 $455
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1573
;1572:
;1573:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1574
;1574:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1576
;1575:
;1576:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1577
;1577:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1579
;1578:
;1579:	ent->s.pos.trDuration = ent->speed * 1000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRP4
CNSTI4 608
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1580
;1580:	ent->s.pos.trTime = ent->s.pos.trDuration * phase;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1581
;1581:	ent->s.pos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 4
ASGNI4
line 1584
;1582:
;1583:	// set the axis of bobbing
;1584:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $597
line 1585
;1585:		ent->s.pos.trDelta[0] = height;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1586
;1586:	} else if ( ent->spawnflags & 2 ) {
ADDRGP4 $598
JUMPV
LABELV $597
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $599
line 1587
;1587:		ent->s.pos.trDelta[1] = height;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1588
;1588:	} else {
ADDRGP4 $600
JUMPV
LABELV $599
line 1589
;1589:		ent->s.pos.trDelta[2] = height;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1590
;1590:	}
LABELV $600
LABELV $598
line 1591
;1591:}
LABELV $594
endproc SP_func_bobbing 28 12
export SP_func_pendulum
proc SP_func_pendulum 44 12
line 1613
;1592:
;1593:/*
;1594:===============================================================================
;1595:
;1596:PENDULUM
;1597:
;1598:===============================================================================
;1599:*/
;1600:
;1601:
;1602:/*QUAKED func_pendulum (0 .5 .8) ?
;1603:You need to have an origin brush as part of this entity.
;1604:Pendulums always swing north / south on unrotated models.  Add an angles field to the model to allow rotation in other directions.
;1605:Pendulum frequency is a physical constant based on the length of the beam and gravity.
;1606:"model2"	.md3 model to also draw
;1607:"speed"		the number of degrees each way the pendulum swings, (30 default)
;1608:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1609:"dmg"		damage to inflict when blocked (2 default)
;1610:"color"		constantLight color
;1611:"light"		constantLight radius
;1612:*/
;1613:void SP_func_pendulum(gentity_t *ent) {
line 1619
;1614:	float		freq;
;1615:	float		length;
;1616:	float		phase;
;1617:	float		speed;
;1618:
;1619:	G_SpawnFloat( "speed", "30", &speed );
ADDRGP4 $499
ARGP4
ADDRGP4 $602
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1620
;1620:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $439
ARGP4
ADDRGP4 $440
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1621
;1621:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $596
ARGP4
ADDRGP4 $455
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1623
;1622:
;1623:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1626
;1624:
;1625:	// find pendulum length
;1626:	length = fabs( ent->r.mins[2] );
ADDRFP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1627
;1627:	if ( length < 8 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1090519040
GEF4 $603
line 1628
;1628:		length = 8;
ADDRLP4 0
CNSTF4 1090519040
ASGNF4
line 1629
;1629:	}
LABELV $603
line 1631
;1630:
;1631:	freq = 1 / ( M_PI * 2 ) * sqrt( g_gravity.value / ( 3 * length ) );
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1042479491
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1633
;1632:
;1633:	ent->s.pos.trDuration = ( 1000 / freq );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1635
;1634:
;1635:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1637
;1636:
;1637:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1638
;1638:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1640
;1639:
;1640:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1642
;1641:
;1642:	ent->s.apos.trDuration = 1000 / freq;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1643
;1643:	ent->s.apos.trTime = ent->s.apos.trDuration * phase;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1644
;1644:	ent->s.apos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 4
ASGNI4
line 1645
;1645:	ent->s.apos.trDelta[2] = speed;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1646
;1646:}
LABELV $601
endproc SP_func_pendulum 44 12
export BreakableBrushDie
proc BreakableBrushDie 48 24
line 1663
;1647:
;1648:/*
;1649:===============================================================================
;1650:
;1651:BREAKABLE BRUSH
;1652:
;1653:===============================================================================
;1654:*/
;1655:#define DEBRIS_SPECIALCASE_ROCK			-1
;1656:#define DEBRIS_SPECIALCASE_CHUNKS		-2
;1657:#define DEBRIS_SPECIALCASE_WOOD			-3
;1658:#define DEBRIS_SPECIALCASE_GLASS		-4
;1659:
;1660:int gExplSound;
;1661:
;1662:void BreakableBrushDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1663:{
line 1666
;1664:	gentity_t *te;
;1665:	vec3_t dif, u;
;1666:	int defaultradius = 128;
ADDRLP4 28
CNSTI4 128
ASGNI4
line 1668
;1667:
;1668:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1670
;1669:
;1670:	dif[0] = (self->r.absmax[0]+self->r.absmin[0])/2;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1671
;1671:	dif[1] = (self->r.absmax[1]+self->r.absmin[1])/2;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1672
;1672:	dif[2] = (self->r.absmax[2]+self->r.absmin[2])/2;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1674
;1673:
;1674:	G_SoundIndex("sound/movers/objects/objectHit.wav");
ADDRGP4 $609
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 1676
;1675:
;1676:	G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1678
;1677:
;1678:	if (self->boltpoint2)
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
CNSTI4 0
EQI4 $610
line 1679
;1679:	{
line 1680
;1680:		te = G_TempEntity( dif, EV_DEBRIS );
ADDRLP4 0
ARGP4
CNSTI4 72
ARGI4
ADDRLP4 44
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 44
INDIRP4
ASGNP4
line 1681
;1681:		te->s.eventParm = self->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 256
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1682
;1682:		te->s.weapon = self->boltpoint1;
ADDRLP4 12
INDIRP4
CNSTI4 276
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRI4
ASGNI4
line 1683
;1683:		te->s.trickedentindex = self->boltpoint2; //debris model index
ADDRLP4 12
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ASGNI4
line 1684
;1684:		VectorCopy(self->r.maxs, te->s.origin);
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 1685
;1685:		VectorCopy(self->r.mins, te->s.angles);
ADDRLP4 12
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRB
ASGNB 12
line 1686
;1686:	}
LABELV $610
line 1688
;1687:
;1688:	VectorCopy(dif, self->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 1690
;1689:
;1690:	if (self->splashDamage)
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CNSTI4 0
EQI4 $612
line 1691
;1691:	{
line 1692
;1692:		if (self->splashRadius)
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
CNSTI4 0
EQI4 $614
line 1693
;1693:		{
line 1694
;1694:			defaultradius = self->splashRadius;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
ASGNI4
line 1695
;1695:		}
LABELV $614
line 1697
;1696:
;1697:		G_RadiusDamage(dif, self, self->splashDamage, defaultradius, self, MOD_UNKNOWN);
ADDRLP4 0
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 696
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 G_RadiusDamage
CALLI4
pop
line 1698
;1698:		u[YAW] = 0;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1699
;1699:		u[PITCH] = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1700
;1700:		u[ROLL] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1701
;1701:		G_PlayEffect(EFFECT_EXPLOSION, dif, u);
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_PlayEffect
CALLP4
pop
line 1702
;1702:		G_Sound(self, CHAN_BODY, gExplSound);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 gExplSound
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1703
;1703:	}
LABELV $612
line 1705
;1704:
;1705:	G_Sound(self, CHAN_WEAPON, self->boltpoint3);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 1707
;1706:
;1707:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1708
;1708:}
LABELV $606
endproc BreakableBrushDie 48 24
export BreakableBrushPain
proc BreakableBrushPain 0 0
line 1711
;1709:
;1710:void BreakableBrushPain(gentity_t *self, gentity_t *attacker, int damage)
;1711:{
line 1712
;1712:}
LABELV $618
endproc BreakableBrushPain 0 0
export BrushThink
proc BrushThink 4 20
line 1715
;1713:
;1714:void BrushThink(gentity_t *self)
;1715:{
line 1716
;1716:	self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTP4 0
ASGNP4
line 1717
;1717:	BreakableBrushDie(self, self->enemy, self->activator, 100, MOD_UNKNOWN);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRP4
ARGP4
CNSTI4 100
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BreakableBrushDie
CALLV
pop
line 1718
;1718:}
LABELV $619
endproc BrushThink 4 20
export BreakableBrushUse
proc BreakableBrushUse 4 0
line 1721
;1719:
;1720:void BreakableBrushUse(gentity_t *self, gentity_t *other, gentity_t *activator)
;1721:{
line 1722
;1722:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1723
;1723:	self->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 1725
;1724:
;1725:	self->think = BrushThink;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 BrushThink
ASGNP4
line 1726
;1726:	self->nextthink = level.time + self->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 1727
;1727:}
LABELV $620
endproc BreakableBrushUse 4 0
export SP_func_breakable
proc SP_func_breakable 56 12
line 1760
;1728:
;1729:/*QUAKED func_breakable (0 .5 .8) ? INVINCIBLE
;1730:Breakable brush
;1731:
;1732:INVINCIBLE		Can only be destroyed by being used
;1733:
;1734:"target"		target to fire when destroyed
;1735:"targetname"	entities with matching target will fire it
;1736:"model2"		.md3 model to also draw
;1737:"color"			constantLight color
;1738:"light"			constantLight radius
;1739:"health"		object's health
;1740:"dmg"			Specifying this will make the object explode when destroyed
;1741:"dmgrad"		Radius for explosion of dmg is set
;1742:"debrismodel"	Model of debris chunks to throw when object is destroyed.
;1743:				There are special cases for this item rather than using a
;1744:				model name also, they are:
;1745:
;1746:  rock
;1747:  chunks
;1748:  wood
;1749:  glass
;1750:  none
;1751:
;1752:  Using one of these types will throw random chunks of that type rather
;1753:  than one model, except for "none" which will make it so no debris is
;1754:  spawned.
;1755:
;1756:"debrissound"	Sound to play when debris hits a surface. Default is none.
;1757:"breaksound"	Sound to play when destroyed
;1758:"wait"			Time to wait (in ms) before activating once used
;1759:*/
;1760:void SP_func_breakable( gentity_t *ent ) {
line 1763
;1761:	char *model, *sound, *debrissound;
;1762:
;1763:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1764
;1764:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1766
;1765:
;1766:	G_SpawnInt( "health", "1", &ent->health );
ADDRGP4 $454
ARGP4
ADDRGP4 $424
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1768
;1767:
;1768:	G_SpawnInt( "dmg", "0", &ent->splashDamage);
ADDRGP4 $439
ARGP4
ADDRGP4 $455
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1769
;1769:	G_SpawnInt( "dmgrad", "0", &ent->splashRadius);
ADDRGP4 $623
ARGP4
ADDRGP4 $455
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1771
;1770:
;1771:	G_SpawnFloat( "wait", "0", &ent->wait);
ADDRGP4 $501
ARGP4
ADDRGP4 $455
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1773
;1772:
;1773:	G_SpawnString( "debrismodel", "rock", &model);
ADDRGP4 $624
ARGP4
ADDRGP4 $625
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1775
;1774:
;1775:	G_SpawnString( "debrissound", "", &debrissound);
ADDRGP4 $626
ARGP4
ADDRGP4 $627
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1777
;1776:
;1777:	G_SpawnString( "breaksound", "sound/movers/objects/objectBreak.wav", &sound);
ADDRGP4 $628
ARGP4
ADDRGP4 $629
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 1779
;1778:
;1779:	ent->boltpoint3 = G_SoundIndex(sound);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1781
;1780:	
;1781:	gExplSound = G_SoundIndex("sound/weapons/explosions/cargoexplode.wav");
ADDRGP4 $630
ARGP4
ADDRLP4 20
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 gExplSound
ADDRLP4 20
INDIRI4
ASGNI4
line 1783
;1782:
;1783:	if (debrissound && debrissound[0])
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $631
line 1784
;1784:	{
line 1785
;1785:		ent->boltpoint1 = G_SoundIndex(debrissound);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 1786
;1786:	}
ADDRGP4 $632
JUMPV
LABELV $631
line 1788
;1787:	else
;1788:	{
line 1789
;1789:		ent->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 1790
;1790:	}
LABELV $632
line 1792
;1791:
;1792:	ent->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 1794
;1793:
;1794:	if (strcmp(model, "rock") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $625
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $633
line 1795
;1795:	{
line 1796
;1796:		ent->boltpoint2 = DEBRIS_SPECIALCASE_ROCK;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 -1
ASGNI4
line 1797
;1797:	}
ADDRGP4 $634
JUMPV
LABELV $633
line 1798
;1798:	else if (strcmp(model, "chunks") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $637
ARGP4
ADDRLP4 32
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $635
line 1799
;1799:	{
line 1800
;1800:		ent->boltpoint2 = DEBRIS_SPECIALCASE_CHUNKS;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 -2
ASGNI4
line 1801
;1801:	}
ADDRGP4 $636
JUMPV
LABELV $635
line 1802
;1802:	else if (strcmp(model, "wood") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $640
ARGP4
ADDRLP4 36
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $638
line 1803
;1803:	{
line 1804
;1804:		ent->boltpoint2 = DEBRIS_SPECIALCASE_WOOD;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 -3
ASGNI4
line 1805
;1805:	}
ADDRGP4 $639
JUMPV
LABELV $638
line 1806
;1806:	else if (strcmp(model, "glass") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $643
ARGP4
ADDRLP4 40
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $641
line 1807
;1807:	{
line 1808
;1808:		ent->boltpoint2 = DEBRIS_SPECIALCASE_GLASS;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 -4
ASGNI4
line 1809
;1809:	}
ADDRGP4 $642
JUMPV
LABELV $641
line 1810
;1810:	else if (strcmp(model, "none") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $646
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $644
line 1811
;1811:	{
line 1812
;1812:		ent->boltpoint2 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
CNSTI4 0
ASGNI4
line 1813
;1813:	}
ADDRGP4 $645
JUMPV
LABELV $644
line 1815
;1814:	else
;1815:	{
line 1816
;1816:		ent->boltpoint2 = G_ModelIndex(model);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 1817
;1817:	}
LABELV $645
LABELV $642
LABELV $639
LABELV $636
LABELV $634
line 1819
;1818:
;1819:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1820
;1820:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1821
;1821:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $647
line 1822
;1822:	{
line 1823
;1823:		ent->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 1824
;1824:	}
LABELV $647
line 1826
;1825:
;1826:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1828
;1827:
;1828:	if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $649
line 1829
;1829:	{
line 1830
;1830:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1831
;1831:	}
ADDRGP4 $650
JUMPV
LABELV $649
line 1833
;1832:	else
;1833:	{
line 1834
;1834:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1835
;1835:	}
LABELV $650
line 1837
;1836:
;1837:	ent->die = BreakableBrushDie;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 BreakableBrushDie
ASGNP4
line 1838
;1838:	ent->use = BreakableBrushUse;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 BreakableBrushUse
ASGNP4
line 1839
;1839:	ent->pain = BreakableBrushPain;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 BreakableBrushPain
ASGNP4
line 1840
;1840:}
LABELV $622
endproc SP_func_breakable 56 12
export GlassDie
proc GlassDie 32 8
line 1850
;1841:
;1842:/*
;1843:===============================================================================
;1844:
;1845:GLASS
;1846:
;1847:===============================================================================
;1848:*/
;1849:void GlassDie(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1850:{
line 1854
;1851:	gentity_t *te;
;1852:	vec3_t dif;
;1853:
;1854:	if (self->bolt_Head)
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 0
EQI4 $652
line 1855
;1855:	{ //was already destroyed, do not retrigger it
line 1856
;1856:		return;
ADDRGP4 $651
JUMPV
LABELV $652
line 1859
;1857:	}
;1858:
;1859:	self->bolt_Head = 1;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 1
ASGNI4
line 1861
;1860:
;1861:	dif[0] = (self->r.absmax[0]+self->r.absmin[0])/2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1862
;1862:	dif[1] = (self->r.absmax[1]+self->r.absmin[1])/2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 20
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1863
;1863:	dif[2] = (self->r.absmax[2]+self->r.absmin[2])/2;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 24
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1865
;1864:
;1865:	G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1867
;1866:
;1867:	self->splashRadius = 40; // ?? some random number, maybe it's ok?
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
CNSTI4 40
ASGNI4
line 1869
;1868:
;1869:	te = G_TempEntity( dif, EV_GLASS_SHATTER );
ADDRLP4 4
ARGP4
CNSTI4 71
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1870
;1870:	te->s.genericenemyindex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1871
;1871:	VectorCopy(self->pos1, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRB
ASGNB 12
line 1872
;1872:	VectorCopy(self->pos2, te->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRB
ASGNB 12
line 1873
;1873:	te->s.trickedentindex = (int)self->splashRadius;
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRI4
ASGNI4
line 1874
;1874:	te->s.pos.trTime = (int)self->boltpoint3;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
ASGNI4
line 1876
;1875:
;1876:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1877
;1877:}
LABELV $651
endproc GlassDie 32 8
export GlassDie_Old
proc GlassDie_Old 32 8
line 1880
;1878:
;1879:void GlassDie_Old(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;1880:{
line 1884
;1881:	gentity_t *te;
;1882:	vec3_t dif;
;1883:
;1884:	dif[0] = (self->r.absmax[0]+self->r.absmin[0])/2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
CNSTI4 356
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1885
;1885:	dif[1] = (self->r.absmax[1]+self->r.absmin[1])/2;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 20
INDIRP4
CNSTI4 360
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1886
;1886:	dif[2] = (self->r.absmax[2]+self->r.absmin[2])/2;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 24
INDIRP4
CNSTI4 364
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 352
ADDP4
INDIRF4
ADDF4
CNSTF4 1073741824
DIVF4
ASGNF4
line 1888
;1887:
;1888:	G_UseTargets(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1890
;1889:
;1890:	te = G_TempEntity( dif, EV_GLASS_SHATTER );
ADDRLP4 4
ARGP4
CNSTI4 71
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1891
;1891:	te->s.genericenemyindex = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1892
;1892:	VectorCopy(self->r.maxs, te->s.origin);
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 328
ADDP4
INDIRB
ASGNB 12
line 1893
;1893:	VectorCopy(self->r.mins, te->s.angles);
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 316
ADDP4
INDIRB
ASGNB 12
line 1895
;1894:
;1895:	G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1896
;1896:}
LABELV $656
endproc GlassDie_Old 32 8
export GlassPain
proc GlassPain 0 0
line 1899
;1897:
;1898:void GlassPain(gentity_t *self, gentity_t *attacker, int damage)
;1899:{
line 1902
;1900:	//G_Printf("Mr. Glass says: PLZ NO IT HURTS\n");
;1901:	//Make "cracking" sound?
;1902:}
LABELV $659
endproc GlassPain 0 0
export GlassUse
proc GlassUse 60 20
line 1905
;1903:
;1904:void GlassUse(gentity_t *self, gentity_t *other, gentity_t *activator)
;1905:{
line 1909
;1906:	vec3_t temp1, temp2;
;1907:
;1908:	//no direct object to blame for the break, so fill the values with whatever
;1909:	VectorAdd( self->r.mins, self->r.maxs, temp1 );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 28
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1910
;1910:	VectorScale( temp1, 0.5f, temp1 );
ADDRLP4 32
CNSTF4 1056964608
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 32
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+8
CNSTF4 1056964608
ADDRLP4 0+8
INDIRF4
MULF4
ASGNF4
line 1912
;1911:
;1912:	VectorAdd( other->r.mins, other->r.maxs, temp2 );
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 316
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 328
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRP4
CNSTI4 320
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 332
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 40
INDIRP4
CNSTI4 324
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 336
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1913
;1913:	VectorScale( temp2, 0.5f, temp2 );
ADDRLP4 44
CNSTF4 1056964608
ASGNF4
ADDRLP4 12
ADDRLP4 44
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 44
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12+8
CNSTF4 1056964608
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1915
;1914:
;1915:	VectorSubtract( temp1, temp2, self->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 1916
;1916:	VectorCopy( temp1, self->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 1918
;1917:
;1918:	VectorNormalize( self->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1919
;1919:	VectorScale( self->pos2, 390, self->pos2 );
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1136852992
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTF4 1136852992
ADDRLP4 52
INDIRP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTF4 1136852992
ADDRLP4 56
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1921
;1920:
;1921:	GlassDie(self, other, activator, 100, MOD_UNKNOWN);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 100
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 GlassDie
CALLV
pop
line 1922
;1922:}
LABELV $660
endproc GlassUse 60 20
export SP_func_glass
proc SP_func_glass 12 12
line 1931
;1923:
;1924:/*QUAKED func_glass (0 .5 .8) ?
;1925:Breakable glass
;1926:"model2"	.md3 model to also draw
;1927:"color"		constantLight color
;1928:"light"		constantLight radius
;1929:"maxshards"	Max number of shards to spawn on glass break
;1930:*/
;1931:void SP_func_glass( gentity_t *ent ) {
line 1932
;1932:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1933
;1933:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1935
;1934:
;1935:	ent->r.svFlags = SVF_GLASS_BRUSH;
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 134217728
ASGNI4
line 1937
;1936:
;1937:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1938
;1938:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1939
;1939:	if (!ent->health)
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
NEI4 $678
line 1940
;1940:	{
line 1941
;1941:		ent->health = 1;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 1
ASGNI4
line 1942
;1942:	}
LABELV $678
line 1944
;1943:
;1944:	G_SpawnInt("maxshards", "0", &ent->boltpoint3);
ADDRGP4 $680
ARGP4
ADDRGP4 $455
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1946
;1945:
;1946:	ent->boltpoint1 = 0;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTI4 0
ASGNI4
line 1948
;1947:
;1948:	ent->boltpoint4 = 1;
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
CNSTI4 1
ASGNI4
line 1950
;1949:
;1950:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1952
;1951:
;1952:	if (ent->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $681
line 1953
;1953:	{
line 1954
;1954:		ent->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 1955
;1955:	}
ADDRGP4 $682
JUMPV
LABELV $681
line 1957
;1956:	else
;1957:	{
line 1958
;1958:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 1959
;1959:	}
LABELV $682
line 1961
;1960:
;1961:	ent->die = GlassDie;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 GlassDie
ASGNP4
line 1962
;1962:	ent->use = GlassUse;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 GlassUse
ASGNP4
line 1963
;1963:	ent->pain = GlassPain;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 GlassPain
ASGNP4
line 1964
;1964:}
LABELV $677
endproc SP_func_glass 12 12
export func_wait_return_solid
proc func_wait_return_solid 28 8
line 1970
;1965:
;1966:void func_usable_use (gentity_t *self, gentity_t *other, gentity_t *activator);
;1967:
;1968:extern gentity_t	*G_TestEntityPosition( gentity_t *ent );
;1969:void func_wait_return_solid( gentity_t *self )
;1970:{
line 1972
;1971:	//once a frame, see if it's clear.
;1972:	self->clipmask = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 256
ASGNI4
line 1973
;1973:	if ( !(self->spawnflags&16) || G_TestEntityPosition( self ) == NULL )
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $686
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $684
LABELV $686
line 1974
;1974:	{
line 1975
;1975:		trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1976
;1976:		InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1977
;1977:		VectorCopy( self->s.origin, self->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1978
;1978:		VectorCopy( self->s.origin, self->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1979
;1979:		self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1980
;1980:		self->s.eFlags &= ~EF_NODRAW;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1981
;1981:		self->use = func_usable_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 func_usable_use
ASGNP4
line 1982
;1982:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 1989
;1983:
;1984:		//FIXME: Animations?
;1985:		/*if ( self->s.eFlags & EF_ANIM_ONCE )
;1986:		{//Start our anim
;1987:			self->s.frame = 0;
;1988:		}*/
;1989:	}
ADDRGP4 $685
JUMPV
LABELV $684
line 1991
;1990:	else
;1991:	{
line 1992
;1992:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 1993
;1993:		self->think = func_wait_return_solid;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 func_wait_return_solid
ASGNP4
line 1994
;1994:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1995
;1995:	}
LABELV $685
line 1996
;1996:}
LABELV $683
endproc func_wait_return_solid 28 8
export func_usable_think
proc func_usable_think 4 0
line 1999
;1997:
;1998:void func_usable_think( gentity_t *self )
;1999:{
line 2000
;2000:	if ( self->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $689
line 2001
;2001:	{
line 2002
;2002:		self->r.svFlags |= SVF_PLAYER_USABLE;	//Replace the usable flag
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2003
;2003:		self->use = func_usable_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 func_usable_use
ASGNP4
line 2004
;2004:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTP4 0
ASGNP4
line 2005
;2005:	}
LABELV $689
line 2006
;2006:}
LABELV $688
endproc func_usable_think 4 0
export func_usable_use
proc func_usable_use 12 8
line 2009
;2007:
;2008:void func_usable_use (gentity_t *self, gentity_t *other, gentity_t *activator)
;2009:{//Toggle on and off
line 2025
;2010:	//FIXME: Animation?
;2011:	/*
;2012:	if ( self->s.eFlags & EF_SHADER_ANIM )
;2013:	{//animate shader when used
;2014:		self->s.frame++;//inc frame
;2015:		if ( self->s.frame > self->endFrame )
;2016:		{//wrap around
;2017:			self->s.frame = 0;
;2018:		}
;2019:		if ( self->target && self->target[0] )
;2020:		{
;2021:			G_UseTargets( self, activator );
;2022:		}
;2023:	}
;2024:	else*/
;2025:	if ( self->spawnflags & 8 )
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $692
line 2026
;2026:	{//ALWAYS_ON
line 2028
;2027:		//Remove the ability to use the entity directly
;2028:		self->r.svFlags &= ~SVF_PLAYER_USABLE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 304
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
line 2030
;2029:		//also remove ability to call any use func at all!
;2030:		self->use = 0;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
CNSTP4 0
ASGNP4
line 2032
;2031:		
;2032:		if(self->target && self->target[0])
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $694
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $694
line 2033
;2033:		{
line 2034
;2034:			G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2035
;2035:		}
LABELV $694
line 2037
;2036:		
;2037:		if ( self->wait )
ADDRFP4 0
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
CNSTF4 0
EQF4 $691
line 2038
;2038:		{
line 2039
;2039:			self->think = func_usable_think;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRGP4 func_usable_think
ASGNP4
line 2040
;2040:			self->nextthink = level.time + ( self->wait * 1000 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 8
INDIRP4
CNSTI4 756
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2041
;2041:		}
line 2043
;2042:
;2043:		return;
ADDRGP4 $691
JUMPV
LABELV $692
line 2045
;2044:	}
;2045:	else if ( !self->count )
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
NEI4 $699
line 2046
;2046:	{//become solid again
line 2047
;2047:		self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 2048
;2048:		func_wait_return_solid( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_wait_return_solid
CALLV
pop
line 2049
;2049:	}
ADDRGP4 $700
JUMPV
LABELV $699
line 2051
;2050:	else
;2051:	{
line 2052
;2052:		self->s.solid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 2053
;2053:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 2054
;2054:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 2055
;2055:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 2056
;2056:		self->s.eFlags |= EF_NODRAW;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2057
;2057:		self->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 2059
;2058:
;2059:		if(self->target && self->target[0])
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $701
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $701
line 2060
;2060:		{
line 2061
;2061:			G_UseTargets(self, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 2062
;2062:		}
LABELV $701
line 2063
;2063:		self->think = 0;
ADDRFP4 0
INDIRP4
CNSTI4 636
ADDP4
CNSTP4 0
ASGNP4
line 2064
;2064:		self->nextthink = -1;
ADDRFP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 -1
ASGNI4
line 2065
;2065:	}
LABELV $700
line 2066
;2066:}
LABELV $691
endproc func_usable_use 12 8
export func_usable_pain
proc func_usable_pain 8 12
line 2069
;2067:
;2068:void func_usable_pain(gentity_t *self, gentity_t *attacker, int damage)
;2069:{
line 2070
;2070:	self->use(self, attacker, attacker);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CALLV
pop
line 2071
;2071:}
LABELV $703
endproc func_usable_pain 8 12
export func_usable_die
proc func_usable_die 4 12
line 2074
;2072:
;2073:void func_usable_die(gentity_t *self, gentity_t *inflictor, gentity_t *attacker, int damage, int mod)
;2074:{
line 2075
;2075:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 0
ASGNI4
line 2076
;2076:	self->use(self, inflictor, attacker);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CALLV
pop
line 2077
;2077:}
LABELV $704
endproc func_usable_die 4 12
export SP_func_usable
proc SP_func_usable 20 8
line 2097
;2078:
;2079:/*QUAKED func_usable (0 .5 .8) ? STARTOFF x x ALWAYS_ON x x x x
;2080:START_OFF - the wall will not be there
;2081:ALWAYS_ON - Doesn't toggle on and off when used, just runs usescript and fires target
;2082:
;2083:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;2084:"targetname" - When used, will toggle on and off
;2085:"target"	Will fire this target every time it is toggled OFF
;2086:"model2"	.md3 model to also draw
;2087:"color"		constantLight color
;2088:"light"		constantLight radius
;2089:"usescript" script to run when turned on
;2090:"deathscript"  script to run when turned off
;2091:"wait"		amount of time before the object is usable again (only valid with ALWAYS_ON flag)
;2092:"health"	if it has health, it will be used whenever shot at/killed - if you want it to only be used once this way, set health to 1
;2093:"endframe"	Will make it animate to next shader frame when used, not turn on/off... set this to number of frames in the shader, minus 1
;2094:*/
;2095:
;2096:void SP_func_usable( gentity_t *self ) 
;2097:{
line 2098
;2098:	trap_SetBrushModel( self, self->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 2099
;2099:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 2100
;2100:	VectorCopy( self->s.origin, self->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2101
;2101:	VectorCopy( self->s.origin, self->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 2103
;2102:
;2103:	self->count = 1;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 2104
;2104:	if (self->spawnflags & 1)
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $706
line 2105
;2105:	{
line 2106
;2106:		self->s.solid = 0;
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 2107
;2107:		self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 2108
;2108:		self->clipmask = 0;
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 0
ASGNI4
line 2109
;2109:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 12
ADDRFP4 0
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
line 2110
;2110:		self->s.eFlags |= EF_NODRAW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2111
;2111:		self->count = 0;
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 2112
;2112:	}
LABELV $706
line 2127
;2113:
;2114:	//FIXME: Animation?
;2115:	/*
;2116:	if (self->spawnflags & 2)
;2117:	{
;2118:		self->s.eFlags |= EF_ANIM_ALLFAST;
;2119:	}
;2120:
;2121:	if (self->spawnflags & 4)
;2122:	{//FIXME: need to be able to do change to something when it's done?  Or not be usable until it's done?
;2123:		self->s.eFlags |= EF_ANIM_ONCE;
;2124:	}
;2125:	*/
;2126:
;2127:	self->r.svFlags |= SVF_PLAYER_USABLE;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2129
;2128:
;2129:	self->use = func_usable_use;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
ADDRGP4 func_usable_use
ASGNP4
line 2131
;2130:
;2131:	if ( self->health )
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRI4
CNSTI4 0
EQI4 $708
line 2132
;2132:	{
line 2133
;2133:		self->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
CNSTI4 1
ASGNI4
line 2134
;2134:		self->die = func_usable_die;
ADDRFP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRGP4 func_usable_die
ASGNP4
line 2135
;2135:		self->pain = func_usable_pain;
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
ADDRGP4 func_usable_pain
ASGNP4
line 2136
;2136:	}
LABELV $708
line 2146
;2137:
;2138:	//FIXME: Animation?
;2139:	/*if ( self->endFrame > 0 )
;2140:	{
;2141:		self->s.frame = self->startFrame = 0;
;2142:		self->s.eFlags |= EF_SHADER_ANIM;
;2143:		self->s.time = self->endFrame + 1;
;2144:	}*/
;2145:
;2146:	trap_LinkEntity (self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 2147
;2147:}
LABELV $705
endproc SP_func_usable 20 8
bss
export gExplSound
align 4
LABELV gExplSound
skip 4
export pushed_p
align 4
LABELV pushed_p
skip 4
export pushed
align 4
LABELV pushed
skip 32768
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
LABELV $680
char 1 109
char 1 97
char 1 120
char 1 115
char 1 104
char 1 97
char 1 114
char 1 100
char 1 115
char 1 0
align 1
LABELV $646
char 1 110
char 1 111
char 1 110
char 1 101
char 1 0
align 1
LABELV $643
char 1 103
char 1 108
char 1 97
char 1 115
char 1 115
char 1 0
align 1
LABELV $640
char 1 119
char 1 111
char 1 111
char 1 100
char 1 0
align 1
LABELV $637
char 1 99
char 1 104
char 1 117
char 1 110
char 1 107
char 1 115
char 1 0
align 1
LABELV $630
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
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 115
char 1 105
char 1 111
char 1 110
char 1 115
char 1 47
char 1 99
char 1 97
char 1 114
char 1 103
char 1 111
char 1 101
char 1 120
char 1 112
char 1 108
char 1 111
char 1 100
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $629
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 66
char 1 114
char 1 101
char 1 97
char 1 107
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $628
char 1 98
char 1 114
char 1 101
char 1 97
char 1 107
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $627
char 1 0
align 1
LABELV $626
char 1 100
char 1 101
char 1 98
char 1 114
char 1 105
char 1 115
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $625
char 1 114
char 1 111
char 1 99
char 1 107
char 1 0
align 1
LABELV $624
char 1 100
char 1 101
char 1 98
char 1 114
char 1 105
char 1 115
char 1 109
char 1 111
char 1 100
char 1 101
char 1 108
char 1 0
align 1
LABELV $623
char 1 100
char 1 109
char 1 103
char 1 114
char 1 97
char 1 100
char 1 0
align 1
LABELV $609
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 115
char 1 47
char 1 111
char 1 98
char 1 106
char 1 101
char 1 99
char 1 116
char 1 72
char 1 105
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $602
char 1 51
char 1 48
char 1 0
align 1
LABELV $596
char 1 112
char 1 104
char 1 97
char 1 115
char 1 101
char 1 0
align 1
LABELV $595
char 1 51
char 1 50
char 1 0
align 1
LABELV $582
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 116
char 1 114
char 1 97
char 1 105
char 1 110
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 111
char 1 117
char 1 116
char 1 32
char 1 97
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $572
char 1 112
char 1 97
char 1 116
char 1 104
char 1 95
char 1 99
char 1 111
char 1 114
char 1 110
char 1 101
char 1 114
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 110
char 1 111
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 110
char 1 97
char 1 109
char 1 101
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 10
char 1 0
align 1
LABELV $568
char 1 112
char 1 97
char 1 116
char 1 104
char 1 95
char 1 99
char 1 111
char 1 114
char 1 110
char 1 101
char 1 114
char 1 0
align 1
LABELV $567
char 1 84
char 1 114
char 1 97
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 114
char 1 110
char 1 101
char 1 114
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 111
char 1 117
char 1 116
char 1 32
char 1 97
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 32
char 1 112
char 1 97
char 1 116
char 1 104
char 1 95
char 1 99
char 1 111
char 1 114
char 1 110
char 1 101
char 1 114
char 1 10
char 1 0
align 1
LABELV $561
char 1 84
char 1 114
char 1 97
char 1 105
char 1 110
char 1 32
char 1 99
char 1 111
char 1 114
char 1 110
char 1 101
char 1 114
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 111
char 1 117
char 1 116
char 1 32
char 1 97
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 10
char 1 0
align 1
LABELV $552
char 1 102
char 1 117
char 1 110
char 1 99
char 1 95
char 1 116
char 1 114
char 1 97
char 1 105
char 1 110
char 1 32
char 1 97
char 1 116
char 1 32
char 1 37
char 1 115
char 1 32
char 1 119
char 1 105
char 1 116
char 1 104
char 1 32
char 1 97
char 1 110
char 1 32
char 1 117
char 1 110
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 32
char 1 116
char 1 97
char 1 114
char 1 103
char 1 101
char 1 116
char 1 10
char 1 0
align 1
LABELV $522
char 1 52
char 1 0
align 1
LABELV $517
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 115
char 1 119
char 1 105
char 1 116
char 1 99
char 1 104
char 1 101
char 1 115
char 1 47
char 1 115
char 1 119
char 1 105
char 1 116
char 1 99
char 1 104
char 1 51
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $516
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 117
char 1 115
char 1 101
char 1 0
align 1
LABELV $505
char 1 104
char 1 101
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $502
char 1 100
char 1 101
char 1 108
char 1 97
char 1 121
char 1 0
align 1
LABELV $501
char 1 119
char 1 97
char 1 105
char 1 116
char 1 0
align 1
LABELV $500
char 1 50
char 1 48
char 1 48
char 1 0
align 1
LABELV $499
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $482
char 1 112
char 1 108
char 1 97
char 1 116
char 1 95
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 0
align 1
LABELV $455
char 1 48
char 1 0
align 1
LABELV $454
char 1 104
char 1 101
char 1 97
char 1 108
char 1 116
char 1 104
char 1 0
align 1
LABELV $440
char 1 50
char 1 0
align 1
LABELV $439
char 1 100
char 1 109
char 1 103
char 1 0
align 1
LABELV $438
char 1 56
char 1 0
align 1
LABELV $437
char 1 108
char 1 105
char 1 112
char 1 0
align 1
LABELV $432
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 49
char 1 109
char 1 111
char 1 118
char 1 101
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $431
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 109
char 1 111
char 1 118
char 1 101
char 1 0
align 1
LABELV $430
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 49
char 1 115
char 1 116
char 1 111
char 1 112
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $429
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 116
char 1 111
char 1 112
char 1 0
align 1
LABELV $428
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 47
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 115
char 1 47
char 1 100
char 1 111
char 1 111
char 1 114
char 1 49
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 46
char 1 119
char 1 97
char 1 118
char 1 0
align 1
LABELV $427
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 115
char 1 116
char 1 97
char 1 114
char 1 116
char 1 0
align 1
LABELV $424
char 1 49
char 1 0
align 1
LABELV $423
char 1 115
char 1 111
char 1 117
char 1 110
char 1 100
char 1 0
align 1
LABELV $418
char 1 100
char 1 111
char 1 111
char 1 114
char 1 95
char 1 116
char 1 114
char 1 105
char 1 103
char 1 103
char 1 101
char 1 114
char 1 0
align 1
LABELV $344
char 1 49
char 1 32
char 1 49
char 1 32
char 1 49
char 1 0
align 1
LABELV $343
char 1 99
char 1 111
char 1 108
char 1 111
char 1 114
char 1 0
align 1
LABELV $342
char 1 108
char 1 105
char 1 103
char 1 104
char 1 116
char 1 0
align 1
LABELV $341
char 1 49
char 1 48
char 1 48
char 1 0
align 1
LABELV $340
char 1 110
char 1 111
char 1 105
char 1 115
char 1 101
char 1 0
align 1
LABELV $304
char 1 82
char 1 101
char 1 97
char 1 99
char 1 104
char 1 101
char 1 100
char 1 95
char 1 66
char 1 105
char 1 110
char 1 97
char 1 114
char 1 121
char 1 77
char 1 111
char 1 118
char 1 101
char 1 114
char 1 58
char 1 32
char 1 98
char 1 97
char 1 100
char 1 32
char 1 109
char 1 111
char 1 118
char 1 101
char 1 114
char 1 83
char 1 116
char 1 97
char 1 116
char 1 101
char 1 0
align 1
LABELV $115
char 1 112
char 1 117
char 1 115
char 1 104
char 1 101
char 1 100
char 1 95
char 1 112
char 1 32
char 1 62
char 1 32
char 1 38
char 1 112
char 1 117
char 1 115
char 1 104
char 1 101
char 1 100
char 1 91
char 1 77
char 1 65
char 1 88
char 1 95
char 1 71
char 1 69
char 1 78
char 1 84
char 1 73
char 1 84
char 1 73
char 1 69
char 1 83
char 1 93
char 1 0
