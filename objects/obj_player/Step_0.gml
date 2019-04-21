/// @description movement and collision

#region //keyboard check conversion
up_check = keyboard_check(move_up);
left_check = keyboard_check(move_left);
right_check = keyboard_check(move_right);
down_check = keyboard_check(move_down);
attack_check = mouse_check_button(do_attack);
attack_check_tap = mouse_check_button_pressed(do_attack);
menu_check = keyboard_check_pressed(do_menu);
debug_check = keyboard_check_pressed(do_debug);
#endregion

#region //movement inputs
if(is_control = true and is_alive = true){
input_h = right_check - left_check;
input_v = down_check - up_check;
if(input_h != 0 or input_v != 0){
	run_dir = point_direction(0, 0, input_h, input_v);
	movement_x = lengthdir_x(run_speed, run_dir);
	movement_y = lengthdir_y(run_speed, run_dir);
	x += movement_x;
	y += movement_y;
}
run_speed = base_run_speed - pillow_count/4;
} else {
	right_check = false;
	left_check = false;
	up_check = false;
	down_check = false;
}
#endregion

#region //lookdir and buffers
if(input_h > 0)look_dir_h = 1;
else if(input_h < 0)look_dir_h = -1;
if(input_v > 0)look_dir_v = 1;
else if(input_v < 0)look_dir_v = -1;

if(attack_buffer >= 0)attack_buffer--;
if(attack_check_tap and attack_buffer < 10){
	attack_buffer = 10;
}
if(pillow_reload > 0)pillow_reload--;
#endregion

#region //controller
switch(move_state){
	case controller.idle:
	if(abs(input_h) > 0 or abs(input_v) > 0){
		scr_player_transition(controller.walk);
		break;
	}
	if(attack_check and pillow_reload <= 0 and attack_buffer >= 0 and pillow_count > 0){
		scr_player_transition(controller.attack);
		break;
	}
	break;
	
	case controller.walk:
	if(input_h = 0 and input_v = 0){
		scr_player_transition(controller.idle);
		break;
	}
	if(attack_check and pillow_reload <= 0 and attack_buffer >= 0 and pillow_count > 0){
		scr_player_transition(controller.attack);
		break;
	}
	if(abs(input_h) = 1 and input_v = 0){
		sprite_index = spr_player_walk_side;
	}
	if(input_v = 1 and input_h = 0){
		sprite_index = spr_player_walk_front;
	}
	if(input_v = -1 and input_h = 0){
		sprite_index = spr_player_walk_back;
	}
	break;
	
	case controller.attack:
	pillow_windup--;
	if(pillow_windup <= 0){
		pillow_reload = pillow_reload_reset;
		pillow_windup = pillow_windup_reset;
		pillow_count--;
		with(instance_create_layer(x, y, global.mainLayer, obj_pillow)){
			speed = 20;
			direction = point_direction(other.x, other.y, mouse_x, mouse_y) + random_range(-8, 8);
			image_angle = direction;
		}
		scr_player_transition(controller.idle);
		break;
	}
	break;
}
#endregion

//extra buttons
if(hit_points <= 0){
	is_alive = false;
	is_control =false;
	audio_play_sound(player_death, 1, false);
	scr_fade_transition(transition_mode.GOTO, Fail);
}
if(menu_check)scr_fade_transition(transition_mode.GOTO, Fail);
if(debug_check)is_debug = !is_debug;
