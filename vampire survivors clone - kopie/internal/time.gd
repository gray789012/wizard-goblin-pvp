extends Node2D
#time since start
var t_Total:int
#time loop
var t_Loop:int
#time loop number
var t_Number:int
func _ready():
	await get_tree().create_timer(2).timeout
	print("2 second")
	pass
func _physics_process(delta):
	t_Total = t_Total + 1
	t_Loop = t_Loop + 1
	if(t_Loop >= 120):
		t_Loop = 0
		t_Number = t_Number + 1

func get_time():
	return t_Total
	
func get_loop():
	return t_Loop

func get_number():
	return t_Number
