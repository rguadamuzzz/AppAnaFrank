// This function handles moving the tiles.
// We check if there is an empty space either
// above, below, left, or right of the chosen tile.
// If we find an empty space, we jump the tile object into
// that empty space, move the tile in our tile_grid global object,
// and then return true. If there are no empty spaces, we return
// false so that the game knows not to increment the move counter
// or add the tile to the move list.
function move_tile() 
{
	if (!(instance_place(x - sprite_width, y, obj_tile) > 0))
	{
		if (!(instance_place(x - sprite_width, y, obj_edge) > 0))
		{
			x += -sprite_width;
		
			grid_move_value(global.tile_grid, grid_x, grid_y, grid_x - 1, grid_y);
		
			grid_x += -1;
		
			return true;
		}
	}

	if (!(instance_place(x + sprite_width, y, obj_tile) > 0))
	{
		if (!(instance_place(x + sprite_width, y, obj_edge) > 0))
		{
			x += sprite_width;
		
			grid_move_value(global.tile_grid, grid_x, grid_y, grid_x + 1, grid_y);
		
			grid_x += 1;
		
			return true;
		}
	}

	if (!(instance_place(x, y + sprite_height, obj_tile) > 0))
	{
		if (!(instance_place(x, y + sprite_height, obj_edge) > 0))
		{
			y += sprite_height;
		
			grid_move_value(global.tile_grid, grid_x, grid_y, grid_x, grid_y + 1);
		
			grid_y += 1;
		
			return true;
		}
	}

	if (!(instance_place(x, y - sprite_height, obj_tile) > 0))
	{
		if (!(instance_place(x, y - sprite_height, obj_edge) > 0))
		{
			y += -sprite_height;
		
			grid_move_value(global.tile_grid, grid_x, grid_y, grid_x , grid_y - 1);
		
			grid_y += -1;
		
			return true;
		}
	}

	return false;
}