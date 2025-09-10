if(instance_exists(obj_menu_exit))
{
	exit;
}

draw_set_font(fnt_lilita_one);

var _minutes = floor((global.game_time/60));
var _seconds = floor(global.game_time)%60;

if(_minutes < 10)
	_minutes = "0" + string(_minutes);
	
if(_seconds < 10)
	_seconds = "0" + string(_seconds);

var _time_string = string("{0}:{1}", _minutes, _seconds);

draw_text_transformed(x, y, string("Time: ") + string(_time_string), 1, 1, 0);