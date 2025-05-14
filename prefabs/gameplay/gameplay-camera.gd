extends Camera3D

@export_group('Rotation')
@export_range(0, 360, 0.1, "radians_as_degrees") var rot_deg_x: float
@export_range(0, 360, 0.1, "radians_as_degrees") var rot_deg_y: float
@export_range(0, 360, 0.1, "radians_as_degrees") var rot_deg_z: float

@export_group('Movement')
@export var sensintivity: float
@export var moving_speed: float

func rotate_camera() -> void:
	var velocity: Vector2 = InputHandlerNode.mouse_velocity * sensintivity
	
	rotation.y -= velocity.x
	rotation.x -= velocity.y

func clamp_axis(axis: float, limit: float) -> float:
	if(!limit):
		return axis
	return clamp(axis, -limit, limit)
	
func clamp_camera_rotation() -> void:
	var limit_rotation: Vector3 = Vector3(rot_deg_x, rot_deg_y, rot_deg_z)
	
	rotation.x = clamp_axis(rotation.x, limit_rotation.x)
	rotation.y = clamp_axis(rotation.y, limit_rotation.y)
	rotation.z = clamp_axis(rotation.z, limit_rotation.z)

func _physics_process(delta: float) -> void:
	rotate_camera()
	clamp_camera_rotation()
