extends CharacterBody2D


const SPEED = 40


func _ready() -> void:
	$Area2D.area_entered.connect(on_area_entered)


func _process(_delta: float) -> void:
	var direction = get_player_direction()
	velocity = direction * SPEED
	move_and_slide()


func get_player_direction() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player")
	if (player_node):
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO


func on_area_entered(area: Area2D) -> void:
	queue_free()
