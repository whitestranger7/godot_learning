extends Node


signal experience_vial_collected(experience_number: float)

func emit_experience_vial_collected(experience_number: float) -> void:
	experience_vial_collected.emit(experience_number)
