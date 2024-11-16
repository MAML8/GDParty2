extends Area2D;

var clicking: bool = false;
var offset: Vector2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		clicking = event.is_pressed();
		offset = event.position - position;
	if event is InputEventMouseMotion && clicking:
		position = event.position - offset;
