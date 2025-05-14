extends RigidBody3D

@export var push_strength: float
@export var rotate_speed: float
@export var mouse_sensitivity: float

@onready var camera: Camera3D = $Camera

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	var action = InputHandlerNode.get_pressed_action()
	print(action.action_name if action else null)
	InputHandlerNode.release_pressed_action()
