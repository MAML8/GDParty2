extends Button;
class_name LevelSelectButton;

var Level: int;

func set_level(a: int) -> void:
	Level = a;
	text = str(a);

func _pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/" + str(Level) + ".tscn");
