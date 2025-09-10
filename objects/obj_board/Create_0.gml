// This randomises our seed to make sure the
// puzzle is different every time
randomize();

_particle = part_system_create();

global.move_list = ds_list_create();

global.current_move = 0;

global.won = false;

global.tile_grid = ds_grid_create(grid_size, grid_size);

ds_grid_clear(global.tile_grid, undefined);

// We loop for as many times as there are tiles
// in the puzzle
for(var _i = 0; _i < ((grid_size*grid_size) -1); _i += 1) {
	// We create the tile
	var _tile = instance_create_layer(x, y, "Instances", obj_tile);

	var _temp_sprite = tile_sprite;

	// We assign it a sprite and use the frame
	// to change which piece of the picture it is
	with(_tile) {
		sprite_index = _temp_sprite;
		image_index = _i;
	}

	// This value calculates which column of the puzzle
	// grid this tile should be in.
	// e.g for i = 2 and grid_size = 3, 2 % 3 gives us the remainder of 2
	// so the tile with index 2 (the 3rd tile) should be in the column
	// with index 2 (the 3rd column).
	var _grid_x = _i % grid_size;

	// This value calculates which row of the puzzle
	// grid this tile should be in.
	// e.g for i = 2 and grid_size = 3, floor(2/3) gives us 0 so the
	// tile with index 2 (the 3rd tile) should be in the row with
	// index 0 (the 1st row).
	var _grid_y = floor(_i / grid_size);

	// Multiplying the sprite width by the grid position gives
	// us the x screen position of the tile.
	var _tile_x = _tile.sprite_width * _grid_x;

	// Multiplying the sprite height by the grid position gives
	// us the y screen position of the tile.
	var tile_y = _tile.sprite_height * _grid_y;

	with(_tile) {
		x += _tile_x;
		y += tile_y;
	}

	ds_grid_set(global.tile_grid, _grid_x, _grid_y, _tile);

	with(_tile) {
		grid_x = _grid_x;
		grid_y = _grid_y;
	}
}

// This loop will shuffle the puzzle by moving the tiles
// at random
for(var _i = 0; _i < 1000; _i += 1) {
	var _temp_x = floor(random_range(0, grid_size - 1 + 1));

	var _temp_y = floor(random_range(0, grid_size - 1 + 1));

	var _chosen_tile = ds_grid_get(global.tile_grid, _temp_x, _temp_y);

	if(_chosen_tile != undefined)
	{
		with(_chosen_tile) {
			move_tile();
		}
	}
}

// If the music is not already playing, play the in game music
if (!audio_is_playing(music_ingame))
{
	audio_play_sound(music_ingame, 0, 1);
}