if(room == room_first)
{
	draw_sprite(spr_menu_bg, 0, 0, 0);
}
else
{
	draw_sprite(spr_blurred_bg, 0, 0, 0);
}

draw_self();