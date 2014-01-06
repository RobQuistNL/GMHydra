/*
  Sets a option on a socket
  argument0 = socket
  argument1 = level
  argument2 = option
  argument3 = value
  argument4 = size of the data type used for value
  For advanced users only! Read the msdn.
*/
return external_call(global._SokV, argument0, argument1, argument2, argument3, argument4);
