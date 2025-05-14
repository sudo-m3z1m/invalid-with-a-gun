extends RefCounted

class_name InputAction

var input_event: InputEvent
var action_name: String

func _init(event: InputEvent) -> void:
	input_event = event
	action_name = event.as_text()
	#InputMap.get_actions()

func release_action() -> void:
	pass
