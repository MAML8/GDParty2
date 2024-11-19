extends Area2D;
class_name LightReceiver;

var want: Color;
var isReceiveing := false;
var countinouslyReceiveing := false;
signal goal;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	want = get_child(2).modulate;

func receive_light(from: Vector2, color: Color) -> void:
	isReceiveing = color == want && to_local(from).normalized().round() == Vector2.DOWN;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	get_child(1).modulate = Color.WHITE if !isReceiveing else Color.GREEN;
	if isReceiveing && !countinouslyReceiveing:
		goal.emit(true);
	elif !isReceiveing && countinouslyReceiveing:
		goal.emit(false);
	countinouslyReceiveing = isReceiveing;
	isReceiveing = false;
