/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 6FDDB19A
/// @DnDArgument : "code" "/// @desc Get Inputs$(13_10)key_left = keyboard_check(vk_left);$(13_10)key_right = keyboard_check(vk_right);$(13_10)key_jump = keyboard_check_pressed(vk_space);$(13_10)$(13_10)//Calc horizontal movement$(13_10)walljumpdelay = max(walljumpdelay-1,0);$(13_10)if (walljumpdelay == 0)$(13_10){$(13_10)	var dir = key_right - key_left;$(13_10)	hsp += dir * hsp_acc;$(13_10)	if (dir == 0) $(13_10)	{$(13_10)		var hsp_fric_final = hsp_fric_ground;$(13_10)		if (!onground) hsp_fric_final = hsp_fric_air;$(13_10)		hsp = Approach(hsp,0,hsp_fric_final);$(13_10)	}$(13_10)	hsp = clamp(hsp,-hsp_walk,hsp_walk);$(13_10)}$(13_10)$(13_10)//Wall jump$(13_10)if (onwall != 0) && (!onground) && (key_jump)$(13_10){$(13_10)	walljumpdelay = walljumpdelay_max;$(13_10)	$(13_10)	hsp = -onwall * hsp_wjump;$(13_10)	vsp = vsp_wjump;$(13_10)	$(13_10)	hsp_frac = 0;$(13_10)	vsp_frac = 0;$(13_10)}$(13_10)$(13_10)//Calc vertical movement$(13_10)var grv_final = grv;$(13_10)var vsp_max_final = vsp_max;$(13_10)if (onwall != 0) && (vsp > 0)$(13_10){$(13_10)	grv_final = grv_wall;$(13_10)	vsp_max_final = vsp_max_wall;$(13_10)}$(13_10)vsp += grv_final;$(13_10)vsp = clamp(vsp,-vsp_max_final,vsp_max_final);$(13_10)$(13_10)//Ground Jump$(13_10)if (jumpbuffer > 0)$(13_10){$(13_10)	jumpbuffer--;$(13_10)	if (key_jump)$(13_10)	{$(13_10)		jumpbuffer = 0;$(13_10)		vsp = vsp_jump;$(13_10)		vsp_frac = 0;$(13_10)	}$(13_10)}$(13_10)vsp = clamp(vsp,-vsp_max,vsp_max)$(13_10)$(13_10)//Dump fractions and get final integer speeds$(13_10)hsp += hsp_frac;$(13_10)vsp += vsp_frac;$(13_10)hsp_frac = frac(hsp);$(13_10)vsp_frac = frac(vsp);$(13_10)hsp -= hsp_frac;$(13_10)vsp -= vsp_frac;$(13_10)$(13_10)//Horizontal Collision$(13_10)if (place_meeting(x+hsp,y,obj_block))$(13_10){$(13_10)	var onepixel = sign(hsp);$(13_10)	while (!place_meeting(x+onepixel,y,obj_block)) x += onepixel;$(13_10)	hsp = 0;$(13_10)	hsp_frac = 0;$(13_10)}$(13_10)//Horizontal Move$(13_10)x += hsp;$(13_10)$(13_10)//Vertical Collision$(13_10)if (place_meeting(x,y+vsp,obj_block))$(13_10){$(13_10)	var onepixel = sign(vsp);$(13_10)	while (!place_meeting(x,y+onepixel,obj_block)) y += onepixel;$(13_10)	vsp = 0;$(13_10)	vsp_frac = 0;$(13_10)}$(13_10)//Vertical Move$(13_10)y += vsp;$(13_10)$(13_10)//Calc current status$(13_10)onground = place_meeting(x,y+1,obj_block);$(13_10)onwall = place_meeting(x+1,y,obj_block) - place_meeting(x-1,y,obj_block);$(13_10)if (onground) jumpbuffer = 6;$(13_10)$(13_10)//Adjust sprite$(13_10)image_speed = 1;$(13_10)if (hsp != 0) image_xscale = sign(hsp);$(13_10)if (!onground)$(13_10){$(13_10)	if (onwall != 0)$(13_10)	{$(13_10)		sprite_index = spr_wall;$(13_10)		image_xscale = onwall;$(13_10)		$(13_10)		var side = bbox_left;$(13_10)		if (onwall == 1) side = bbox_right;$(13_10)		dust++;$(13_10)		if ((dust > 2) && (vsp > 0)) with (instance_create_layer(side,bbox_top,"Behind",obj_dust))$(13_10)		{$(13_10)			other.dust = 0;$(13_10)			hspeed = -other.onwall*0.5;$(13_10)		}$(13_10)	}$(13_10)	else$(13_10)	{$(13_10)		dust = 0;$(13_10)		sprite_index = spr_jump;$(13_10)		image_speed = 0;$(13_10)		image_index = (vsp > 0);$(13_10)	}$(13_10)} $(13_10)else $(13_10){$(13_10)	if (hsp != 0) sprite_index = spr_run; else sprite_index = spr_idle;$(13_10)}$(13_10)"
/// @desc Get Inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calc horizontal movement
walljumpdelay = max(walljumpdelay-1,0);
if (walljumpdelay == 0)
{
	var dir = key_right - key_left;
	hsp += dir * hsp_acc;
	if (dir == 0) 
	{
		var hsp_fric_final = hsp_fric_ground;
		if (!onground) hsp_fric_final = hsp_fric_air;
		hsp = Approach(hsp,0,hsp_fric_final);
	}
	hsp = clamp(hsp,-hsp_walk,hsp_walk);
}

