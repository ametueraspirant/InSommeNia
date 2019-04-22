/// @description spawn moobs
var random_x = random(room_width);
var random_y = random(room_height);
mob_timer--;

if(point_distance(random_x, random_y, obj_player.x, obj_player.y) > 200){
	if(instance_number(obj_enemy_oculo < 10) and mob_timer <= 0){
		instance_create_layer(random_x, random_y, "Instances", obj_enemy_oculo);
		mob_timer = mob_timer_reset;
		mob_timer_reset--;
	}
}