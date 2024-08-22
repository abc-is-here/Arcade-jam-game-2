extends Node3D

var player

func _ready():
	player = get_node("/root/" + get_tree().current_scene.name + "/player")

func _process(delta: float) -> void:
	get_tree().call_group("monster", "update_target_location", player.global_transform.origin)
