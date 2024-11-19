extends Area2D;
class_name Mirror;

var right: RayCast2D;
var down: RayCast2D;
var left: RayCast2D;
var up: RayCast2D;
var flipped: bool;
const dictDir = {
	Vector2.UP: Vector2.LEFT,
	Vector2.RIGHT: Vector2.DOWN,
	Vector2.DOWN: Vector2.RIGHT,
	Vector2.LEFT: Vector2.UP
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	right = get_child(2) as RayCast2D;
	down = get_child(3) as RayCast2D;
	left = get_child(4) as RayCast2D;
	up = get_child(5) as RayCast2D;
	set_flip(rotation_degrees != 0);

func get_ray(dir: Vector2) -> RayCast2D:
	match dir:
		Vector2.UP:
			return up;
		Vector2.DOWN:
			return down;
		Vector2.RIGHT:
			return right;
		Vector2.LEFT:
			return left;
	return null;

func get_reflected_direction(from: Vector2) -> RayCast2D:
	var dir = -to_local(from).normalized();
	return get_ray(dictDir[dir] if !flipped else -dictDir[dir]);

func set_flip(flip: bool) -> void:
	flipped = flip;
	get_child(1).rotation_degrees = 90 if flipped else 0;

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		set_flip(!flipped);
