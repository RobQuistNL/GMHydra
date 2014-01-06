/*
Receives data from the selected tcp or udp socket and copies to the 
internal buffer.
Argument0 = Socket to recieve from.
[Argument1] = Amount of bytes to receive. Optional. Overrides the format
mode if used.
returns the amount of bytes recieved
*/
return external_call(global._SokE, argument0, argument1);
