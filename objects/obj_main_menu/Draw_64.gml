/// @description Draw the menu
draw_set_font(font_blocky);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for(var mem = 0; mem < menu_items; mem++){
	var offset = 2;
	var text = menu[mem];
	if(menu_cursor = mem){
		text = string_insert("> ", text, 0);
		var color = c_white;
	} else {
		var color = c_gray;
	}
	var memx = menu_x;
	var memy = menu_y - (menu_item_height * (mem * 1.5));
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_text(memx + offset, memy, text);
	draw_text(memx, memy - offset, text);
	draw_text(memx - offset, memy, text);
	draw_text(memx, memy + offset, text);
	draw_set_color(color);
	draw_text(memx, memy, text);
}
