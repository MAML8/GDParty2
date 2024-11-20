extends Node;
class_name SaveGame;

static var save_path := "res://save.save";

static func save_game(i: int) -> void:
	if i <= load_game():
		return;
	rewrite_save(i);

static func rewrite_save(i: int) -> void:
	var file := FileAccess.open(save_path, FileAccess.WRITE);
	file.store_8(i);

static func load_game() -> int:
	var file := FileAccess.open(save_path, FileAccess.READ);
	return file.get_8();
