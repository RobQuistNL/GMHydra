//Returns how much bytes are left to read. Buffsize-Buffreadpos.
return external_call(global._BufQ) - external_call(global._BufO, true);
