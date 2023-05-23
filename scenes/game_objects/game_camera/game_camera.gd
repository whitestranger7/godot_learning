extends Camera2D


func _ready() -> void:
	make_current()
	global_position = acquire_target()


func _process(delta: float) -> void:
	var target_position = acquire_target()
	global_position = global_position.lerp(target_position, 1.0 - exp(-delta * 10))


func acquire_target() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player")
	if (player_node):
		return player_node.global_position
	return Vector2.ZERO
