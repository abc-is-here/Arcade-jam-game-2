extends Control

signal hide_pause

@onready var pause_menu = $"."
@onready var options = $Options

func _ready():
	$AnimationPlayer.play("RESET")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume()
		else:
			pause()
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	pause_menu.visible = true
	emit_signal("hide_pause")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print("blur!!!")
	
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
	get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_options_hide_options():
	options.visible = false
