/// @description pick up pill-o
if(pillow_count < pillow_max){
	with(other){
		if(rebound){
			instance_destroy();
			obj_player.pillow_count++;
		}
	}
}
