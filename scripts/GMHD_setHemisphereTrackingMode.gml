//arg0 = which
//arg1 = mode
if (GMHD_checkDllLoaded() == false) {return false;}
return external_call(global._GMHD_setHemisphereTrackingMode, argument0, argument1);
