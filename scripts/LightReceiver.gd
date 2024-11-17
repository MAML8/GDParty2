extends Area2D;
class_name LightReceiver;

var want: Color;
var isReceiveing := false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	want = get_child(1).modulate;

func receive_light(color: Color) -> void:
	print("receiveing: " + str(color) + "| wanting: " + str(want));
	isReceiveing = color == want;
	print(isReceiveing);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	print(isReceiveing);
	get_parent().get_child(1).modulate = Color.WHITE if !isReceiveing else Color.GREEN;
	isReceiveing = false;
