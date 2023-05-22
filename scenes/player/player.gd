extends CharacterBody2D

const SPEED = 300.0


func _process(_delta: float) -> void:
	var input_vector: Vector2 = get_movement_direction()
	velocity = input_vector.normalized() * SPEED
	move_and_slide()


func get_movement_direction() -> Vector2:
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x, y)
