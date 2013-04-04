#include "../qcommon/qfiles.h"

#define NUM_FORCE_STAR_IMAGES  9

extern int uiForceSide;
extern int uiForceRank;
extern int uiMaxRank;
extern int uiForceUsed;
extern int uiForceAvailable;
extern qboolean gTouchedForce;
extern int uiForcePowersRank[NUM_FORCE_POWERS];
extern int uiForcePowerDarkLight[NUM_FORCE_POWERS];
extern int uiForcePowerCost[NUM_FORCE_POWERS][NUM_FORCE_POWER_LEVELS];
// Dots above or equal to a given rank carry a certain color.
extern vmCvar_t	ui_freeSaber;

void UI_InitForceStarShaders(void);
void UI_DrawTotalForceStars(rectDef_t *rect, float scale, vec4_t color, int textStyle);
void UI_DrawForceStars(rectDef_t *rect, float scale, vec4_t color, int textStyle, int findex, int val, int min, int max) ;
void UI_UpdateClientForcePowers();
void UI_UpdateForcePowers();
qboolean UI_SkinColor_HandleKey(int flags, float *special, int key, int num, int min, int max, int type);
qboolean UI_ForceSide_HandleKey(int flags, float *special, int key, int num, int min, int max, int type);
qboolean UI_ForceMaxRank_HandleKey(int flags, float *special, int key, int num, int min, int max, int type);
qboolean UI_ForcePowerRank_HandleKey(int flags, float *special, int key, int num, int min, int max, int type);
extern void UI_ForceConfigHandle( int oldindex, int newindex );
