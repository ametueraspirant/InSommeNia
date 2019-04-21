/// @description gdbdfdsgjdsghdsgfds

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_width_half = gui_width * 0.5;
gui_height_half = gui_height * 0.5;

enum transition_mode{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = transition_mode.INTRO;
percent = 1;
target = room;
