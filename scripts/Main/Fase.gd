extends Node

@export var goals: Array[LightReceiver];
@export var winMessage: Label;
var curGoals := 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for a in goals:
		a.goal.connect(changeCompletion);

func changeCompletion(good: bool) -> void:
	curGoals += 1 if good else -1;
	if curGoals >= goals.size():
		win();

func win() -> void:
	winMessage.visible = true;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
