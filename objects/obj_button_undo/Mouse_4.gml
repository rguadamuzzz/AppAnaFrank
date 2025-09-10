// This disables the button while a menu is open
if(!instance_exists(obj_menu_exit))
{
	// We can't undo if there are no moves behind us to undo!
	if(global.current_move > 0)
	{
		// Get the last tile moved and move it
		var _last_tile = ds_list_find_value(global.move_list, global.current_move - 1);
	
		var _moved;
		
		with(_last_tile) {
			_moved = move_tile();
		}
	
		if(_moved)
		{
			global.moves += 1;
		
			global.current_move += -1;
			
			// Changes the undo sprite button based on if it is still possible to move back
			if(global.current_move > 0)
			{
				image_index = 0;
			}
			else
			{
				image_index = 1;
			}
			
			obj_button_redo.image_index = 0;
		}
	}

	audio_play_sound(sfx_click, 0, 0, 1.0, 0, 1.0);
}