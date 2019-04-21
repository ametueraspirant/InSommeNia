/// @description scr_fade_transition(mode, targetroom);
/// @arg Mode transitions next/restart/goto
/// @arg Target the target room

with(obj_room_transfer){
	mode = argument[0];
	if(argument_count > 1)target = argument[1];
}
