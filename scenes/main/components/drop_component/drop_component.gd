extends Node

class_name DropComponent

@export var drops: Array[PackedScene]
@export var drops_chance: Array[float]


func drop_item() -> void:
	for index in drops.size():
		randomize()
		if (randf() > drops_chance[index]):
			Callable(spawn_drop).call_deferred(drops[index])
			break

func spawn_drop(item: PackedScene) -> void:
	var instance = item.instantiate()
	get_tree().get_current_scene().add_child(instance)
	instance.set_global_position(owner.global_position)
