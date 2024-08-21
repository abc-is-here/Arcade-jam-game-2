extends Node3D

var distance

func _process(delta: float) -> void:
	if $RayCast3D.get_collider():
		distance = transform.origin.distance_to($RayCast3D.get_collision_point())
		$scaler.scale.z = distance/2
	else:
		$scaler.scale.z = $RayCast3D.target_position.z
