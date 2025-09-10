// This disables this button while a menu is open
if(!instance_exists(obj_menu_exit))
{
	var _length = ds_list_size(global.move_list);

	// We can't redo if we're currently at the end of the list of
	// moves.
	if(global.current_move < _length)
	{
		// To redo, we get the tile that is at the current
		// point in the list of moves, and move it again.
		var _tile = ds_list_find_value(global.move_list, global.current_move);
		
		var _moved;
		
		with(_tile) {
			_moved = move_tile();
		}
	
		if(_moved)
		{
			global.current_move += 1;
		
			global.moves += 1;
			
			if(global.current_move < _length)
			{
				image_index = 0;
			}
			else
			{
				image_index = 1;
			}
			
			obj_button_undo.image_index = 0;
		}
	}

	audio_play_sound(sfx_click, 0, 0, 1.0, 0, 1.0);
}