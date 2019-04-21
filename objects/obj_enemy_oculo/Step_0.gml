/// @description move around

#region //lookdir
if(x_speed > 0)look_dir = 1;
else if(x_speed < 0)look_dir = -1;
#endregion

#region //movement
input_h = oculo_move_right - oculo_move_left;
input_v = oculo_move_down - oculo_move_up;
if(input_h != 0 or input_v != 0){
	run_dir = point_direction(0, 0, input_h, input_v);
	movement_x = lengthdir_x(run_speed, run_dir);
	movement_y = lengthdir_y(run_speed, run_dir);
	x += movement_x;
	y += movement_y;
}
#endregion

#region //attack

#endregion
