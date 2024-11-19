extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$StartButton.pressed.connect(start);
	$QuitButton.pressed.connect(quit);

func start() -> void:
	get_tree().change_scene_to_file("res://scenes/Debug.tscn");

func quit() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST);
	get_tree().quit();
