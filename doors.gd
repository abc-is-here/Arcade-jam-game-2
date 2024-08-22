extends Area3D

# Assuming the player is an autoload singleton
func _on_area3d_body_entered(body):
	if body.name == "player":  # Ensure it's the player entering the Area3D
		body.saved_position = body.global_transform.origin
		change_scene()

func change_scene():
	#var room1_scene = preload("res://room1.tscn")
	#et_tree().change_scene_to(room1_scene)
	GlobalVars.goto_scene("res://room1.tscn")
