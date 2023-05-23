extends Node

@export var enemy: PackedScene


func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)


func on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group('player')
	if (!player):
		return
	
	var spawn_range = ProjectSettings.get_setting('display/window/size/viewport_width') / 2 + 10
	randomize()
	var spawn_position = player.global_position - (Vector2.RIGHT.rotated(randf_range(0, TAU)) * spawn_range)
	var enemy_instance = enemy.instantiate() as Node2D
	get_parent().add_child(enemy_instance)
	enemy_instance.set_global_position(spawn_position)
