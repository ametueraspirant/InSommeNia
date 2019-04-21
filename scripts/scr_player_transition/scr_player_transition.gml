switch(argument0){
	case controller.idle:
	
	is_control = true;
	if(sprite_index = spr_player_walk_front or sprite_index = spr_player_attack_front){
		sprite_index = spr_player_idle_front;
	} else if(sprite_index = spr_player_walk_back or sprite_index = spr_player_attack_back){
		sprite_index = spr_player_idle_back;
	} else if(sprite_index = spr_player_walk_side or sprite_index = spr_player_attack_side){
		sprite_index = spr_player_idle_side;
	}
	move_state = controller.idle;
	break;
	
	case controller.walk:
	
	move_state = controller.walk;
	break;
	
	case controller.attack:
	
	is_control = false;
	move_state = controller.attack;
	//if(point_direction(x, y, mouse_x, mouse_y) ){
		
	//}
	break;
}
