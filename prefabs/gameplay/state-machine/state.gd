extends Node

class_name State

enum StateTypes {
	IDLE,
	MOVING
}

@export var state_type: StateTypes
@export var animation: Animation

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	pass

func exit_state() -> void:
	pass
