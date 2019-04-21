/// @description gdbdfdsgjdsghdsgfds

global.score_board = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

enum transition_mode{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = transition_mode.GOTO;
percent = 0;
target = room;
