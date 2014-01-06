var c;
if (global._transmod_current != -1) {
    c = global._transmod_current;
} else {
    c = 0;
}            
// discard all            
return d3d_transmod_stack_discard (c);

