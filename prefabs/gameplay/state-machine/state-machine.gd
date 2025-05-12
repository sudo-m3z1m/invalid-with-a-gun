extends Node

class_name StateMachine

@onready var first_state: State = $Idle

var current_state: State

func _ready() -> void:
	current_state = first_state

func _physics_process(delta: float) -> void:
	current_state.update_state(delta)

func change_state(new_state: State) -> void:
	if current_state.state_type == new_state.state_type:
		return

	current_state.exit_state()
	current_state = new_state
	current_state.enter_state()
