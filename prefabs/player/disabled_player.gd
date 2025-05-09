extends RigidBody3D

@export var push_strength: float

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void: 
	var direction: Vector2 = Input.get_vector(
		"ui_up", 
		"ui_down", 
		"ui_right",
		"ui_left"
	)

	apply_central_impulse((Vector3(0, 0, direction.x).rotated(Vector3.UP, rotation.y) * push_strength))
	apply_torque_impulse(Vector3(0, direction.y, 0))
