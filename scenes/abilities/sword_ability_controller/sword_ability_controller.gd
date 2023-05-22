extends Node

@export var ability_range: float = 200

@export var sword_ability: PackedScene


func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)


func on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if (!player):
		return
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	if (enemies.size() <= 0):
		return
	
	enemies.sort_custom(
		func (a: Node2D, b: Node2D):
			var a_distance = a.global_position.distance_squared_to(player.global_position)
			var b_distance = b.global_position.distance_squared_to(player.global_position)
			return a_distance < b_distance
	)
	
	var sword_instance = sword_ability.instantiate() as Node2D
	var enemy_target = enemies[0] as Node2D
	
	if (enemy_target.global_position.distance_to(player.global_position) <= ability_range):
		player.get_parent().add_child(sword_instance)
		sword_instance.global_position = enemy_target.global_position
