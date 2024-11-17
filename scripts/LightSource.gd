extends Area2D;
class_name LightSource;

var raycast: RayCast2D;
var line: Line2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast = get_child(1) as RayCast2D;
	line = get_child(3) as Line2D;
	line.default_color = modulate;

func light_beam() -> void:
	
	line.add_point(raycast.target_position.normalized()*50, 0);
	var ray: RayCast2D = raycast;
	var oldray: RayCast2D = null;
	while ray!=oldray:
		oldray = ray;
		if ray.is_colliding():
			var hit: Object = ray.get_collider();
			if hit is Mirror:
				ray = hit.get_reflected_direction(ray.get_parent().position);
				line.add_point(to_local(hit.position));
			elif hit is LightSumer:
				line.add_point(to_local(hit.position));
				hit.receiver_color(line.default_color);
			elif hit is LightReceiver:
				line.add_point(to_local(hit.get_parent().position));
				hit.receive_light(line.default_color);
			else:
				line.add_point(to_local(ray.get_collision_point()));
		else:
			line.add_point(to_local(ray.get_parent().position + ray.target_position));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	line.clear_points();
	light_beam();
