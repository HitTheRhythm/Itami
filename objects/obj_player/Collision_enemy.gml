if(oPlayer.x!=enemy.x && !vsp>0)
{


	draw_text(x + 0, y + -20, string("You are Dead! ") + "");

	instance_change(pPlayer_dead, true);

	//room_restart();
}

else
{


	with(other) instance_change(enemy_dead, true);
}