//arg0 = controller_id
//arg1 = enabled / disabled (true / false)
if (GMHD_checkDllLoaded() == false) {return false;}
return external_call(global._GMHD_setHemisphereTrackingMode, argument0, argument1);
