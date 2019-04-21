/// @description collide with an enemy
with(other){
	hit_points--;
	flash = 1;
}
speed = -speed;
rebound = true;
