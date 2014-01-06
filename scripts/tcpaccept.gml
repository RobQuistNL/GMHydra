/*
Accepts and incoming connected on a listening socket.
Argument0 = Listening socket.
Argument1 = Blocking/Non-Blocking mode.
returns the id of a newly created read/write socket or a negative error code.
*/
return external_call(global._SokC, argument0, argument1);
