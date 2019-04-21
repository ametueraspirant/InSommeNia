/// @description Insert description here
// You can write your code in this editor
if(rebound){
	speed = max(0, speed - 0.005);
	if(speed <= 1)speed = 0;
	if(speed =0){
		can_pick_up = true;
		image_speed = 0;
	}
}
