extends Area3D

@onready var label = $Label

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.name == 'player':
		label.visible = true

func _on_body_exited(body):
	if body.name == 'player':
		label.visible = false
