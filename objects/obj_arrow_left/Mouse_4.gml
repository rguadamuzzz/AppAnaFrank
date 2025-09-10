if(!instance_exists(obj_menu_exit))
{
	global.game_size += -1;

	audio_play_sound(sfx_click, 0, 0);
}