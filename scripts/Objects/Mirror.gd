extends Area2D;
class_name Mirror;

var flipped: bool;
const dictDir = {
	Vector2.UP: Vector2.LEFT,
	Vector2.RIGHT: Vector2.DOWN,
	Vector2.DOWN: Vector2.RIGHT,
	Vector2.LEFT: Vector2.UP
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_flip(rotation_degrees != 0);

func get_ray(dir: Vector2) -> RayCast2D:
	match dir:
		Vector2.UP:
			return $Up;
		Vector2.DOWN:
			return $Down;
		Vector2.RIGHT:
			return $Right;
		Vector2.LEFT:
			return $Left;
	return null;

func get_reflected_direction(from: Vector2) -> RayCast2D:
	var dir = -to_local(from).normalized();
	return get_ray(dictDir[dir] if !flipped else -dictDir[dir]);

func set_flip(flip: bool) -> void:
	flipped = flip;
	$Espelho.flip_h = flipped;

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		set_flip(!flipped);
