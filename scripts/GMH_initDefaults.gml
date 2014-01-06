/** 
 * These are the GMHydra default values. Its better not to touch these, 
 * and simply use the setters and getters instead.
 */

global._GMH_VERSION = 0.1;
global._GMH_VERSION_STRING = string(global._GMH_VERSION)+' (non-stable)';

global._GMH_DLL_FILENAME = 'GMHydraDll.dll'
global._GMH_DLL_LOADED = false;
global._GMH_DLL_INIT = false;

// Offset variables
global._GMH_pitchOffset[0] = 0;
global._GMH_yawOffset[0] = 0;
global._GMH_rollOffset[0] = 0;

global._GMH_pitchOffset[1] = 0;
global._GMH_yawOffset[1] = 0;
global._GMH_rollOffset[1] = 0;

global._GMH_zMin[0] = -700;
global._GMH_zMin[1] = -700;

global._GMH_zMax[0] = 120;
global._GMH_zMax[1] = 120;

global._GMH_xMin[0] = 0;
global._GMH_xMin[1] = 0;

global._GMH_xMax[0] = 10;
global._GMH_xMax[1] = 10;

global._GMH_yMin[0] = 0;
global._GMH_yMin[1] = 0;
global._GMH_yMax[0] = 10;
global._GMH_yMax[1] = 10;

