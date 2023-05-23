extends Node

@onready var timer = $Timer


func get_current_time() -> float:
	return timer.wait_time - timer.time_left


func get_current_timer_formatted() -> String:
	var seconds = get_current_time()
	var minutes = floor(seconds / 60)
	var remaining_seconds = seconds - (minutes * 60)
	return str(minutes) + ":" + ("%02d" % floor(remaining_seconds))
