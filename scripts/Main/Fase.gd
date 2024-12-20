extends Node

@export var goals: Array[LightReceiver];
@export var NextLevel := -1;
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
	$WinMenu/AudioStreamPlayer2D.play();
	MainMusic.stop();

func nextLevel() -> void:
	MainMusic.play();
	if NextLevel >= 0:
		SaveGame.save_game(NextLevel);
		get_tree().change_scene_to_file("res://scenes/Levels/"+str(NextLevel)+".tscn");
	else:
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn");

func toMainMenu() -> void:
	MainMusic.play();
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn");
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
