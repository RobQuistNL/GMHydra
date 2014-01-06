/*
Writes a sequence of characters to the buffer.
Argument0 = String to write.
[Argument1] = True/false. True to write string size for later reading
Returns the length of the string. + 2 if argument1==true.
*/
return external_call(global._BufB, argument0, argument1);
