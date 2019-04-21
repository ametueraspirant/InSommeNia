/// @description the main menu
menu_gui_w = display_get_gui_width();
menu_gui_h = display_get_gui_height();
menu_gui_m = 32;

menu_x = menu_gui_w + 200;
menu_y = menu_gui_h - menu_gui_m;
menu_x_target = menu_gui_w - menu_gui_m;
menu_speed = 25;
menu_font = font_menu;
menu_item_height = font_get_size(font_menu);
menu_committed = -1;
menu_control = true;
menu[1] = "Play";
menu[0] = "Quit";
menu_items = array_length_1d(menu);
menu_cursor = 1;

sleeper_state = bed_state.sleep;
enum bed_state{
	sleep,
	wake,
	up
}