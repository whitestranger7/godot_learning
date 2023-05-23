extends Node

var experience = 0


func _ready() -> void:
	GameEvents.experience_vial_collected.connect(on_experience_vial_collected)


func experience_increment(number: float) -> void:
	experience += number


func on_experience_vial_collected(number: float) -> void:
	experience_increment(number)

