extends Area2D;

var raycast: RayCast2D;
var line: Line2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast = get_child(1) as RayCast2D;
	line = get_child(3) as Line2D;
	line.default_color = modulate;
	line.add_point(raycast.target_position.normalized()*50, 0);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	line.remove_point(1);
	if raycast.is_colliding():
		# var hit: Object = raycast.get_collider();
		line.add_point(to_local(raycast.get_collision_point()), 1);
	else:
		line.add_point(raycast.target_position, 1);
