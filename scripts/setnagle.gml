/*
Turns on/off the naggle (TCP NODELAY) algorithm.
argument0 = socket id to affect
argument1 = true/false (on/off)
*/
return external_call(global._SokT, argument0, argument1);
