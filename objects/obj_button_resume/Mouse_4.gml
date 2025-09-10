var _objects = sequence_get_objects(seq_quit);
	
for(var _i = 0; _i < array_length(_objects); _i++)
{
	if(instance_exists(_objects[_i]))
	{
		instance_destroy(_objects[_i]);
	}
}

audio_play_sound(sfx_close, 0, 0);