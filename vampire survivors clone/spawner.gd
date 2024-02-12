extends Node2D
var spawntime : float
@export var enemy_type : String
func _ready():
	spawntime = 2
	spawnloop()
func _process(delta):
	if (get_parent().get_node("time").get_loop() % 60 == 0 && (get_parent().get_node("time").get_number()!=0)):
		spawntime = float(2)/(get_parent().get_node("time").get_number())
		print(spawntime)
	pass
func spawnloop():
	await get_tree().create_timer(spawntime).timeout
	spawn()
	if spawntime < 0.25: spawn()
	spawnloop()
func spawn():
	var enemy = load(enemy_type)
	var enemy_instance = enemy.instantiate()
	get_parent().add_child.call_deferred(enemy_instance)
	enemy_instance.position = get_parent().get_node("player").position + Vector2(500, 0).rotated(randf_range(0,2*PI))
