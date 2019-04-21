/// @description draw me like one of your eldritch girls
draw_sprite_ext(sprite_index, image_index, x, y, look_dir, image_yscale, image_angle, image_blend, image_alpha);

if(flash > 0){
	flash--;
	shader_set(sha_flash);
	draw_self();
	shader_reset();
}
