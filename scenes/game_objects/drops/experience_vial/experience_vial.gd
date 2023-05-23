extends Node2D


func _ready() -> void:
	$DetectionArea.area_entered.connect(on_area_entered)


func on_area_entered(area: Node2D) -> void:
	GameEvents.emit_experience_vial_collected(1)
	queue_free()
