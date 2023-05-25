extends Node
class_name HealthComponent

signal on_died

@export var max_health: float = 100
var current_health


func _ready() -> void:
	current_health = max_health


func take_damage(damage: float) -> void:
	current_health = max(current_health - damage, 0)
	check_if_died()


func check_if_died() -> void:
	if (current_health <= 0):
		on_died.emit()
		owner.queue_free()
