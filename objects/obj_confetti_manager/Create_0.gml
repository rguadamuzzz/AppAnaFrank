// Create an encompassing particle system
part_sys = part_system_create();

// Define a temporary function for the time source
var _burst = function()
{
	// Throw the confetti by makeing the particles burst
	part_particles_burst(part_sys, room_width / 2 - 155, room_height / 2 + 35, ps_confetti_left);
	part_particles_burst(part_sys, room_width / 2 + 155, room_height / 2 + 35, ps_confetti_right);
}

// Create and start the time source
time_source = time_source_create(time_source_game, 66, time_source_units_frames, _burst);

time_source_start(time_source);