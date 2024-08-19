extends Area3D

@onready var anim_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body):
	if body.name == 'player':
		anim_player.play('door_open')

func _on_body_exited(body):
	if body.name == 'player':
		anim_player.play('door_close')
