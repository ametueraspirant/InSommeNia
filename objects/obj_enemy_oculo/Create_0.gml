/// @description basic stats
oculo_move_up = false;
oculo_move_left = false;
oculo_move_right = false;
oculo_move_down = false;
oculo_attack = false;

run_speed = 2.5;
flash = 0;

look_dir = 1;
x_speed = 0;
y_speed = 0;

bite_cooldown = 0;
bite_cooldown_reset = 300;
hit_points = 1;
oculo_hurt = false;
oculo_alive = true;
oculo_control = true;

decision = random(1);
attack_has_hit = ds_list_create();
mob_state = controller.idle;