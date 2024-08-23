extends Area3D


func _on_body_entered(body):
	if body.name == 'player':
		GlobalVars.player_world_loc = body.position
		GlobalVars.goto_scene("res://room_2.tscn")
