extends Area3D


func _on_body_entered(body):
	if body.name == 'player':
		get_tree().change_scene_to_file("res://room_2.tscn")

func _on_body_exited(body):
	if body.name == 'player':
		get_tree().change_scene_to_file("res://world.tscn")
