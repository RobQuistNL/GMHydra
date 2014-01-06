/*
  Reads bytes from the file and copies to the internal buffer (starting at the
  write position)
  Argument0 = file id.
  Argument1 = Number of bytes to read.
*/
return external_call(global._FilD, argument0, argument1);