//Wall jump
if (onwall != 0) && (!onground) && (key_jump)
{
	walljumpdelay = walljumpdelay_max;
	
	hsp = -onwall * hsp_wjump;
	vsp = vsp_wjump;
	
	hsp_frac = 0;
	vsp_frac = 0;
}

//Calc vertical movement
var grv_final = grv;
var vsp_max_final = vsp_max;
if (onwall != 0) && (vsp > 0)
{
	grv_final = grv_wall;
	vsp_max_final = vsp_max_wall;
}
vsp += grv_final;
vsp = clamp(vsp,-vsp_max_final,vsp_max_final);

//Ground Jump
if (jumpbuffer > 0)
{
	jumpbuffer--;
	if (key_jump)
	{
		jumpbuffer = 0;
		vsp = vsp_jump;
		vsp_frac = 0;
	}
}
vsp = clamp(vsp,-vsp_max,vsp_max)

//Dump fractions and get final integer speeds
hsp += hsp_frac;
vsp += vsp_frac;
hsp_frac = frac(hsp);
vsp_frac = frac(vsp);
hsp -= hsp_frac;
vsp -= vsp_frac;

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_block))
{
	var onepixel = sign(hsp);
	while (!place_meeting(x+onepixel,y,obj_block)) x += onepixel;
	hsp = 0;
	hsp_frac = 0;
}
//Horizontal Move
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_block))
{
	var onepixel = sign(vsp);
	while (!place_meeting(x,y+onepixel,obj_block)) y += onepixel;
	vsp = 0;
	vsp_frac = 0;
}
//Vertical Move
y += vsp;

//Calc current status
onground = place_meeting(x,y+1,obj_block);
onwall = place_meeting(x+1,y,obj_block) - place_meeting(x-1,y,obj_block);
if (onground) jumpbuffer = 6;

//Adjust sprite
image_speed = 1;
if (hsp != 0) image_xscale = sign(hsp);
if (!onground)
{
	if (onwall != 0)
	{
		sprite_index = spr_wall;
		image_xscale = onwall;
		
		var side = bbox_left;
		if (onwall == 1) side = bbox_right;
		dust++;
		if ((dust > 2) && (vsp > 0)) with (instance_create_layer(side,bbox_top,"Behind",obj_dust))
		{
			other.dust = 0;
			hspeed = -other.onwall*0.5;
		}
	}
	else
	{
		dust = 0;
		sprite_index = spr_jump;
		image_speed = 0;
		image_index = (vsp > 0);
	}
} 
else 
{
	if (hsp != 0) sprite_index = spr_run; else sprite_index = spr_idle;
}