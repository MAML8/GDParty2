extends Node;
class_name SaveGame;

static var save_path := "res://save.save";

static func save(i: int) -> void:
	var file := FileAccess.open(save_path, FileAccess.WRITE);
	file.store_8(i);

static func load() -> int:
	var file := FileAccess.open(save_path, FileAccess.READ);
	return file.get_8();
