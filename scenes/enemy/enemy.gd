extends CharacterBody2D


const SPEED = 75


func _process(_delta: float) -> void:
	var direction = get_player_direction()
	velocity = direction * SPEED
	move_and_slide()


func get_player_direction() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player")
	if (player_node):
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
