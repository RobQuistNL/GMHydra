/*
  Gets a option value on a socket
  argument0 = socket
  argument1 = level
  argument2 = option
  argument3 = size of the data type used for the return value
  Returns the value of the option
  For advanced users only! Read the msdn.
*/
return external_call(global._SokW, argument0, argument1, argument2, argument3);
