extends RigidBody3D

@export var push_strength: float
@export var rotate_speed: float
@export var mouse_sensitivity: float

@onready var camera: Camera3D = $Camera

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	var mouse_velocity: Vector2 = Input.get_last_mouse_velocity()
	mouse_velocity *= mouse_sensitivity / 5
	
	camera.rotation.y += mouse_velocity.x
	camera.rotation.x += mouse_velocity.y
	
	camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
