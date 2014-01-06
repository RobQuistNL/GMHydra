/*
Creates a new buffer and returns the buffers ID
note: ID's are actually the address of the buffer in memory so you
can access the data using external dll's by passing on the id.
*/
return external_call(global._BufU);
