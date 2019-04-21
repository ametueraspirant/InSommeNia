/// @description draw prison bars
if(mode != transition_mode.OFF){
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0, 0, gui_width, gui_height, false);
	
}

draw_set_color(c_white);
draw_text(50, 50, string(percent));
