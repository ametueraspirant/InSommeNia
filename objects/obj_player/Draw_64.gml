/// @description troubleshooting stats
if(is_debug){
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(font_default);
	/*insert future needed variables with 
		  draw_text(20, 20, "variable: " + string(variable));
	  add 20 to the second 20 each time
	*/
	draw_text(20, 20, "move_state: " + scr_move_state_to_string(move_state));
	draw_text(20, 40, "input_h: " + string(input_h));
	draw_text(20, 60, "input_v: " + string(input_v));
	draw_text(20, 80, "run_speed: " + string(run_speed));
	draw_text(20, 100, "pillow_windup: " + string(pillow_windup));
	draw_text(20, 120, "pillow_reload: " + string(pillow_reload));
	draw_text(20, 140, "is_control: " + string(is_control));
	draw_text(20, 160, "hit_points: " + string(hit_points));
	draw_text(20, 180, "pillow_count: " + string(pillow_count));
}
