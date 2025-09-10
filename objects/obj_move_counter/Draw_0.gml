if(instance_exists(obj_menu_exit))
{
	exit;
}

draw_set_font(fnt_lilita_one);

draw_text_transformed(x, y, string("Moves: ") + string(global.moves), 1, 1, 0);