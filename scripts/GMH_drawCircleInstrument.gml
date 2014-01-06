//argument0 = x
//argument1 = y
//argument2 = text
//Argument3 = angle

draw_sprite_ext(spr_angle,0,argument0,argument1,1,1,argument3,c_white,1);
draw_set_color(c_red)
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(argument0,argument1+30,string(argument2)+ ": "+string(argument3));
draw_line_width(argument0,argument1,argument0,argument1-24,2);
draw_set_color(c_white)


