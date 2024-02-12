extends Button
@export var level_togo : String
func _on_button_up():
	if level_togo != "":
		var level = load(level_togo).instantiate()
		get_parent().get_parent().add_child(level)
		get_parent().queue_free()
	else: pass
