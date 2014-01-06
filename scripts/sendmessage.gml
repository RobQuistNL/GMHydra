/*
  Sends the data in the internal buffer to the selected tcp or udp socket.
  Argument0 = Socket to send to.
  [Argument1] = Ip to send to (for udp sockets)
  [Argument2] = Port to send to (for udp socket)
  Returns the amount of bytes sent + the bytes used to seperate the messages
*/
return external_call(global._SokD, argument0, argument1, argument2);
