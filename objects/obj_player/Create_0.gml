/// @description create variables
move_up = global.moveUp;
move_left = global.moveLeft;
move_right = global.moveRight;
move_down = global.moveDown;
do_attack = global.attack;
do_menu = global.menuButton;
do_debug = global.debugButton;

run_speed = 4;
base_run_speed = 4;

look_dir_h = 1;
look_dir_v = 1;
movement_x = 0;
movement_y = 0;

pillow_count = 4;
pillow_max = 4;
pillow_windup = 5;
pillow_windup_reset = 5;
pillow_reload = 0;
pillow_reload_reset = 50;
hit_points = 5;
attack_buffer = 0;
is_hurt = false;
is_alive = true;
is_control = true;

decision = random(1);
is_debug = false;

move_state = controller.idle;
