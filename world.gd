extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade_animations/AnimationPlayer.play("fade_out")
