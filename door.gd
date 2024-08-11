extends Area3D



func _on_body_entered(body):
	if body.name == 'player':
		get_node("AnimationPlayer").play('door_open')

func _on_body_exited(body):
	if body.name == 'player':
		get_node("AnimationPlayer").play('door_close')
