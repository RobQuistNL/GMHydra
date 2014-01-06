///Get the rotation matrix in array form for controller with ID argument0

cid = argument0 //Controller ID
matrix[0] = GMHD_getJoystickMatrix(cid, 0, 0);
matrix[1] = GMHD_getJoystickMatrix(cid, 0, 1);
matrix[2] = GMHD_getJoystickMatrix(cid, 0, 2);
matrix[3] = GMHD_getJoystickMatrix(cid, 1, 0);
matrix[4] = GMHD_getJoystickMatrix(cid, 1, 1);
matrix[5] = GMHD_getJoystickMatrix(cid, 1, 2);
matrix[6] = GMHD_getJoystickMatrix(cid, 2, 0);
matrix[7] = GMHD_getJoystickMatrix(cid, 2, 1);
matrix[8] = GMHD_getJoystickMatrix(cid, 2, 2);


return matrix;
