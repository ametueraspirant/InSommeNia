/// @description move around

#region //lookdir
if(x_speed > 0)look_dir = 1;
else if(x_speed < 0)look_dir = -1;
#endregion

#region //movement
if(oculo_alive and oculo_control){
	input_h = oculo_move_right - oculo_move_left;
	input_v = oculo_move_down - oculo_move_up;
	if(input_h != 0 or input_v != 0){
		run_dir = point_direction(0, 0, input_h, input_v);
		movement_x = lengthdir_x(run_speed, run_dir);
		movement_y = lengthdir_y(run_speed, run_dir);
		x += movement_x;
		y += movement_y;
	}
}
#endregion

#region //state machine
switch(mob_state){
	case controller.idle:
	if(point_distance(x, y, obj_player.x, obj_player.y) <= 500){
		scr_oculo_transition(controller.walk);
		break;
	}
	break;
	
	case controller.walk:
	if(point_distance(x, y, obj_player.x, obj_player.y) > 500){
		scr_oculo_transition(controller.idle);
		break;
	}
	if(point_distance(x, y, obj_player.x, obj_player.y) < 50){
		scr_oculo_transition(controller.attack);
		break;
	}
	if(obj_player.x > x){
		oculo_move_left = false;
		oculo_move_right = true;
	} else if(obj_player.x < x){
		oculo_move_left = true;
		oculo_move_right = false;
	} else {
		oculo_move_left = false;
		oculo_move_right = false;
	}
	if(obj_player.y > y){
		oculo_move_up = false;
		oculo_move_down = true;
	} else if(obj_player.y < y){
		oculo_move_up = true;
		oculo_move_down = false;
	} else {
		oculo_move_up = false;
		oculo_move_down = false;
	}
	break;
	
	case controller.attack:
	var attack_has_just_hit = ds_list_create();
	var hits = instance_place_list(x, y, obj_player, attack_has_just_hit, false);
	if(hits > 0){
		for(var beb = 0; beb < hits; beb++){
			var ID = ds_list_find_value(attack_has_just_hit, beb);
			if(ds_list_find_index(attack_has_hit, ID) == -1){
				ds_list_add(attack_has_hit, ID);
				with(ID){
					hit_points--;
					is_hurt = true;
				}
			}
		}
	}
	ds_list_destroy(attack_has_just_hit);
	mask_index = spr_oculo_idle;
	bite_cooldown = bite_cooldown_reset;
	if(scr_animation_end()){
		scr_oculo_transition(controller.idle);
	}
	break;
}
#endregion

if(oculo_hurt){
	oculo_control = false;
	sprite_index = spr_oculo_hurt;
	if(scr_animation_end()){
		oculo_control = true;
		oculo_hurt = false;
	}
}

if(hit_points <= 0){
	oculo_alive = false;
	oculo_control = false;
	sprite_index = spr_oculo_die;
	if(scr_animation_end()){
		global.score_board++;
		instance_destroy();
	}
}
