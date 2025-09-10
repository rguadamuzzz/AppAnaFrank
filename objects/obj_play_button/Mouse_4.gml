if(!instance_exists(obj_menu_exit))
{
	audio_stop_sound(music_menu);

	audio_play_sound(sfx_click, 0, 0);

	// Pick the puzzle room exitd on the selected game size
	switch(global.game_size)
	{
		case 3:
			room_goto(rm_3x3);
			break;
	
		case 4:
			room_goto(rm_4x4);
			break;
	
		case 5:
			room_goto(rm_5x5);
			break;
	
		default:
			break;
	}
}