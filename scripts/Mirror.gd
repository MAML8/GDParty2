extends Area2D;

var raycast1: RayCast2D;
var raycast2: RayCast2D;
var flipped: bool;
const dictDir = {
	Vector2.UP: Vector2.LEFT,
	Vector2.RIGHT: Vector2.DOWN,
	Vector2.DOWN: Vector2.RIGHT,
	Vector2.LEFT: Vector2.UP
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast1 = get_child(2) as RayCast2D;
	raycast2 = get_child(3) as RayCast2D;
	set_flip(rotation_degrees != 0);

func get_reflected_direction(from: Vector2) -> RayCast2D:
	var dir = -to_local(from).normalized();
	var ray: RayCast2D = raycast1 if ((!flipped && (dir == Vector2.UP || dir == Vector2.RIGHT)) || ((flipped && (dir == Vector2.UP || dir == Vector2.LEFT)))) else raycast2;
	print(dir);
	print(dictDir[dir]);
	ray.target_position = (-dictDir[dir] if flipped else dictDir[dir]) * 2000;
	return ray;

func set_flip(flip: bool) -> void:
	flipped = flip;
	get_child(1).rotation_degrees = 90 if flipped else 0;

func _input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		set_flip(!flipped);
