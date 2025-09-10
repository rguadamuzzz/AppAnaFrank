if(instance_exists(obj_menu_exit) || global.won)
{
	exit;
}

// We divide by 1 million to get from microseconds
// to seconds
global.game_time += delta_time / 1000000;