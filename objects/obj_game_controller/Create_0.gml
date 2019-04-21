/// @description Global variables

global.moveUp = ord("W");
global.moveLeft = ord("A");
global.moveRight = ord("D");
global.moveDown = ord("S");
global.attack = mb_left;
global.mainLayer = "Instances";
global.menuButton = vk_escape;
global.debugButton = vk_f3;

randomise();

night_gui_w = display_get_gui_width();
night_gui_h = display_get_gui_height();
night_color = merge_color(c_black, c_blue, 0.15);

enum controller{
	idle,
	walk,
	attack,
}
