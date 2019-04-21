/// @description step
menu_x += (menu_x_target - menu_x) / menu_speed;

if(menu_control){
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

if((menu_x > menu_gui_w + 150) and (menu_committed != -1)){
	switch(menu_committed){
		case 1: default:
		scr_fade_transition(transition_mode.GOTO, Level);
		break;
		
		case 0:
		game_end();
		break;
	}
}