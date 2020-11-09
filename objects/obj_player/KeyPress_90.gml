/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7CD5A2A5
/// @DnDArgument : "code" "attacking = true;$(13_10)sprite_index = spr_throwing;$(13_10)image_speed =0.75;"
attacking = true;
sprite_index = spr_throwing;
image_speed =0.75;

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 6C1999AF
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "objectid" "obj_knives"
/// @DnDSaveInfo : "objectid" "obj_knives"
instance_create_layer(x + 0, y + 0, "Instances", obj_knives);

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 22D3EB5D
/// @DnDArgument : "expr" "false"
/// @DnDArgument : "var" "canshoot"
canshoot = false;

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 1AEA281D
alarm_set(0, 30);