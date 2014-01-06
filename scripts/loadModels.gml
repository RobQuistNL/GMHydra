global.joystick = d3d_model_create();

d3d_model_ellipsoid(global.joystick,-5,-5,-5,5,5,5,1,1,20);
d3d_model_block(global.joystick,-2,-2,-2,2,-50,2,1,1);

global.hydraModel = d3d_model_create();
d3d_model_load_ext(global.hydraModel,working_directory + "\hydra.obj",1,1,1)
