extends Area3D

func _ready():
	$Label.visible = false

func _on_body_entered(body):
	if body.name == 'player':
		$Label.visible = true

func _on_body_exited(body):
	if body.name == 'player':
		$Label.visible = false
