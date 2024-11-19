extends LightSource;
class_name LightSumer;

var colorList: Array[Color];

func receiver_color(c: Color) -> void:
	colorList.append(c);
	
func color_sum(a: Color, b: Color) -> Color:
	var result: Color = a+b;
	result.a = 1;
	return result;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	line.clear_points();
	if colorList.is_empty():
		return;
	var color: Color = Color(0, 0, 0);
	for i in colorList.size():
		color = color_sum(color, colorList[i]);
	line.default_color = color;
	light_beam();
	colorList.clear();
