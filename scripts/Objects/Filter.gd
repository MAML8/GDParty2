extends LightSource;
class_name Filter;

var right: RayCast2D;
var down: RayCast2D;
var left: RayCast2D;
var up: RayCast2D;
@export var filteringColor := Color.RED;
var isReceiveing := false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	right = get_child(2) as RayCast2D;
	down = get_child(3) as RayCast2D;
	left = get_child(4) as RayCast2D;
	up = get_child(5) as RayCast2D;
	line = get_child(6) as Line2D;
	filteringColor = Color(1-filteringColor.r, 1-filteringColor.g, 1-filteringColor.b);
	

func subtract_color(a: Color, b: Color) -> Color:
	var result: Color = Color.BLACK;
	result.r = clamp(a.r-b.r, 0, 1);
	result.g = clamp(a.g-b.g, 0, 1);
	result.b = clamp(a.b-b.b, 0, 1);
	result.a = 1;
	return result;

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

func filter_light(from: Vector2, color: Color) -> void:
	raycast = get_ray(-to_local(from).normalized());
	line.default_color = subtract_color(color, filteringColor);
	isReceiveing = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	line.clear_points();
	if !isReceiveing || line.default_color == Color.BLACK:
		return;
	light_beam();
	isReceiveing = false;
