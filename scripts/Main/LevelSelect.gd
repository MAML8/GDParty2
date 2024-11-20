extends Node;
class_name LevelSelect;

func _ready() -> void:
	var quantSave := SaveGame.load();
	for i in quantSave:
		var button := get_child(i) as LevelSelectButton;
		button.visible = true;
		button.set_level(i);
