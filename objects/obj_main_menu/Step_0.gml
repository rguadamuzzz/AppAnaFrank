// We make the game size roll around to 3 if we go
// past the maximum of 5
if(global.game_size > 5)
{
	global.game_size = 3;
}

// We make the game size roll around to 5 if we go
// past the minimum of 3
if(global.game_size < 3)
{
	global.game_size = 5;
}