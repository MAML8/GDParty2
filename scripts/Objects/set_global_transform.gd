extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation -= get_parent().rotation;
	global_position = get_parent().to_global(Vector2.ZERO) + position;
