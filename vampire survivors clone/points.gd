extends Label
var points = 0
var ded = false
var time:Node2D
func _ready():
	time = get_node("/root").get_child(1).get_child(0)
func _process(delta):
	if ded == false:
		text = "skill:  "+str(points + time.get_number()) + "
		"+ "lives:  "+ str(get_parent().get_parent().get_lives())
	else: if(get_parent().get_parent().get_lives() == 0):
		text = "skill:  "+str(points) + "
		"+ "lives:  "+ str(get_parent().get_parent().get_lives())
func add_points(points_to_add):
	points += points_to_add
