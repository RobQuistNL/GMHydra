/*
Copies any data recieved on a specified socket to the internal buffer but
does not remove it from the recv buffer.
Argument0 = TCP or UDP socket to recieve from
[Argument1] = Bytes to receive. Optional (otherwise receives as much as
possible)
Returns amount of bytes recieved.
*/
return external_call(global._SokS, argument0, argument1);
