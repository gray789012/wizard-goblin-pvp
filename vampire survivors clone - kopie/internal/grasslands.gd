extends Node2D
var player = load("res://player.tscn")
@export var player_lives : int
func _ready():
	var player_instance = player.instantiate()
	add_child(player_instance)
	get_node("player").lives = player_lives
