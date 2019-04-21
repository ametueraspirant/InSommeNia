/// @description movement and collision

#region //keyboard check conversion
up_check = keyboard_check(move_up);
left_check = keyboard_check(move_left);
right_check = keyboard_check(move_right);
down_check = keyboard_check(move_down);
attack_check = mouse_check_button(do_attack);
attack_check_tap = mouse_check_button_pressed(do_attack);
menu_check = keyboard_check(do_menu);
debug_check = keyboard_check(do_debug);
#endregion

#region //lookdir and buffers
if(x_speed > 0)look_dir_h = 1;
else if(x_speed < 0)look_dir_h = -1;
if(y_speed > 0)look_dir_v = 1;
else if(y_speed < 0)look_dir_v = -1;

if(attack_buffer >= 0)attack_buffer--;
if(attack_check_tap and attack_buffer < 10){
	attack_buffer = 10;
}
#endregion

#region //movement inputs
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
#endregion

#region //attack with pillow
if(pillow_reload > 0)pillow_reload--;
if(attack_check and pillow_reload <= 0 and attack_buffer >= 0 and pillow_count > 0){
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
	}
}
#endregion



//extra buttons
if(menu_check)is_menu = !is_menu;
if(debug_check)is_debug = !is_debug;
