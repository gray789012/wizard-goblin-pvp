extends RigidBody2D
@export var speed = 15;

func _physics_process(delta):
	var player = get_parent().get_node("player")
	position += (player.position - self.position).normalized() * speed



func _on_area_2d_body_entered(body):	
	get_parent().get_node("player").get_child(1).get_child(0).add_points(13)
	queue_free()
	pass
