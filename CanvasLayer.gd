extends Control

signal hide_pause

@onready var pause_menu = $PauseMenu
@onready var options = $Options

func _ready():
	$AnimationPlayer.play("RESET")

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):  # "ui_cancel" is mapped to "Esc" by default in Godot
		if get_tree().paused:
			resume()
		else:
			pause()

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	pause_menu.visible = true  # Show the pause menu when paused
	emit_signal("hide_pause")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	pause_menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_resume_pressed():
	resume()

func _on_quit_pressed():
	get_tree().quit()

func _on_options_pressed():
	options.visible = true

func _on_restart_pressed():
	get_tree().change_scene("res://world.tscn")

func _on_options_hide_options():
	options.visible = false
