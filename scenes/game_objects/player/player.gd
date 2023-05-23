extends CharacterBody2D

const SPEED = 125.0
const ACCELERATION = 25


func _process(delta: float) -> void:
	var input_vector: Vector2 = get_movement_direction()
	var velocity_target = input_vector.normalized() * SPEED
	velocity = velocity.lerp(velocity_target, 1 - exp(-delta * ACCELERATION))
	move_and_slide()


func get_movement_direction() -> Vector2:
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x, y)
