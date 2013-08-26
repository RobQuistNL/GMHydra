//arg0 = which
if (GMHD_checkDllLoaded() == false) {return false;}
return external_call(global._GMHD_getHemisphereTrackingMode, argument0);
