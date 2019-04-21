/// @description am I a programmer yet
//thank you for the tutorials shaun they're awesome
if(mode != transition_mode.OFF){
	if(mode == transition_mode.INTRO){
		percent = max(0, percent - max((percent/10), 0.005));
	} else {
		percent = min(1, percent + max(((1 - percent)/10), 0.005));
	}
	
	if(percent == 1 or percent == 0){
		switch(mode){
			case transition_mode.INTRO:
			mode = transition_mode.OFF;
			break;
			
			case transition_mode.NEXT:
			mode = transition_mode.INTRO;
			room_goto_next();
			break;
			
			case transition_mode.GOTO:
			mode = transition_mode.INTRO;
			room_goto(target);
			break;
			
			case transition_mode.RESTART:
			game_restart();
			break;
		}
	}
}
