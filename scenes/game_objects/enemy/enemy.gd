extends CharacterBody2D

var health_component: HealthComponent
var drop_component: DropComponent


const SPEED = 40


func _ready() -> void:
	health_component = $HealthComponent
	drop_component = $DropComponent
	$Area2D.area_entered.connect(on_area_entered)
	health_component.on_died.connect(on_died)


func _process(_delta: float) -> void:
	var direction = get_player_direction()
	velocity = direction * SPEED
	move_and_slide()


func get_player_direction() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player")
	if (player_node):
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO


func on_area_entered(_area: Area2D) -> void:
	health_component.take_damage(100)


func on_died() -> void:
	drop_component.drop_item()
