/// Initializes the DLL
show_debug_message("Initializing Razer Hydra DLL...");

if (global._GMH_DLL_LOADED == false) {

    dllfile = working_directory+'\'+string(global._GMH_DLL_FILENAME);
    
    show_debug_message("Working directory:" + working_directory);
    
    if (!file_exists(dllfile)) {
        show_debug_message("The Razer Hydra DLL (GMHydraDll.dll) could not be located at '"+string(dllfile)+"'");
        show_message(dllfile + " not found! Razer Hydra support disabled.");
        return false;
    }
    
    if (!file_exists(working_directory+'\sixense.dll')) {
        show_debug_message("The Razer Hydra DLL (sixense.dll) could not be located at '"+string(working_directory)+"'");
        show_message("sixense.dll not found! Razer Hydra support disabled.");
        return false;
    }
    
    // Define externals
    global._GMHD_init = external_define(dllfile, 'GMH_init', dll_cdecl, ty_real, 0);
    global._GMHD_destroy = external_define(dllfile, 'GMH_destroy', dll_cdecl, ty_real, 0);
    global._GMHD_getMaxBases = external_define(dllfile, 'GMH_getMaxBases', dll_cdecl, ty_real, 0);
    global._GMHD_getNumActiveControllers = external_define(dllfile, 'GMH_getNumActiveControllers', dll_cdecl, ty_real, 0);
    global._GMHD_setActiveBase = external_define(dllfile, 'GMH_setActiveBase', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_isBaseConnected = external_define(dllfile, 'GMH_isBaseConnected', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getMaxControllers = external_define(dllfile, 'GMH_getMaxControllers', dll_cdecl, ty_real, 0);
    global._GMHD_isControllerEnabled = external_define(dllfile, 'GMH_isControllerEnabled', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getNumActiveControllers = external_define(dllfile, 'GMH_getNumActiveControllers', dll_cdecl, ty_real, 0);
    global._GMHD_getHistorySize = external_define(dllfile, 'GMH_getHistorySize', dll_cdecl, ty_real, 0);
    global._GMHD_autoEnableHemisphereTracking = external_define(dllfile, 'GMH_autoEnableHemisphereTracking', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_setHemisphereTrackingMode = external_define(dllfile, 'GMH_setHemisphereTrackingMode', dll_cdecl, ty_real, 2, ty_real, ty_real);
    global._GMHD_getHemisphereTrackingMode = external_define(dllfile, 'GMH_getHemisphereTrackingMode', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_setHighPriorityBindingEnabled = external_define(dllfile, 'GMH_setHighPriorityBindingEnabled', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getHighPriorityBindingEnabled = external_define(dllfile, 'GMH_getHighPriorityBindingEnabled', dll_cdecl, ty_real, 0);
    global._GMHD_triggerVibration = external_define(dllfile, 'GMH_triggerVibration', dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    //Filters
    global._GMHD_setFilterEnabled = external_define(dllfile, 'GMH_setFilterEnabled', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getFilterEnabled = external_define(dllfile, 'GMH_getFilterEnabled', dll_cdecl, ty_real, 0);
    global._GMHD_setFilterParams= external_define(dllfile, 'GMH_setFilterParams', dll_cdecl, ty_real, 4, ty_real, ty_real, ty_real, ty_real);
    global._GMHD_getFilterNearRange = external_define(dllfile, 'GMH_getFilterNearRange', dll_cdecl, ty_real, 0);
    global._GMHD_getFilterNearVal = external_define(dllfile, 'GMH_getFilterNearVal', dll_cdecl, ty_real, 0);
    global._GMHD_getFilterFarRange = external_define(dllfile, 'GMH_getFilterFarRange', dll_cdecl, ty_real, 0);
    global._GMHD_getFilterFarVal = external_define(dllfile, 'GMH_getFilterFarVal', dll_cdecl, ty_real, 0);
    /// JOYSTICKS
    global._GMHD_updateStatus = external_define(dllfile, 'GMH_updateStatus', dll_cdecl, ty_real, 0);
    //Joystick X and  Y
    global._GMHD_getJoystickX = external_define(dllfile, 'GMH_getJoystickX', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getJoystickY = external_define(dllfile, 'GMH_getJoystickY', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getJoystickZ = external_define(dllfile, 'GMH_getJoystickZ', dll_cdecl, ty_real, 1, ty_real);
    
    global._GMHD_getJoystickRoll = external_define(dllfile, 'GMH_getJoystickRoll', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getJoystickPitch = external_define(dllfile, 'GMH_getJoystickPitch', dll_cdecl, ty_real, 1, ty_real);
    global._GMHD_getJoystickYaw = external_define(dllfile, 'GMH_getJoystickYaw', dll_cdecl, ty_real, 1, ty_real);
    
    global._GMHD_getJoystickMatrix = external_define(dllfile, 'GMH_getJoystickMatrix', dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    
    global._GMHD_getJoystickQuaternion = external_define(dllfile, 'GMH_getJoystickQuaternion', dll_cdecl, ty_real, 2, ty_real, ty_real);
    
    //Initialize device
    if (GMHD_init() == false) {
        show_debug_message("Razer Hydra support disabled.");
        show_message("Razer Hydra support disabled.");
        return false;
    } else {
        show_debug_message("Razer Hydra DLL loaded and initialized!");
        global._GMH_DLL_LOADED = true;
        return true;
    }

} else {
    show_debug_message("The Razer Hydra DLL is already loaded and initialized.");
    return true;
}
