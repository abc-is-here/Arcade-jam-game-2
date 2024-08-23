extends Node

var health
var current_scene : Node = null
var player_world_loc : Vector3
var player : Node

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	print(root)

func goto_scene(path: String):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path: String):
	if current_scene != null:
		current_scene.queue_free()  # Use queue_free instead of free
	
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate() as Node
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	player = current_scene.get_node("player")

#func _process(delta: float) -> void:
#	player = current_scene.get_node("player")
