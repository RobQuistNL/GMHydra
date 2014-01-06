if (calibration == 0) { 
    if (keyboard_check_released(vk_space)) {
        calibration = 1;
        calibrationString = 'Orientation calibration##1. Face forward to the base.#2. Hold controllers against each other, facing forward, completely flat # - the stick on the controllers should be completely flat.##Press OK when in position.';
    }
    return false; 
} else {
    
    if (keyboard_check_released(vk_space)) {
    
        switch (calibration) {
        
            case 1:
                //Enable the hemisphere tracking
                GMHD_autoEnableHemisphereTracking(0);
                GMHD_autoEnableHemisphereTracking(1);
                //Calculate some pitch / yaw / roll offsets
                GMHD_calibrateRotationRazerHydra();
                calibration++;
                calibrationString = 'Put controllers on floor and press OK.';
                break;
            
            case 2:
                global._GMH_zMin[0] = GMHD_getJoystickZ(0);
                global._GMH_zMin[1] = GMHD_getJoystickZ(1);
                calibrationString = 'Take controllers, put on eye-height';
                calibration++;
                break;
                
            case 3:
                global._GMH_zMax[0] = GMHD_getJoystickZ(0);
                global._GMH_zMax[1] = GMHD_getJoystickZ(1);
                calibrationString = 'Turn 90 degrees to the right of your base.#Hold out the controllers as far as you can';
                calibration++;
                break;
            
                 
            case 4:
                global._GMH_xMax[0] = GMHD_getJoystickX(0);
                global._GMH_xMax[1] = GMHD_getJoystickX(1);
                calibrationString = 'Turn 90 degrees to the left of your base.#Hold out the controllers as far as you can';
                calibration++;
                break;
                
            case 5:
                global._GMH_xMin[0] = GMHD_getJoystickX(0);
                global._GMH_xMin[1] = GMHD_getJoystickX(1);
                calibrationString = 'Face towards base. Stick hands out as far as possible.';
                calibration++;
                break;
            
            case 6:
                global._GMH_yMin[0] = GMHD_getJoystickY(0);
                global._GMH_yMin[1] = GMHD_getJoystickY(1);
                calibrationString = 'Turn your back to the base. Stick hands out as far as possible.';
                calibration++;
                break;
                
            case 7:
                global._GMH_yMax[0] = GMHD_getJoystickY(0);
                global._GMH_yMax[1] = GMHD_getJoystickY(1);
                calibrationString = 'Calibration is done!';
                calibration = 0;
                break;
        }    
    
    }
}
