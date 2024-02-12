extends RigidBody2D
@export var speed = -25;
var sinMod : int
func _ready():
	sinLoop()
	var player = get_tree().get_root().get_child(0).get_node("player")
	if (player != null):
		var player_position = player.position
		linear_velocity += (player_position - self.position).normalized() * speed
	await get_tree().create_timer(2.0).timeout
	queue_free()
	pass
func sinLoop():
	sinMod = get_parent().get_node("time").get_time()
	await get_tree().create_timer(0.05).timeout
	sinLoop()
	pass
	
func _physics_process(delta):
	var mod = Vector2(sin(sinMod),cos(sinMod))*10
	move_and_collide(linear_velocity+mod)

func enemyHit(area: Area2D): area.get_parent().queue_free()

