object = instance_create(0,0,obj_hydra_joystick);
    with (object) {
        z = 0;

        roll = 0;
        pitch = 0;
        yaw = 0;
        
        q0 = 0;
        q1 = 0;
        q2 = 0;
        q3 = 0;
        
        trigger = 0;
        buttons = 0;
        
        joystick_x = 0;
        joystick_y = 0;
        
        is_docked = 0;
        which_hand = 0;
    }
    object.controller_id = argument0;

return object;