extends Node

class_name InputHandler

var pressed_actions: Array[InputAction] = []
var mouse_velocity: Vector2

func _unhandled_input(event: InputEvent) -> void:
	if(event is InputEventMouseMotion):
		mouse_velocity = event.relative
		return

	var new_action = InputAction.new(event)
	pressed_actions.push_front(new_action)

func get_pressed_action() -> InputAction:
	if(pressed_actions.is_empty()):
		return null

	var pressed_action = pressed_actions[0]
	return pressed_action

func release_pressed_action() -> void:
	if(pressed_actions.is_empty()):
		return
	pressed_actions[0].release_action()
	pressed_actions.pop_front()

func _process(delta: float) -> void:
	mouse_velocity = Vector2.ZERO

#TODO: Class makes buffer with events
#Event releases after this using
#Class gives interface for getting pressed keys
#This singleton gives every class info about pressed keys
