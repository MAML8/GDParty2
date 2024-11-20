extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$StartButton.pressed.connect(start);
	$QuitButton.pressed.connect(quit);
	$LevelSelectButton.pressed.connect(level_select);

func level_select() -> void:
	get_tree().change_scene_to_file("res://scenes/LevelSelect.tscn");

func start() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/1.tscn");

func quit() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST);
	get_tree().quit();
