extends Area3D


func _on_body_entered(body):
	if body.name == 'player':
		#get_tree().change_scene_to_file("res://room_2.tscn")
		var player = body
		GlobalVars.player_world_loc = body.position
		GlobalVars.goto_scene("res://room_2.tscn")

#func _on_body_exited(body):
	#if body.name == 'player':
		##get_tree().change_scene_to_file("res://world.tscn")
		#var player = body
		#body.position = GlobalVars.player_world_loc
		#GlobalVars.goto_scene("res://world.tscn")
