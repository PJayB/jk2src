export B_TempAlloc
code
proc B_TempAlloc 4 4
file "../ai_util.c"
line 15
;1:#include "g_local.h"
;2:#include "q_shared.h"
;3:#include "botlib.h"
;4:#include "ai_main.h"
;5:
;6:#ifdef BOT_ZMALLOC
;7:#define MAX_BALLOC 8192
;8:
;9:void *BAllocList[MAX_BALLOC];
;10:#endif
;11:
;12:char gBotChatBuffer[MAX_CLIENTS][MAX_CHAT_BUFFER_SIZE];
;13:
;14:void *B_TempAlloc(int size)
;15:{
line 16
;16:	return BG_TempAlloc(size);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_TempAlloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $81
endproc B_TempAlloc 4 4
export B_TempFree
proc B_TempFree 0 4
line 20
;17:}
;18:
;19:void B_TempFree(int size)
;20:{
line 21
;21:	BG_TempFree(size);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BG_TempFree
CALLV
pop
line 22
;22:}
LABELV $82
endproc B_TempFree 0 4
export B_Alloc
proc B_Alloc 4 4
line 26
;23:
;24:
;25:void *B_Alloc(int size)
;26:{
line 77
;27:#ifdef BOT_ZMALLOC
;28:	void *ptr = NULL;
;29:	int i = 0;
;30:
;31:#ifdef BOTMEMTRACK
;32:	int free = 0;
;33:	int used = 0;
;34:
;35:	while (i < MAX_BALLOC)
;36:	{
;37:		if (!BAllocList[i])
;38:		{
;39:			free++;
;40:		}
;41:		else
;42:		{
;43:			used++;
;44:		}
;45:
;46:		i++;
;47:	}
;48:
;49:	G_Printf("Allocations used: %i\nFree allocation slots: %i\n", used, free);
;50:
;51:	i = 0;
;52:#endif
;53:
;54:	ptr = trap_BotGetMemoryGame(size);
;55:
;56:	while (i < MAX_BALLOC)
;57:	{
;58:		if (!BAllocList[i])
;59:		{
;60:			BAllocList[i] = ptr;
;61:			break;
;62:		}
;63:		i++;
;64:	}
;65:
;66:	if (i == MAX_BALLOC)
;67:	{
;68:		//If this happens we'll have to rely on this chunk being freed manually with B_Free, which it hopefully will be
;69:#ifdef DEBUG
;70:		G_Printf("WARNING: MAXIMUM B_ALLOC ALLOCATIONS EXCEEDED\n");
;71:#endif
;72:	}
;73:
;74:	return ptr;
;75:#else
;76:
;77:	return BG_Alloc(size);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 BG_Alloc
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $83
endproc B_Alloc 4 4
export B_Free
proc B_Free 0 0
line 83
;78:
;79:#endif
;80:}
;81:
;82:void B_Free(void *ptr)
;83:{
line 131
;84:#ifdef BOT_ZMALLOC
;85:	int i = 0;
;86:
;87:#ifdef BOTMEMTRACK
;88:	int free = 0;
;89:	int used = 0;
;90:
;91:	while (i < MAX_BALLOC)
;92:	{
;93:		if (!BAllocList[i])
;94:		{
;95:			free++;
;96:		}
;97:		else
;98:		{
;99:			used++;
;100:		}
;101:
;102:		i++;
;103:	}
;104:
;105:	G_Printf("Allocations used: %i\nFree allocation slots: %i\n", used, free);
;106:
;107:	i = 0;
;108:#endif
;109:
;110:	while (i < MAX_BALLOC)
;111:	{
;112:		if (BAllocList[i] == ptr)
;113:		{
;114:			BAllocList[i] = NULL;
;115:			break;
;116:		}
;117:
;118:		i++;
;119:	}
;120:
;121:	if (i == MAX_BALLOC)
;122:	{
;123:		//Likely because the limit was exceeded and we're now freeing the chunk manually as we hoped would happen
;124:#ifdef DEBUG
;125:		G_Printf("WARNING: Freeing allocation which is not in the allocation structure\n");
;126:#endif
;127:	}
;128:
;129:	trap_BotFreeMemoryGame(ptr);
;130:#endif
;131:}
LABELV $84
endproc B_Free 0 0
export B_InitAlloc
proc B_InitAlloc 0 12
line 134
;132:
;133:void B_InitAlloc(void)
;134:{
line 139
;135:#ifdef BOT_ZMALLOC
;136:	memset(BAllocList, 0, sizeof(BAllocList));
;137:#endif
;138:
;139:	memset(gWPArray, 0, sizeof(gWPArray));
ADDRGP4 gWPArray
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16384
ARGI4
ADDRGP4 memset
CALLP4
pop
line 140
;140:}
LABELV $85
endproc B_InitAlloc 0 12
export B_CleanupAlloc
proc B_CleanupAlloc 0 0
line 143
;141:
;142:void B_CleanupAlloc(void)
;143:{
line 158
;144:#ifdef BOT_ZMALLOC
;145:	int i = 0;
;146:
;147:	while (i < MAX_BALLOC)
;148:	{
;149:		if (BAllocList[i])
;150:		{
;151:			trap_BotFreeMemoryGame(BAllocList[i]);
;152:			BAllocList[i] = NULL;
;153:		}
;154:
;155:		i++;
;156:	}
;157:#endif
;158:}
LABELV $86
endproc B_CleanupAlloc 0 0
export GetValueGroup
proc GetValueGroup 44 8
line 161
;159:
;160:int GetValueGroup(char *buf, char *group, char *outbuf)
;161:{
line 167
;162:	char *place, *placesecond;
;163:	int iplace;
;164:	int failure;
;165:	int i;
;166:	int startpoint, startletter;
;167:	int subg = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 169
;168:
;169:	i = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 171
;170:
;171:	iplace = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
line 173
;172:
;173:	place = strstr(buf, group);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
ASGNP4
line 175
;174:
;175:	if (!place)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $88
line 176
;176:	{
line 177
;177:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $88
line 180
;178:	}
;179:
;180:	startpoint = place - buf + strlen(group) + 1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDRLP4 36
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ASGNI4
line 181
;181:	startletter = (place - buf) - 1;
ADDRLP4 20
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
SUBI4
ASGNI4
line 183
;182:
;183:	failure = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRGP4 $91
JUMPV
LABELV $90
line 186
;184:
;185:	while (buf[startpoint+1] != '{' || buf[startletter] != '\n')
;186:	{
line 187
;187:		placesecond = strstr(place+1, group);
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 40
INDIRP4
ASGNP4
line 189
;188:
;189:		if (placesecond)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $93
line 190
;190:		{
line 191
;191:			startpoint += (placesecond - place);
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 192
;192:			startletter += (placesecond - place);
ADDRLP4 20
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 193
;193:			place = placesecond;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 194
;194:		}
ADDRGP4 $94
JUMPV
LABELV $93
line 196
;195:		else
;196:		{
line 197
;197:			failure = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 198
;198:			break;
ADDRGP4 $92
JUMPV
LABELV $94
line 200
;199:		}
;200:	}
LABELV $91
line 185
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 40
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $90
ADDRLP4 20
INDIRI4
ADDRLP4 40
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $90
LABELV $92
line 202
;201:
;202:	if (failure)
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $98
line 203
;203:	{
line 204
;204:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $87
JUMPV
LABELV $97
line 211
;205:	}
;206:
;207:	//we have found the proper group name if we made it here, so find the opening brace and read into the outbuf
;208:	//until hitting the end brace
;209:
;210:	while (buf[startpoint] != '{')
;211:	{
line 212
;212:		startpoint++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 213
;213:	}
LABELV $98
line 210
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $97
line 215
;214:
;215:	startpoint++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $100
line 218
;216:
;217:	while (buf[startpoint] != '}' || subg)
;218:	{
line 219
;219:		if (buf[startpoint] == '{')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $103
line 220
;220:		{
line 221
;221:			subg++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 222
;222:		}
ADDRGP4 $104
JUMPV
LABELV $103
line 223
;223:		else if (buf[startpoint] == '}')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $105
line 224
;224:		{
line 225
;225:			subg--;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 226
;226:		}
LABELV $105
LABELV $104
line 227
;227:		outbuf[i] = buf[startpoint];
ADDRLP4 12
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 228
;228:		i++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 229
;229:		startpoint++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 230
;230:	}
LABELV $101
line 217
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $100
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $100
line 231
;231:	outbuf[i] = '\0';
ADDRLP4 12
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 233
;232:
;233:	return 1;
CNSTI4 1
RETI4
LABELV $87
endproc GetValueGroup 44 8
export GetPairedValue
proc GetPairedValue 64 8
line 237
;234:}
;235:
;236:int GetPairedValue(char *buf, char *key, char *outbuf)
;237:{
line 242
;238:	char *place, *placesecond;
;239:	int startpoint, startletter;
;240:	int i, found;
;241:
;242:	if (!buf || !key || !outbuf)
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $111
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $111
ADDRFP4 8
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
NEU4 $108
LABELV $111
line 243
;243:	{
line 244
;244:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $108
line 247
;245:	}
;246:
;247:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $112
line 250
;248:
;249:	while (buf[i] && buf[i] != '\0')
;250:	{
line 251
;251:		if (buf[i] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $115
line 252
;252:		{
line 253
;253:			if (buf[i+1] && buf[i+1] != '\0' && buf[i+1] == '/')
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $117
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $117
ADDRLP4 28
INDIRI4
CNSTI4 47
NEI4 $117
line 254
;254:			{
ADDRGP4 $120
JUMPV
LABELV $119
line 256
;255:				while (buf[i] != '\n')
;256:				{
line 257
;257:					buf[i] = '/';
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 47
ASGNI1
line 258
;258:					i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 259
;259:				}
LABELV $120
line 255
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $119
line 260
;260:			}
LABELV $117
line 261
;261:		}
LABELV $115
line 262
;262:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 263
;263:	}
LABELV $113
line 249
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $122
ADDRLP4 28
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $112
LABELV $122
line 265
;264:
;265:	place = strstr(buf, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
ASGNP4
line 267
;266:
;267:	if (!place)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $123
line 268
;268:	{
line 269
;269:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $123
line 272
;270:	}
;271:	//tab == 9
;272:	startpoint = place - buf + strlen(key);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDRLP4 40
INDIRI4
ADDI4
ASGNI4
line 273
;273:	startletter = (place - buf) - 1;
ADDRLP4 8
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
SUBI4
ASGNI4
line 275
;274:
;275:	found = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $125
line 278
;276:
;277:	while (!found)
;278:	{
line 279
;279:		if (startletter == 0 || !buf[startletter] || buf[startletter] == '\0' || buf[startletter] == 9 || buf[startletter] == ' ' || buf[startletter] == '\n')
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $134
ADDRLP4 52
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $134
ADDRLP4 52
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $134
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $134
ADDRLP4 52
INDIRI4
CNSTI4 32
EQI4 $134
ADDRLP4 52
INDIRI4
CNSTI4 10
NEI4 $128
LABELV $134
line 280
;280:		{
line 281
;281:			if (buf[startpoint] == '\0' || buf[startpoint] == 9 || buf[startpoint] == ' ' || buf[startpoint] == '\n')
ADDRLP4 56
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $139
ADDRLP4 56
INDIRI4
CNSTI4 9
EQI4 $139
ADDRLP4 56
INDIRI4
CNSTI4 32
EQI4 $139
ADDRLP4 56
INDIRI4
CNSTI4 10
NEI4 $135
LABELV $139
line 282
;282:			{
line 283
;283:				found = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 284
;284:				break;
ADDRGP4 $127
JUMPV
LABELV $135
line 286
;285:			}
;286:		}
LABELV $128
line 288
;287:
;288:		placesecond = strstr(place+1, key);
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 56
INDIRP4
ASGNP4
line 290
;289:
;290:		if (placesecond)
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
line 291
;291:		{
line 292
;292:			startpoint += placesecond - place;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 293
;293:			startletter += placesecond - place;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ADDI4
ASGNI4
line 294
;294:			place = placesecond;
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 295
;295:		}
ADDRGP4 $141
JUMPV
LABELV $140
line 297
;296:		else
;297:		{
line 298
;298:			place = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 299
;299:			break;
ADDRGP4 $127
JUMPV
LABELV $141
line 302
;300:		}
;301:
;302:	}
LABELV $126
line 277
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $125
LABELV $127
line 304
;303:
;304:	if (!found || !place || !buf[startpoint] || buf[startpoint] == '\0')
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $146
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $146
ADDRLP4 48
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $146
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
NEI4 $148
LABELV $146
line 305
;305:	{
line 306
;306:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $107
JUMPV
LABELV $147
line 310
;307:	}
;308:
;309:	while (buf[startpoint] == ' ' || buf[startpoint] == 9 || buf[startpoint] == '\n')
;310:	{
line 311
;311:		startpoint++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 312
;312:	}
LABELV $148
line 309
ADDRLP4 52
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 32
EQI4 $147
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $147
ADDRLP4 52
INDIRI4
CNSTI4 10
EQI4 $147
line 314
;313:
;314:	i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $151
JUMPV
LABELV $150
line 317
;315:
;316:	while (buf[startpoint] && buf[startpoint] != '\0' && buf[startpoint] != '\n')
;317:	{
line 318
;318:		outbuf[i] = buf[startpoint];
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 319
;319:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 320
;320:		startpoint++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 321
;321:	}
LABELV $151
line 316
ADDRLP4 56
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $154
ADDRLP4 56
INDIRI4
ADDRLP4 60
INDIRI4
EQI4 $154
ADDRLP4 56
INDIRI4
CNSTI4 10
NEI4 $150
LABELV $154
line 323
;322:
;323:	outbuf[i] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 325
;324:
;325:	return 1;
CNSTI4 1
RETI4
LABELV $107
endproc GetPairedValue 64 8
export BotDoChat
proc BotDoChat 96 12
line 329
;326:}
;327:
;328:int BotDoChat(bot_state_t *bs, char *section, int always)
;329:{
line 340
;330:	char *chatgroup;
;331:	int rVal;
;332:	int inc_1;
;333:	int inc_2;
;334:	int inc_n;
;335:	int lines;
;336:	int checkedline;
;337:	int getthisline;
;338:	gentity_t *cobject;
;339:
;340:	if (!bs->canChat)
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
INDIRI4
CNSTI4 0
NEI4 $156
line 341
;341:	{
line 342
;342:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $156
line 345
;343:	}
;344:
;345:	if (bs->doChat)
ADDRFP4 0
INDIRP4
CNSTI4 2224
ADDP4
INDIRI4
CNSTI4 0
EQI4 $158
line 346
;346:	{ //already have a chat scheduled
line 347
;347:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $158
line 350
;348:	}
;349:
;350:	if (trap_Cvar_VariableIntegerValue("sp_language"))
ADDRGP4 $162
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $160
line 351
;351:	{ //no chatting unless English.
line 352
;352:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $160
line 355
;353:	}
;354:
;355:	if (Q_irand(1, 10) > bs->chatFrequency && !always)
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
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
INDIRI4
LEI4 $163
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $163
line 356
;356:	{
line 357
;357:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $163
line 360
;358:	}
;359:
;360:	bs->chatTeam = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2228
ADDP4
CNSTI4 0
ASGNI4
line 362
;361:
;362:	chatgroup = (char *)B_TempAlloc(MAX_CHAT_BUFFER_SIZE);
CNSTI4 8192
ARGI4
ADDRLP4 44
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 364
;363:
;364:	rVal = GetValueGroup(gBotChatBuffer[bs->client], section, chatgroup);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 48
INDIRI4
ASGNI4
line 366
;365:
;366:	if (!rVal) //the bot has no group defined for the specified chat event
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $165
line 367
;367:	{
line 368
;368:		B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 369
;369:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $165
line 372
;370:	}
;371:
;372:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 373
;373:	inc_2 = 2;
ADDRLP4 8
CNSTI4 2
ASGNI4
ADDRGP4 $168
JUMPV
LABELV $167
line 376
;374:
;375:	while (chatgroup[inc_2] && chatgroup[inc_2] != '\0')
;376:	{
line 377
;377:		if (chatgroup[inc_2] != 13 && chatgroup[inc_2] != 9)
ADDRLP4 52
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 13
EQI4 $170
ADDRLP4 52
INDIRI4
CNSTI4 9
EQI4 $170
line 378
;378:		{
line 379
;379:			chatgroup[inc_1] = chatgroup[inc_2];
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 380
;380:			inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 381
;381:		}
LABELV $170
line 382
;382:		inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 383
;383:	}
LABELV $168
line 375
ADDRLP4 52
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $172
ADDRLP4 52
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $167
LABELV $172
line 384
;384:	chatgroup[inc_1] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 386
;385:
;386:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 388
;387:
;388:	lines = 0;
ADDRLP4 28
CNSTI4 0
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $173
line 391
;389:
;390:	while (chatgroup[inc_1] && chatgroup[inc_1] != '\0')
;391:	{
line 392
;392:		if (chatgroup[inc_1] == '\n')
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $176
line 393
;393:		{
line 394
;394:			lines++;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 395
;395:		}
LABELV $176
line 396
;396:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 397
;397:	}
LABELV $174
line 390
ADDRLP4 60
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
EQI4 $178
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $173
LABELV $178
line 399
;398:
;399:	if (!lines)
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $179
line 400
;400:	{
line 401
;401:		B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 402
;402:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $179
line 405
;403:	}
;404:
;405:	getthisline = Q_irand(0, (lines+1));
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 68
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 68
INDIRI4
ASGNI4
line 407
;406:
;407:	if (getthisline < 1)
ADDRLP4 20
INDIRI4
CNSTI4 1
GEI4 $181
line 408
;408:	{
line 409
;409:		getthisline = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 410
;410:	}
LABELV $181
line 411
;411:	if (getthisline > lines)
ADDRLP4 20
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $183
line 412
;412:	{
line 413
;413:		getthisline = lines;
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 414
;414:	}
LABELV $183
line 416
;415:
;416:	checkedline = 1;
ADDRLP4 24
CNSTI4 1
ASGNI4
line 418
;417:
;418:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $186
JUMPV
LABELV $185
line 421
;419:
;420:	while (checkedline != getthisline)
;421:	{
line 422
;422:		if (chatgroup[inc_1] && chatgroup[inc_1] != '\0')
ADDRLP4 72
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $188
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $188
line 423
;423:		{
line 424
;424:			if (chatgroup[inc_1] == '\n')
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $190
line 425
;425:			{
line 426
;426:				inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 427
;427:				checkedline++;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 428
;428:			}
LABELV $190
line 429
;429:		}
LABELV $188
line 431
;430:
;431:		if (checkedline == getthisline)
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $192
line 432
;432:		{
line 433
;433:			break;
ADDRGP4 $187
JUMPV
LABELV $192
line 436
;434:		}
;435:
;436:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 437
;437:	}
LABELV $186
line 420
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $185
LABELV $187
line 440
;438:
;439:	//we're at the starting position of the desired line here
;440:	inc_2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $195
JUMPV
LABELV $194
line 443
;441:
;442:	while (chatgroup[inc_1] != '\n')
;443:	{
line 444
;444:		chatgroup[inc_2] = chatgroup[inc_1];
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 445
;445:		inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 446
;446:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 447
;447:	}
LABELV $195
line 442
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $194
line 448
;448:	chatgroup[inc_2] = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 451
;449:
;450:	//trap_EA_Say(bs->client, chatgroup);
;451:	inc_1 = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 452
;452:	inc_2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 454
;453:
;454:	if (strlen(chatgroup) > MAX_CHAT_LINE_SIZE)
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 128
LEI4 $200
line 455
;455:	{
line 456
;456:		B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 457
;457:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $155
JUMPV
LABELV $199
line 461
;458:	}
;459:
;460:	while (chatgroup[inc_1])
;461:	{
line 462
;462:		if (chatgroup[inc_1] == '%' && chatgroup[inc_1+1] != '%')
ADDRLP4 84
CNSTI4 37
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
NEI4 $202
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
EQI4 $202
line 463
;463:		{
line 464
;464:			inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 466
;465:
;466:			if (chatgroup[inc_1] == 's' && bs->chatObject)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 115
NEI4 $204
ADDRFP4 0
INDIRP4
CNSTI4 2232
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
line 467
;467:			{
line 468
;468:				cobject = bs->chatObject;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2232
ADDP4
INDIRP4
ASGNP4
line 469
;469:			}
ADDRGP4 $205
JUMPV
LABELV $204
line 470
;470:			else if (chatgroup[inc_1] == 'a' && bs->chatAltObject)
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 97
NEI4 $206
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $206
line 471
;471:			{
line 472
;472:				cobject = bs->chatAltObject;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 2236
ADDP4
INDIRP4
ASGNP4
line 473
;473:			}
ADDRGP4 $207
JUMPV
LABELV $206
line 475
;474:			else
;475:			{
line 476
;476:				cobject = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 477
;477:			}
LABELV $207
LABELV $205
line 479
;478:
;479:			if (cobject && cobject->client)
ADDRLP4 92
CNSTU4 0
ASGNU4
ADDRLP4 16
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $203
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 92
INDIRU4
EQU4 $203
line 480
;480:			{
line 481
;481:				inc_n = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $210
line 484
;482:
;483:				while (cobject->client->pers.netname[inc_n])
;484:				{
line 485
;485:					bs->currentChat[inc_2] = cobject->client->pers.netname[inc_n];
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
ADDP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ADDP4
INDIRI1
ASGNI1
line 486
;486:					inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 487
;487:					inc_n++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 488
;488:				}
LABELV $211
line 483
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CNSTI4 1416
ADDP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $210
line 489
;489:				inc_2--; //to make up for the auto-increment below
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 490
;490:			}
line 491
;491:		}
ADDRGP4 $203
JUMPV
LABELV $202
line 493
;492:		else
;493:		{
line 494
;494:			bs->currentChat[inc_2] = chatgroup[inc_1];
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 495
;495:		}
LABELV $203
line 496
;496:		inc_2++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 497
;497:		inc_1++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 498
;498:	}
LABELV $200
line 460
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $199
line 499
;499:	bs->currentChat[inc_2] = '\0';
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 2088
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 501
;500:
;501:	if (strcmp(section, "GeneralGreetings") == 0)
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 76
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $213
line 502
;502:	{
line 503
;503:		bs->doChat = 2;
ADDRFP4 0
INDIRP4
CNSTI4 2224
ADDP4
CNSTI4 2
ASGNI4
line 504
;504:	}
ADDRGP4 $214
JUMPV
LABELV $213
line 506
;505:	else
;506:	{
line 507
;507:		bs->doChat = 1;
ADDRFP4 0
INDIRP4
CNSTI4 2224
ADDP4
CNSTI4 1
ASGNI4
line 508
;508:	}
LABELV $214
line 509
;509:	bs->chatTime_stored = (strlen(bs->currentChat)*45)+Q_irand(1300, 1500);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 2088
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 strlen
CALLI4
ASGNI4
CNSTI4 1300
ARGI4
CNSTI4 1500
ARGI4
ADDRLP4 88
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 2220
ADDP4
CNSTI4 45
ADDRLP4 84
INDIRI4
MULI4
ADDRLP4 88
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 510
;510:	bs->chatTime = level.time + bs->chatTime_stored;
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 2216
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRP4
CNSTI4 2220
ADDP4
INDIRF4
ADDF4
ASGNF4
line 512
;511:
;512:	B_TempFree(MAX_CHAT_BUFFER_SIZE); //chatgroup
CNSTI4 8192
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 514
;513:
;514:	return 1;
CNSTI4 1
RETI4
LABELV $155
endproc BotDoChat 96 12
export ParseEmotionalAttachments
proc ParseEmotionalAttachments 60 4
line 518
;515:}
;516:
;517:void ParseEmotionalAttachments(bot_state_t *bs, char *buf)
;518:{
line 519
;519:	int i = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 520
;520:	int i_c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $219
JUMPV
line 524
;521:	char tbuf[16];
;522:
;523:	while (buf[i] && buf[i] != '}')
;524:	{
LABELV $221
line 526
;525:		while (buf[i] == ' ' || buf[i] == '{' || buf[i] == 9 || buf[i] == 13 || buf[i] == '\n')
;526:		{
line 527
;527:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 528
;528:		}
LABELV $222
line 525
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 32
EQI4 $221
ADDRLP4 24
INDIRI4
CNSTI4 123
EQI4 $221
ADDRLP4 24
INDIRI4
CNSTI4 9
EQI4 $221
ADDRLP4 24
INDIRI4
CNSTI4 13
EQI4 $221
ADDRLP4 24
INDIRI4
CNSTI4 10
EQI4 $221
line 530
;529:
;530:		if (buf[i] && buf[i] != '}')
ADDRLP4 28
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $220
ADDRLP4 28
INDIRI4
CNSTI4 125
EQI4 $220
line 531
;531:		{
line 532
;532:			i_c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $226
line 534
;533:			while (buf[i] != '{' && buf[i] != 9 && buf[i] != 13 && buf[i] != '\n')
;534:			{
line 535
;535:				bs->loved[bs->lovednum].name[i_c] = buf[i];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 68
ADDRLP4 32
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
MULI4
ADDRLP4 32
INDIRP4
CNSTI4 2328
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 536
;536:				i_c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 537
;537:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 538
;538:			}
LABELV $227
line 533
ADDRLP4 32
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 123
EQI4 $231
ADDRLP4 32
INDIRI4
CNSTI4 9
EQI4 $231
ADDRLP4 32
INDIRI4
CNSTI4 13
EQI4 $231
ADDRLP4 32
INDIRI4
CNSTI4 10
NEI4 $226
LABELV $231
line 539
;539:			bs->loved[bs->lovednum].name[i_c] = '\0';
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 68
ADDRLP4 36
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
MULI4
ADDRLP4 36
INDIRP4
CNSTI4 2328
ADDP4
ADDP4
CNSTI4 4
ADDP4
ADDP4
CNSTI1 0
ASGNI1
ADDRGP4 $233
JUMPV
LABELV $232
line 542
;540:
;541:			while (buf[i] == ' ' || buf[i] == '{' || buf[i] == 9 || buf[i] == 13 || buf[i] == '\n')
;542:			{
line 543
;543:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 544
;544:			}
LABELV $233
line 541
ADDRLP4 40
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32
EQI4 $232
ADDRLP4 40
INDIRI4
CNSTI4 123
EQI4 $232
ADDRLP4 40
INDIRI4
CNSTI4 9
EQI4 $232
ADDRLP4 40
INDIRI4
CNSTI4 13
EQI4 $232
ADDRLP4 40
INDIRI4
CNSTI4 10
EQI4 $232
line 546
;545:
;546:			i_c = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $235
line 549
;547:
;548:			while (buf[i] != '{' && buf[i] != 9 && buf[i] != 13 && buf[i] != '\n')
;549:			{
line 550
;550:				tbuf[i_c] = buf[i];
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 551
;551:				i_c++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 552
;552:				i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 553
;553:			}
LABELV $236
line 548
ADDRLP4 44
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 123
EQI4 $240
ADDRLP4 44
INDIRI4
CNSTI4 9
EQI4 $240
ADDRLP4 44
INDIRI4
CNSTI4 13
EQI4 $240
ADDRLP4 44
INDIRI4
CNSTI4 10
NEI4 $235
LABELV $240
line 554
;554:			tbuf[i_c] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 556
;555:
;556:			bs->loved[bs->lovednum].level = atoi(tbuf);
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
CNSTI4 68
ADDRLP4 52
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
MULI4
ADDRLP4 52
INDIRP4
CNSTI4 2328
ADDP4
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 558
;557:
;558:			bs->lovednum++;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 2600
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 559
;559:		}
line 561
;560:		else
;561:		{
line 562
;562:			break;
LABELV $225
line 565
;563:		}
;564:
;565:		if (bs->lovednum >= MAX_LOVED_ONES)
ADDRFP4 0
INDIRP4
CNSTI4 2600
ADDP4
INDIRI4
CNSTI4 4
LTI4 $241
line 566
;566:		{
line 567
;567:			return;
ADDRGP4 $217
JUMPV
LABELV $241
line 570
;568:		}
;569:
;570:		i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 571
;571:	}
LABELV $219
line 523
ADDRLP4 24
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $243
ADDRLP4 24
INDIRI4
CNSTI4 125
NEI4 $222
LABELV $243
LABELV $220
line 572
;572:}
LABELV $217
endproc ParseEmotionalAttachments 60 4
export ReadChatGroups
proc ReadChatGroups 28 8
line 575
;573:
;574:int ReadChatGroups(bot_state_t *bs, char *buf)
;575:{
line 580
;576:	char *cgroupbegin;
;577:	int cgbplace;
;578:	int i;
;579:
;580:	cgroupbegin = strstr(buf, "BEGIN_CHAT_GROUPS");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $245
ARGP4
ADDRLP4 12
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 582
;581:
;582:	if (!cgroupbegin)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $246
line 583
;583:	{
line 584
;584:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $246
line 587
;585:	}
;586:
;587:	if (strlen(cgroupbegin) >= MAX_CHAT_BUFFER_SIZE)
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 8192
LTI4 $248
line 588
;588:	{
line 589
;589:		G_Printf(S_COLOR_RED "Error: Personality chat section exceeds max size\n");
ADDRGP4 $250
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 590
;590:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $244
JUMPV
LABELV $248
line 593
;591:	}
;592:
;593:	cgbplace = cgroupbegin - buf+1;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $251
line 596
;594:
;595:	while (buf[cgbplace] != '\n')
;596:	{
line 597
;597:		cgbplace++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 598
;598:	}
LABELV $252
line 595
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $251
line 600
;599:
;600:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $255
JUMPV
LABELV $254
line 603
;601:
;602:	while (buf[cgbplace] && buf[cgbplace] != '\0')
;603:	{
line 604
;604:		gBotChatBuffer[bs->client][i] = buf[cgbplace];
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 605
;605:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 606
;606:		cgbplace++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 607
;607:	}
LABELV $255
line 602
ADDRLP4 20
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $257
ADDRLP4 20
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $254
LABELV $257
line 609
;608:
;609:	gBotChatBuffer[bs->client][i] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 611
;610:
;611:	return 1;
CNSTI4 1
RETI4
LABELV $244
endproc ReadChatGroups 28 8
export BotUtilizePersonality
proc BotUtilizePersonality 160 16
line 615
;612:}
;613:
;614:void BotUtilizePersonality(bot_state_t *bs)
;615:{
line 621
;616:	fileHandle_t f;
;617:	int len, rlen;
;618:	int failed;
;619:	int i;
;620:	//char buf[131072];
;621:	char *buf = (char *)B_TempAlloc(131072);
CNSTI4 131072
ARGI4
ADDRLP4 32
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 624
;622:	char *readbuf, *group;
;623:
;624:	len = trap_FS_FOpenFile(bs->settings.personalityfile, &f, FS_READ);
ADDRFP4 0
INDIRP4
CNSTI4 1412
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 36
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 626
;625:
;626:	failed = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 628
;627:
;628:	if (!f)
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $259
line 629
;629:	{
line 630
;630:		G_Printf(S_COLOR_RED "Error: Specified personality not found\n");
ADDRGP4 $261
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 631
;631:		B_TempFree(131072); //buf
CNSTI4 131072
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 632
;632:		return;
ADDRGP4 $258
JUMPV
LABELV $259
line 635
;633:	}
;634:
;635:	if (len >= 131072)
ADDRLP4 0
INDIRI4
CNSTI4 131072
LTI4 $262
line 636
;636:	{
line 637
;637:		G_Printf(S_COLOR_RED "Personality file exceeds maximum length\n");
ADDRGP4 $264
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 638
;638:		B_TempFree(131072); //buf
CNSTI4 131072
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 639
;639:		return;
ADDRGP4 $258
JUMPV
LABELV $262
line 642
;640:	}
;641:
;642:	trap_FS_Read(buf, len, f);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 644
;643:
;644:	rlen = len;
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $266
JUMPV
LABELV $265
line 647
;645:
;646:	while (len < 131072)
;647:	{ //kill all characters after the file length, since sometimes FS_Read doesn't do that entirely (or so it seems)
line 648
;648:		buf[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 649
;649:		len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 650
;650:	}
LABELV $266
line 646
ADDRLP4 0
INDIRI4
CNSTI4 131072
LTI4 $265
line 652
;651:
;652:	len = rlen;
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 654
;653:
;654:	readbuf = (char *)B_TempAlloc(1024);
CNSTI4 1024
ARGI4
ADDRLP4 40
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 655
;655:	group = (char *)B_TempAlloc(65536);
CNSTI4 65536
ARGI4
ADDRLP4 44
ADDRGP4 B_TempAlloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 44
INDIRP4
ASGNP4
line 657
;656:
;657:	if (!GetValueGroup(buf, "GeneralBotInfo", group))
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $268
line 658
;658:	{
line 659
;659:		G_Printf(S_COLOR_RED "Personality file contains no GeneralBotInfo group\n");
ADDRGP4 $271
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 660
;660:		failed = 1; //set failed so we know to set everything to default values
ADDRLP4 20
CNSTI4 1
ASGNI4
line 661
;661:	}
LABELV $268
line 663
;662:
;663:	if (!failed && GetPairedValue(group, "reflex", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $272
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $272
line 664
;664:	{
line 665
;665:		bs->skills.reflex = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2304
ADDP4
ADDRLP4 56
INDIRI4
ASGNI4
line 666
;666:	}
ADDRGP4 $273
JUMPV
LABELV $272
line 668
;667:	else
;668:	{
line 669
;669:		bs->skills.reflex = 100; //default
ADDRFP4 0
INDIRP4
CNSTI4 2304
ADDP4
CNSTI4 100
ASGNI4
line 670
;670:	}
LABELV $273
line 672
;671:
;672:	if (!failed && GetPairedValue(group, "accuracy", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $275
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $275
line 673
;673:	{
line 674
;674:		bs->skills.accuracy = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
line 675
;675:	}
ADDRGP4 $276
JUMPV
LABELV $275
line 677
;676:	else
;677:	{
line 678
;678:		bs->skills.accuracy = 10; //default
ADDRFP4 0
INDIRP4
CNSTI4 2308
ADDP4
CNSTF4 1092616192
ASGNF4
line 679
;679:	}
LABELV $276
line 681
;680:
;681:	if (!failed && GetPairedValue(group, "turnspeed", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $278
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $280
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $278
line 682
;682:	{
line 683
;683:		bs->skills.turnspeed = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
ADDRLP4 64
INDIRF4
ASGNF4
line 684
;684:	}
ADDRGP4 $279
JUMPV
LABELV $278
line 686
;685:	else
;686:	{
line 687
;687:		bs->skills.turnspeed = 0.01f; //default
ADDRFP4 0
INDIRP4
CNSTI4 2312
ADDP4
CNSTF4 1008981770
ASGNF4
line 688
;688:	}
LABELV $279
line 690
;689:
;690:	if (!failed && GetPairedValue(group, "turnspeed_combat", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $281
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $281
line 691
;691:	{
line 692
;692:		bs->skills.turnspeed_combat = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
ADDRLP4 68
INDIRF4
ASGNF4
line 693
;693:	}
ADDRGP4 $282
JUMPV
LABELV $281
line 695
;694:	else
;695:	{
line 696
;696:		bs->skills.turnspeed_combat = 0.05f; //default
ADDRFP4 0
INDIRP4
CNSTI4 2316
ADDP4
CNSTF4 1028443341
ASGNF4
line 697
;697:	}
LABELV $282
line 699
;698:
;699:	if (!failed && GetPairedValue(group, "maxturn", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $284
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $284
line 700
;700:	{
line 701
;701:		bs->skills.maxturn = atof(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 2320
ADDP4
ADDRLP4 72
INDIRF4
ASGNF4
line 702
;702:	}
ADDRGP4 $285
JUMPV
LABELV $284
line 704
;703:	else
;704:	{
line 705
;705:		bs->skills.maxturn = 360; //default
ADDRFP4 0
INDIRP4
CNSTI4 2320
ADDP4
CNSTF4 1135869952
ASGNF4
line 706
;706:	}
LABELV $285
line 708
;707:
;708:	if (!failed && GetPairedValue(group, "perfectaim", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $287
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $289
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $287
line 709
;709:	{
line 710
;710:		bs->skills.perfectaim = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 711
;711:	}
ADDRGP4 $288
JUMPV
LABELV $287
line 713
;712:	else
;713:	{
line 714
;714:		bs->skills.perfectaim = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2324
ADDP4
CNSTI4 0
ASGNI4
line 715
;715:	}
LABELV $288
line 717
;716:
;717:	if (!failed && GetPairedValue(group, "chatability", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $290
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $292
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $290
line 718
;718:	{
line 719
;719:		bs->canChat = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 720
;720:	}
ADDRGP4 $291
JUMPV
LABELV $290
line 722
;721:	else
;722:	{
line 723
;723:		bs->canChat = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
CNSTI4 0
ASGNI4
line 724
;724:	}
LABELV $291
line 726
;725:
;726:	if (!failed && GetPairedValue(group, "chatfrequency", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $293
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $293
line 727
;727:	{
line 728
;728:		bs->chatFrequency = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
ADDRLP4 84
INDIRI4
ASGNI4
line 729
;729:	}
ADDRGP4 $294
JUMPV
LABELV $293
line 731
;730:	else
;731:	{
line 732
;732:		bs->chatFrequency = 5; //default
ADDRFP4 0
INDIRP4
CNSTI4 2084
ADDP4
CNSTI4 5
ASGNI4
line 733
;733:	}
LABELV $294
line 735
;734:
;735:	if (!failed && GetPairedValue(group, "hatelevel", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $296
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $298
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $296
line 736
;736:	{
line 737
;737:		bs->loved_death_thresh = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2604
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 738
;738:	}
ADDRGP4 $297
JUMPV
LABELV $296
line 740
;739:	else
;740:	{
line 741
;741:		bs->loved_death_thresh = 3; //default
ADDRFP4 0
INDIRP4
CNSTI4 2604
ADDP4
CNSTI4 3
ASGNI4
line 742
;742:	}
LABELV $297
line 744
;743:
;744:	if (!failed && GetPairedValue(group, "camper", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $299
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $299
line 745
;745:	{
line 746
;746:		bs->isCamper = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
ADDRLP4 92
INDIRI4
ASGNI4
line 747
;747:	}
ADDRGP4 $300
JUMPV
LABELV $299
line 749
;748:	else
;749:	{
line 750
;750:		bs->isCamper = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2048
ADDP4
CNSTI4 0
ASGNI4
line 751
;751:	}
LABELV $300
line 753
;752:
;753:	if (!failed && GetPairedValue(group, "saberspecialist", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $302
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $304
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 92
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $302
line 754
;754:	{
line 755
;755:		bs->saberSpecialist = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 756
;756:	}
ADDRGP4 $303
JUMPV
LABELV $302
line 758
;757:	else
;758:	{
line 759
;759:		bs->saberSpecialist = 0; //default
ADDRFP4 0
INDIRP4
CNSTI4 2076
ADDP4
CNSTI4 0
ASGNI4
line 760
;760:	}
LABELV $303
line 762
;761:
;762:	if (!failed && GetPairedValue(group, "forceinfo", readbuf))
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $305
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $307
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $305
line 763
;763:	{
line 764
;764:		Com_sprintf(bs->forceinfo, sizeof(bs->forceinfo), "%s\0", readbuf);
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $308
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 765
;765:	}
ADDRGP4 $306
JUMPV
LABELV $305
line 767
;766:	else
;767:	{
line 768
;768:		Com_sprintf(bs->forceinfo, sizeof(bs->forceinfo), "%s\0", DEFAULT_FORCEPOWERS);
ADDRFP4 0
INDIRP4
CNSTI4 2732
ADDP4
ARGP4
CNSTI4 2048
ARGI4
ADDRGP4 $308
ARGP4
ADDRGP4 $309
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 769
;769:	}
LABELV $306
line 771
;770:
;771:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $310
line 774
;772:
;773:	while (i < MAX_CHAT_BUFFER_SIZE)
;774:	{ //clear out the chat buffer for this bot
line 775
;775:		gBotChatBuffer[bs->client][i] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 gBotChatBuffer
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 776
;776:		i++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 777
;777:	}
LABELV $311
line 773
ADDRLP4 4
INDIRI4
CNSTI4 8192
LTI4 $310
line 779
;778:
;779:	if (bs->canChat)
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
INDIRI4
CNSTI4 0
EQI4 $313
line 780
;780:	{
line 781
;781:		if (!ReadChatGroups(bs, buf))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 ReadChatGroups
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $315
line 782
;782:		{
line 783
;783:			bs->canChat = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2080
ADDP4
CNSTI4 0
ASGNI4
line 784
;784:		}
LABELV $315
line 785
;785:	}
LABELV $313
line 787
;786:
;787:	if (GetValueGroup(buf, "BotWeaponWeights", group))
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $319
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $317
line 788
;788:	{
line 789
;789:		if (GetPairedValue(group, "WP_STUN_BATON", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $322
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $320
line 790
;790:		{
line 791
;791:			bs->botWeaponWeights[WP_STUN_BATON] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2616
ADDP4
ADDRLP4 108
INDIRI4
CVIF4 4
ASGNF4
line 792
;792:		}
LABELV $320
line 794
;793:
;794:		if (GetPairedValue(group, "WP_SABER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $325
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
EQI4 $323
line 795
;795:		{
line 796
;796:			bs->botWeaponWeights[WP_SABER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2620
ADDP4
ADDRLP4 112
INDIRI4
CVIF4 4
ASGNF4
line 797
;797:		}
LABELV $323
line 799
;798:
;799:		if (GetPairedValue(group, "WP_BRYAR_PISTOL", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $328
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $326
line 800
;800:		{
line 801
;801:			bs->botWeaponWeights[WP_BRYAR_PISTOL] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2624
ADDP4
ADDRLP4 116
INDIRI4
CVIF4 4
ASGNF4
line 802
;802:		}
LABELV $326
line 804
;803:
;804:		if (GetPairedValue(group, "WP_BLASTER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $331
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $329
line 805
;805:		{
line 806
;806:			bs->botWeaponWeights[WP_BLASTER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2628
ADDP4
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
line 807
;807:		}
LABELV $329
line 809
;808:
;809:		if (GetPairedValue(group, "WP_DISRUPTOR", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $332
line 810
;810:		{
line 811
;811:			bs->botWeaponWeights[WP_DISRUPTOR] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2632
ADDP4
ADDRLP4 124
INDIRI4
CVIF4 4
ASGNF4
line 812
;812:		}
LABELV $332
line 814
;813:
;814:		if (GetPairedValue(group, "WP_BOWCASTER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 124
INDIRI4
CNSTI4 0
EQI4 $335
line 815
;815:		{
line 816
;816:			bs->botWeaponWeights[WP_BOWCASTER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2636
ADDP4
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 817
;817:		}
LABELV $335
line 819
;818:
;819:		if (GetPairedValue(group, "WP_REPEATER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $338
line 820
;820:		{
line 821
;821:			bs->botWeaponWeights[WP_REPEATER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2640
ADDP4
ADDRLP4 132
INDIRI4
CVIF4 4
ASGNF4
line 822
;822:		}
LABELV $338
line 824
;823:
;824:		if (GetPairedValue(group, "WP_DEMP2", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $341
line 825
;825:		{
line 826
;826:			bs->botWeaponWeights[WP_DEMP2] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2644
ADDP4
ADDRLP4 136
INDIRI4
CVIF4 4
ASGNF4
line 827
;827:		}
LABELV $341
line 829
;828:
;829:		if (GetPairedValue(group, "WP_FLECHETTE", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
EQI4 $344
line 830
;830:		{
line 831
;831:			bs->botWeaponWeights[WP_FLECHETTE] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2648
ADDP4
ADDRLP4 140
INDIRI4
CVIF4 4
ASGNF4
line 832
;832:		}
LABELV $344
line 834
;833:
;834:		if (GetPairedValue(group, "WP_ROCKET_LAUNCHER", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $349
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $347
line 835
;835:		{
line 836
;836:			bs->botWeaponWeights[WP_ROCKET_LAUNCHER] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2652
ADDP4
ADDRLP4 144
INDIRI4
CVIF4 4
ASGNF4
line 837
;837:		}
LABELV $347
line 839
;838:
;839:		if (GetPairedValue(group, "WP_THERMAL", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $352
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $350
line 840
;840:		{
line 841
;841:			bs->botWeaponWeights[WP_THERMAL] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2656
ADDP4
ADDRLP4 148
INDIRI4
CVIF4 4
ASGNF4
line 842
;842:		}
LABELV $350
line 844
;843:
;844:		if (GetPairedValue(group, "WP_TRIP_MINE", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $355
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $353
line 845
;845:		{
line 846
;846:			bs->botWeaponWeights[WP_TRIP_MINE] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2660
ADDP4
ADDRLP4 152
INDIRI4
CVIF4 4
ASGNF4
line 847
;847:		}
LABELV $353
line 849
;848:
;849:		if (GetPairedValue(group, "WP_DET_PACK", readbuf))
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 GetPairedValue
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $356
line 850
;850:		{
line 851
;851:			bs->botWeaponWeights[WP_DET_PACK] = atoi(readbuf);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 2664
ADDP4
ADDRLP4 156
INDIRI4
CVIF4 4
ASGNF4
line 852
;852:		}
LABELV $356
line 853
;853:	}
LABELV $317
line 855
;854:
;855:	bs->lovednum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 2600
ADDP4
CNSTI4 0
ASGNI4
line 857
;856:
;857:	if (GetValueGroup(buf, "EmotionalAttachments", group))
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 GetValueGroup
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $359
line 858
;858:	{
line 859
;859:		ParseEmotionalAttachments(bs, group);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 ParseEmotionalAttachments
CALLV
pop
line 860
;860:	}
LABELV $359
line 862
;861:
;862:	B_TempFree(131072); //buf
CNSTI4 131072
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 863
;863:	B_TempFree(1024); //readbuf
CNSTI4 1024
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 864
;864:	B_TempFree(65536); //group
CNSTI4 65536
ARGI4
ADDRGP4 B_TempFree
CALLV
pop
line 865
;865:	trap_FS_FCloseFile(f);
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 866
;866:}
LABELV $258
endproc BotUtilizePersonality 160 16
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
bss
export gBotChatBuffer
align 1
LABELV gBotChatBuffer
skip 262144
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
import NumBots
import BotResetState
import GetBotLibAPI
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
LABELV $361
char 1 69
char 1 109
char 1 111
char 1 116
char 1 105
char 1 111
char 1 110
char 1 97
char 1 108
char 1 65
char 1 116
char 1 116
char 1 97
char 1 99
char 1 104
char 1 109
char 1 101
char 1 110
char 1 116
char 1 115
char 1 0
align 1
LABELV $358
char 1 87
char 1 80
char 1 95
char 1 68
char 1 69
char 1 84
char 1 95
char 1 80
char 1 65
char 1 67
char 1 75
char 1 0
align 1
LABELV $355
char 1 87
char 1 80
char 1 95
char 1 84
char 1 82
char 1 73
char 1 80
char 1 95
char 1 77
char 1 73
char 1 78
char 1 69
char 1 0
align 1
LABELV $352
char 1 87
char 1 80
char 1 95
char 1 84
char 1 72
char 1 69
char 1 82
char 1 77
char 1 65
char 1 76
char 1 0
align 1
LABELV $349
char 1 87
char 1 80
char 1 95
char 1 82
char 1 79
char 1 67
char 1 75
char 1 69
char 1 84
char 1 95
char 1 76
char 1 65
char 1 85
char 1 78
char 1 67
char 1 72
char 1 69
char 1 82
char 1 0
align 1
LABELV $346
char 1 87
char 1 80
char 1 95
char 1 70
char 1 76
char 1 69
char 1 67
char 1 72
char 1 69
char 1 84
char 1 84
char 1 69
char 1 0
align 1
LABELV $343
char 1 87
char 1 80
char 1 95
char 1 68
char 1 69
char 1 77
char 1 80
char 1 50
char 1 0
align 1
LABELV $340
char 1 87
char 1 80
char 1 95
char 1 82
char 1 69
char 1 80
char 1 69
char 1 65
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $337
char 1 87
char 1 80
char 1 95
char 1 66
char 1 79
char 1 87
char 1 67
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $334
char 1 87
char 1 80
char 1 95
char 1 68
char 1 73
char 1 83
char 1 82
char 1 85
char 1 80
char 1 84
char 1 79
char 1 82
char 1 0
align 1
LABELV $331
char 1 87
char 1 80
char 1 95
char 1 66
char 1 76
char 1 65
char 1 83
char 1 84
char 1 69
char 1 82
char 1 0
align 1
LABELV $328
char 1 87
char 1 80
char 1 95
char 1 66
char 1 82
char 1 89
char 1 65
char 1 82
char 1 95
char 1 80
char 1 73
char 1 83
char 1 84
char 1 79
char 1 76
char 1 0
align 1
LABELV $325
char 1 87
char 1 80
char 1 95
char 1 83
char 1 65
char 1 66
char 1 69
char 1 82
char 1 0
align 1
LABELV $322
char 1 87
char 1 80
char 1 95
char 1 83
char 1 84
char 1 85
char 1 78
char 1 95
char 1 66
char 1 65
char 1 84
char 1 79
char 1 78
char 1 0
align 1
LABELV $319
char 1 66
char 1 111
char 1 116
char 1 87
char 1 101
char 1 97
char 1 112
char 1 111
char 1 110
char 1 87
char 1 101
char 1 105
char 1 103
char 1 104
char 1 116
char 1 115
char 1 0
align 1
LABELV $309
char 1 53
char 1 45
char 1 49
char 1 45
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 48
char 1 0
align 1
LABELV $308
char 1 37
char 1 115
char 1 0
char 1 0
align 1
LABELV $307
char 1 102
char 1 111
char 1 114
char 1 99
char 1 101
char 1 105
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $304
char 1 115
char 1 97
char 1 98
char 1 101
char 1 114
char 1 115
char 1 112
char 1 101
char 1 99
char 1 105
char 1 97
char 1 108
char 1 105
char 1 115
char 1 116
char 1 0
align 1
LABELV $301
char 1 99
char 1 97
char 1 109
char 1 112
char 1 101
char 1 114
char 1 0
align 1
LABELV $298
char 1 104
char 1 97
char 1 116
char 1 101
char 1 108
char 1 101
char 1 118
char 1 101
char 1 108
char 1 0
align 1
LABELV $295
char 1 99
char 1 104
char 1 97
char 1 116
char 1 102
char 1 114
char 1 101
char 1 113
char 1 117
char 1 101
char 1 110
char 1 99
char 1 121
char 1 0
align 1
LABELV $292
char 1 99
char 1 104
char 1 97
char 1 116
char 1 97
char 1 98
char 1 105
char 1 108
char 1 105
char 1 116
char 1 121
char 1 0
align 1
LABELV $289
char 1 112
char 1 101
char 1 114
char 1 102
char 1 101
char 1 99
char 1 116
char 1 97
char 1 105
char 1 109
char 1 0
align 1
LABELV $286
char 1 109
char 1 97
char 1 120
char 1 116
char 1 117
char 1 114
char 1 110
char 1 0
align 1
LABELV $283
char 1 116
char 1 117
char 1 114
char 1 110
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 95
char 1 99
char 1 111
char 1 109
char 1 98
char 1 97
char 1 116
char 1 0
align 1
LABELV $280
char 1 116
char 1 117
char 1 114
char 1 110
char 1 115
char 1 112
char 1 101
char 1 101
char 1 100
char 1 0
align 1
LABELV $277
char 1 97
char 1 99
char 1 99
char 1 117
char 1 114
char 1 97
char 1 99
char 1 121
char 1 0
align 1
LABELV $274
char 1 114
char 1 101
char 1 102
char 1 108
char 1 101
char 1 120
char 1 0
align 1
LABELV $271
char 1 94
char 1 49
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 97
char 1 108
char 1 105
char 1 116
char 1 121
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 99
char 1 111
char 1 110
char 1 116
char 1 97
char 1 105
char 1 110
char 1 115
char 1 32
char 1 110
char 1 111
char 1 32
char 1 71
char 1 101
char 1 110
char 1 101
char 1 114
char 1 97
char 1 108
char 1 66
char 1 111
char 1 116
char 1 73
char 1 110
char 1 102
char 1 111
char 1 32
char 1 103
char 1 114
char 1 111
char 1 117
char 1 112
char 1 10
char 1 0
align 1
LABELV $270
char 1 71
char 1 101
char 1 110
char 1 101
char 1 114
char 1 97
char 1 108
char 1 66
char 1 111
char 1 116
char 1 73
char 1 110
char 1 102
char 1 111
char 1 0
align 1
LABELV $264
char 1 94
char 1 49
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 97
char 1 108
char 1 105
char 1 116
char 1 121
char 1 32
char 1 102
char 1 105
char 1 108
char 1 101
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 115
char 1 32
char 1 109
char 1 97
char 1 120
char 1 105
char 1 109
char 1 117
char 1 109
char 1 32
char 1 108
char 1 101
char 1 110
char 1 103
char 1 116
char 1 104
char 1 10
char 1 0
align 1
LABELV $261
char 1 94
char 1 49
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 83
char 1 112
char 1 101
char 1 99
char 1 105
char 1 102
char 1 105
char 1 101
char 1 100
char 1 32
char 1 112
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 97
char 1 108
char 1 105
char 1 116
char 1 121
char 1 32
char 1 110
char 1 111
char 1 116
char 1 32
char 1 102
char 1 111
char 1 117
char 1 110
char 1 100
char 1 10
char 1 0
align 1
LABELV $250
char 1 94
char 1 49
char 1 69
char 1 114
char 1 114
char 1 111
char 1 114
char 1 58
char 1 32
char 1 80
char 1 101
char 1 114
char 1 115
char 1 111
char 1 110
char 1 97
char 1 108
char 1 105
char 1 116
char 1 121
char 1 32
char 1 99
char 1 104
char 1 97
char 1 116
char 1 32
char 1 115
char 1 101
char 1 99
char 1 116
char 1 105
char 1 111
char 1 110
char 1 32
char 1 101
char 1 120
char 1 99
char 1 101
char 1 101
char 1 100
char 1 115
char 1 32
char 1 109
char 1 97
char 1 120
char 1 32
char 1 115
char 1 105
char 1 122
char 1 101
char 1 10
char 1 0
align 1
LABELV $245
char 1 66
char 1 69
char 1 71
char 1 73
char 1 78
char 1 95
char 1 67
char 1 72
char 1 65
char 1 84
char 1 95
char 1 71
char 1 82
char 1 79
char 1 85
char 1 80
char 1 83
char 1 0
align 1
LABELV $215
char 1 71
char 1 101
char 1 110
char 1 101
char 1 114
char 1 97
char 1 108
char 1 71
char 1 114
char 1 101
char 1 101
char 1 116
char 1 105
char 1 110
char 1 103
char 1 115
char 1 0
align 1
LABELV $162
char 1 115
char 1 112
char 1 95
char 1 108
char 1 97
char 1 110
char 1 103
char 1 117
char 1 97
char 1 103
char 1 101
char 1 0
