/// @description movement and collision

up_check = keyboard_check(move_up);
left_check = keyboard_check(move_left);
right_check = keyboard_check(move_right);
down_check = keyboard_check(move_down);
attack_check = keyboard_check(do_attack);
attack_check_tap = keyboard_check_pressed(do_attack);
menu_check = keyboard_check(do_menu);
debug_check = keyboard_check(do_debug);

if(x_speed > 0)look_dir = 1;
else if(x_speed < 0)look_dir = -1;

if(attack_buffer >= 0)attack_buffer--;
