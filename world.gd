extends Node3D

@onready var player: CharacterBody3D = $player



func _ready():
	$Fade_animations/AnimationPlayer.play("fade_out")
