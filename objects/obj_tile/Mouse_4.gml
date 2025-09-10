// We don't want tiles to move while a menu
// is open
if(!instance_exists(obj_menu_exit) && !global.won)
{
	var _moved = move_tile();

	// We only want the following to happen if a tile
	// actually moved
	if(_moved)
	{
		audio_play_sound(sfx_move_piece, 0, 0);
	
		global.moves += 1;
	
		// We add the tile we just moved at the
		// current point in our move list
		ds_list_insert(global.move_list, global.current_move, self);
	
		var _length = ds_list_size(global.move_list);
	
		// We then want to remove all the tiles
		// beyond this point from the move list , making
		// this the latest move in the list.
		for(var _i = _length - 1; _i > global.current_move; _i -= 1) {
			if(ds_list_size(global.move_list) > _i)
				ds_list_delete(global.move_list, _i);
		}
	
		global.current_move += 1;
		
		obj_button_undo.image_index = 0;
		obj_button_redo.image_index = 1;
	}

	else
	{
		audio_play_sound(sfx_invalid, 0, 0);
	}
}