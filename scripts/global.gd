extends Node
var health
var current_scene = null
var player_world_loc : Vector3
var player
func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print(root)
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)
func _deferred_goto_scene(path):
	current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	player = get_node("/root/" + get_tree().current_scene.name + "/player")

#func _process(delta: float) -> void:
	#player = get_node("/root/" + get_tree().current_scene.name + "/player")
