extends Area2D;
class_name LightSource;

var raycast: RayCast2D;
var line: Line2D;
@export var lightColor := Color.WHITE;
@export var lightStartOffset: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	raycast = get_child(2) as RayCast2D;
	line = $Light;
	line.default_color = lightColor;

func light_beam() -> void:
	var vec: Vector2 = Vector2(raycast.position.x, 0) + lightStartOffset;
	line.add_point(vec, 0);
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
				line.add_point(to_local(hit.position));
				hit.receive_light(ray.get_parent().position, line.default_color);
			elif hit is Filter:
				line.add_point(to_local(hit.position));
				hit.filter_light(ray.get_parent().position, line.default_color);
			else:
				line.add_point(to_local(ray.get_collision_point()));
		else:
			line.add_point(to_local(ray.get_parent().position + ray.target_position));

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	line.clear_points();
	light_beam();
