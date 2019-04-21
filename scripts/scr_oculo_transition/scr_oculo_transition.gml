switch(argument0){
	case controller.idle:
	
	sprite_index = spr_oculo_idle;
	oculo_attack = false;
	mob_state = controller.idle;
	break;
	
	case controller.walk:
	
	sprite_index = spr_oculo_move;
	mob_state = controller.walk;
	break;
	
	case controller.attack:
	
	sprite_index = spr_oculo_attack;
	mask_index = spr_oculo_attack_hb;
	image_index = 0;
	ds_list_clear(attack_has_hit);
	oculo_attack = true;
	mob_state = controller.attack;
	break;
}
