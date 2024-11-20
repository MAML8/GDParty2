extends Node;
class_name LevelSelect;

func _ready() -> void:
	var quantSave := SaveGame.load_game();
	for i in quantSave:
		var button := get_child(i) as LevelSelectButton;
		button.visible = true;
		button.set_level(i+1);

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_0):
		SaveGame.rewrite_save(0);
	if Input.is_key_pressed(KEY_7):
		SaveGame.rewrite_save(7);
