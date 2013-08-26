call = external_call(global._GMHD_init);
if (call == GMH_SUCCESS) {
    global._GMH_DLL_INIT = true;
    return true;
} else {
    global._GMH_DLL_INIT = false;
    show_message("GMHydra DLL could not be initialized.");
    return false;
}

