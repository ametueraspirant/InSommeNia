/// @description step
if(sleeper_state = bed_state.wake){
	menu_x += (menu_x_target - menu_x) / menu_speed;
}
if(menu_control and sleeper_state != bed_state.sleep){
	if(keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up)){
		menu_cursor++;
		if(menu_cursor >= menu_items)menu_cursor = 0;
	}
	if(keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down)){
		menu_cursor--;
		if(menu_cursor < 0)menu_cursor = menu_items - 1;
	}
	if(keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space)){
		menu_x_target = menu_gui_w + 200;
		menu_committed = menu_cursor;
		menu_control = false;
	}
}
