extends CanvasLayer


@export var time_manager: Node
@onready var label = $MarginContainer/Label

func _process(_delta: float) -> void:
	if (!time_manager):
		return
		
	var time_string = time_manager.get_current_timer_formatted()
	label.set_text(time_string)
