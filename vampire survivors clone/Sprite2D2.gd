extends Sprite2D

func _on_player_levelup():
	visible = true
	await get_tree().create_timer(0.25).timeout
	visible = false
