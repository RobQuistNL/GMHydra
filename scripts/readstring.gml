/*Returns a string from the buffer.
Argument0 = amount of characters to read.
[Argument1] = Seperator.
If Argument0 is 0 bytes then it will return a string string based on its size.
If Argument0 is 0 bytes a seperator is used then it will return a string that
is seperated by the seperator string.
*/
return external_call(global._BufH, argument0, argument1);
