/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 779B5D54
/// @DnDInput : 2
/// @DnDArgument : "expr" "-obj_player.image_xscale"
/// @DnDArgument : "expr_1" "obj_player.image_yscale"
/// @DnDArgument : "var" "image_xscale"
/// @DnDArgument : "var_1" "image_yscale"
image_xscale = -obj_player.image_xscale;
image_yscale = obj_player.image_yscale;

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 375F22C0
/// @DnDArgument : "var" "obj_player.image_xscale"
/// @DnDArgument : "op" "1"
if(obj_player.image_xscale < 0)
{
	/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
	/// @DnDVersion : 1
	/// @DnDHash : 42120390
	/// @DnDParent : 375F22C0
	/// @DnDArgument : "direction" "180"
	direction = 180;

	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 34927563
	/// @DnDParent : 375F22C0
	/// @DnDArgument : "speed" "10"
	speed = 10;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 1BE99A1D
else
{
	/// @DnDAction : YoYo Games.Movement.Set_Direction_Free
	/// @DnDVersion : 1
	/// @DnDHash : 48FDB662
	/// @DnDParent : 1BE99A1D
	direction = 0;

	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 36D2E543
	/// @DnDParent : 1BE99A1D
	/// @DnDArgument : "speed" "10"
	speed = 10;
}