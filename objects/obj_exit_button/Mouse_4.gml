if(!instance_exists(obj_menu_exit))
{
	if(room == room_first)
	{
		layer_sequence_create("GUI", room_width / 2, room_height / 2, seq_quit);
	}
	else
	{
		layer_sequence_create("GUI", room_width / 2, room_height / 2, seq_pause);
	}

	audio_play_sound(sfx_click, 0, 0);
}