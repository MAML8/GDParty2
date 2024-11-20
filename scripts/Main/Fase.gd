extends Node

@export var goals: Array[LightReceiver];
@export var LevelId: int;
var curGoals := 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for a in goals:
		a.goal.connect(changeCompletion);

func changeCompletion(good: bool) -> void:
	curGoals += 1 if good else -1;
	if curGoals >= goals.size():
		win();
	$WinMenu/MainMenuButton.pressed.connect(toMainMenu);
	$WinMenu/NextLevelButton.pressed.connect(nextLevel);

func win() -> void:
	$WinMenu.visible = true;

func nextLevel() -> void:
	get_tree().change_scene_to_file("res://scenes/Level/"+str(LevelId+1)+".tsn");

func toMainMenu() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn");
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
