extends CharacterBody3D

var speed: float = 3.0
var player
@export var turn_speed = 4.0


func _ready() -> void:
	player = get_tree().get_nodes_in_group('player')[0]
	set_physics_process(false)
	call_deferred("dump_first_physics_frame")

func dump_first_physics_frame() -> void:
	await get_tree().physics_frame
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	$faceDirection.look_at(player.global_transform.origin, Vector3.UP)
	rotate_y(deg_to_rad($faceDirection.rotation.y * turn_speed))
	$NavigationAgent3D.set_target_position(player.global_transform.origin)
	velocity = ($NavigationAgent3D.get_next_path_position() - transform.origin).normalized() * speed * delta
	move_and_collide(velocity)
