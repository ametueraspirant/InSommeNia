/// @description BAH ONE HOUR LEFT
if(sprite_index = bed_cutscene_idle){
	if(scr_animation_end()){
		sprite_index = bed_cutscene_wake;
	}
}
if(sprite_index = bed_cutscene_wake){
	if(scr_animation_end()){
		image_speed = 0;
		obj_main_menu.sleeper_state = bed_state.wake;
	}
}
with(obj_main_menu){
	if(menu_committed != -1 and sleeper_state = bed_state.wake){
		switch(menu_committed){
		case 1: default:
		if(bed_idle.sprite_index != bed_cutscene_stand){
			bed_idle.sprite_index = bed_cutscene_stand;
			bed_idle.image_speed = 1;
		}
		break;
	
		case 0:
		bed_idle.sprite_index = bed_cutscene_sleep;
		bed_idle.image_speed = 1;
		break;
		}
	}
}
if(sprite_index = bed_cutscene_sleep){
	if(scr_animation_end()){
		sprite_index = bed_cutscene_idle;
		game_end();
	}
}
if(sprite_index = bed_cutscene_stand){
	if(scr_animation_end()){
		obj_main_menu.sleeper_state = bed_state.up;
	}
}
if(obj_main_menu.sleeper_state = bed_state.up){
	scr_fade_transition(transition_mode.GOTO, Level);
	/*instance_create_layer(0, 0, "Player", player_cutscene_walk);
	instance_create_layer(0, 0, "Bed", bed_empty); fuckin BROKEN
	instance_destroy();
	*/
}