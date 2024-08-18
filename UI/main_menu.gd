class_name Mainmenu
extends Control

var button_type = null
@onready var fade_animations = $Fade_animations
@onready var fade_timer = $Fade_animations/FADE_TIMER
@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton
@onready var start_level = preload("res://world.tscn")
@onready var options = $Options

func _on_play_button_pressed():
	button_type = "start"
	fade_animations.visible = true
	fade_timer.start()
	$Fade_animations/AnimationPlayer.play("fade_in")

func _on_exit_button_pressed():
	get_tree().quit()

func _on_option_button_pressed():
	options.visible = true

func _on_options_hide_options():
	options.visible = false

func _on_fade_timer_timeout():
	if button_type == "start":
		get_tree().change_scene_to_packed(start_level)
