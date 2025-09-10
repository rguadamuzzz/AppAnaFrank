if(room == room_first)
{
	game_end();
}
else
{
	room_goto(rm_menu);

	audio_stop_sound(music_ingame);
	audio_stop_sound(music_win);
}

audio_play_sound(sfx_click, 0, 0);