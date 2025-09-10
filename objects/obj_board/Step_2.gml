var _win = false;

// Here we loop through every tile to see if
// the puzzle is complete
for(var _i = 0; _i < ((grid_size * grid_size) - 1) ; _i += 1)
{
	var _curr_tile = ds_grid_get(global.tile_grid, (_i % grid_size), floor(_i / grid_size));

	// If we ever hit a break in the tiles then
	// the puzzle isn't finished
	if(_curr_tile == undefined)
	{
		_win = false;
	
		break;
	}

	// By comparing the frame of the current tile to i we can
	// determine whether or not the puzzle is arranged in ascentding
	// order. If i ever doesn't match the frame index then the puzzle
	// isn't complete
	if(!(_curr_tile.image_index == _i))
	{
		_win = false;
	
		break;
	}

	else
	{
		_win = true;
	}
}

// If all the tiles are in the correct place then the game is won!
if(_win && !global.won)
{
	global.won = true;
	
	// Destroy all the regular gameplay buttons
	if(instance_exists(obj_button_undo))
	{
		instance_destroy(obj_button_undo);
	}
	
	if(instance_exists(obj_button_redo))
	{
		instance_destroy(obj_button_redo);
	}
	
	if(instance_exists(obj_exit_button))
	{
		instance_destroy(obj_exit_button);
	}
	
	// Play the win music
	audio_stop_sound(music_ingame);
	
	audio_play_sound(music_win, 0, 0);
	
	// Move the time and move counter
	with(obj_timer)
	{
		y += 40;
	}
	
	with(obj_move_counter)
	{
		y += 130;
	}
	
	// Show the win screen
	if(room != room_last)
	{
		if(!instance_exists(obj_button_next))
		{
			instance_create_layer(1695, 412, "Instances", obj_button_next);
		}
	
		if(!instance_exists(obj_button_replay))
		{
			instance_create_layer(1695, 672, "Instances", obj_button_replay);
		}
	}
	else
	{
		if(!instance_exists(obj_button_home))
		{
			instance_create_layer(1695, 542, "Instances", obj_button_home);
		}
	}
	
	if(room == room_last) {
		var _seq = layer_sequence_create("GUI", room_width / 2, room_height / 2, seq_template_complete);
	}
	else{
		var _seq = layer_sequence_create("GUI", room_width / 2, room_height / 2, seq_win);
	}
	
	// Throw some confetti
	instance_create_layer(0, 0, "Confetti", obj_confetti_manager);
}