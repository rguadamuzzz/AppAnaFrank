// This function simply moves a value from one
// grid position to the other
function grid_move_value(_grid, _old_x, _old_y, _new_x, _new_y) 
{
	var _grid_val = ds_grid_get(_grid, _old_x, _old_y);

	ds_grid_set(_grid, _new_x, _new_y, _grid_val);

	ds_grid_set(_grid, _old_x, _old_y, undefined);
}