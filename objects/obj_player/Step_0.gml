/// @description movement and collision
up_check = keyboard_check(move_up);
left_check = keyboard_check(move_left);
right_check = keyboard_check(move_right);
down_check = keyboard_check(move_down);
attack_check = keyboard_check(do_attack);
attack_check_tap = keyboard_check_pressed(do_attack);
menu_check = keyboard_check(do_menu);
debug_check = keyboard_check(do_debug);

if(x_speed > 0)look_dir_h = 1;
else if(x_speed < 0)look_dir_h = -1;
if(y_speed > 0)look_dir_v = 1;
else if(y_speed < 0)look_dir_v = -1;

if(attack_buffer >= 0)attack_buffer--;
if(attack_check_tap and attack_buffer < 10){
	attack_buffer = 10;
}

if(right_check and !place_meeting(x + 1, y, obj_parent_collider)){
	if(x_speed <= max_run_speed){
		x_speed += accel_var;
	}
}
if(left_check and !place_meeting(x - 1, y, obj_parent_collider)){
	if(x_speed >= -max_run_speed){
		x_speed -= accel_var;
	}
}
if(up_check and !place_empty(x, y - 1, obj_parent_collider)){
	if(y_speed >= -max_run_speed){
		y_speed -= accel_var;
	}
}
if(down_check and !place_empty(x, y + 1, obj_parent_collider)){
	if(y_speed <= max_run_speed){
		y_speed += accel_var;
	}
}

