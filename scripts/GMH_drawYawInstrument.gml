//argument0 = x
//argument1 = y
//argument2 = yaw

draw_sprite_ext(spr_yaw,0,argument0,argument1,1,1,argument2,c_white,1);
draw_set_color(c_red)
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(argument0,argument1,argument2);
draw_line_width(argument0,argument1,argument0,argument1-60,2);
draw_set_color(c_white)


