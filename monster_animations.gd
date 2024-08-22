extends CharacterBody3D

var speed: float = 3.0
var player
@export var turn_speed = 4.0

func _ready() -> void:
	player = get_tree().get_nodes_in_group('player')[0]

func _physics_process(delta: float) -> void:
	$faceDirection.look_at(player.global_transform.origin, Vector3.UP)
	rotate_y(deg_to_rad($faceDirection.rotation.y * turn_speed))
	$NavigationAgent3D.set_target_position(player.global_transform.origin)
	var velocity = ($NavigationAgent3D.get_next_path_position() - transform.origin).normalized() * speed * delta
	move_and_collide(velocity)
