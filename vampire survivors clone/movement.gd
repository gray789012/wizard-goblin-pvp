extends RigidBody2D
@export var speed = 5
var sinMod = 0
var spawntime = 1.5
signal levelup
var ded = false
@export var lives = 6
var random_vector:Vector2
var last_enemy = null
func _process(delta):
	if (get_parent().get_node("time").get_loop() % 60 == 0 && (get_parent().get_node("time").get_number()!=0) && lives > 0):
		spawntime = 1.5/(get_parent().get_node("time").get_number())
		speed = 5 + (get_parent().get_node("time").get_number())
		levelup.emit()
	if (lives == 0):
		speed = 0
		get_child(0).text = "i Ded ):"
		get_child(1).get_child(0).ded = true
		ded = true
		await get_tree().create_timer(2).timeout
		var level = load('res://main_menu.tscn').instantiate()
		get_parent().get_parent().add_child(level)
		get_parent().queue_free()
	random_vector.x = randf_range(-0.1,0.1)
	random_vector.y = randf_range(-0.1,0.1)
func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("W"):velocity.y -= 1
	if Input.is_action_pressed("A"):velocity.x -= 1
	if Input.is_action_pressed("S"):velocity.y += 1
	if Input.is_action_pressed("D"):velocity.x += 1
	position += velocity.normalized() * speed + random_vector.normalized() 
func sinLoop():
	sinMod = sinMod + 10
	await get_tree().create_timer(spawntime).timeout
	sinLoop()
	pass
func _ready():
	spawnloop()
	sinLoop()
func spawnloop():
	if (ded == false):
		spawn()
	await get_tree().create_timer(spawntime).timeout
	spawnloop()
func spawn():
	var bullet = load("res://bullet.tscn")
	var bullet_instance = bullet.instantiate()
	get_parent().add_child.call_deferred(bullet_instance)
	bullet_instance.position = self.position + Vector2(10,0).rotated(sinMod)
	bullet_instance.linear_velocity = Vector2(5,0).rotated(randf_range(0,2*PI))

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if last_enemy != body:
		lives -= 0.5
		var last_enemy = body
		await get_tree().create_timer(1).timeout
		last_enemy = null

func get_lives():
	return lives


func _on_body_entered(body):
	if last_enemy != body:
		lives -= 0.5
		var last_enemy = body
		await get_tree().create_timer(1).timeout
		last_enemy = null
	
