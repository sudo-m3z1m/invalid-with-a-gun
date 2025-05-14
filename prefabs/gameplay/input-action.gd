extends RefCounted

class_name InputAction

var input_event: InputEvent
var action_name: String

func _init(event: InputEvent) -> void:
	action_name = get_action_name(event)
	input_event = event

func release_action() -> void:
	pass

func get_action_name(event: InputEvent) -> String:
	var actions: Array[StringName] = InputMap.get_actions()

	#TODO: Need to do with this algorithm smth
	#It so slow

	for action_name in actions:
		if(!event.is_action(action_name)):
			continue
		return action_name
	
	return ''
