extends Control

@onready var pause_menu = $"."
@onready var options = $Options

func _ready():
	$AnimationPlayer.play("RESET")
	print("Pause menu ready.")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume()
		else:
			pause()

func pause():
	print("Pause menu activated.")
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	pause_menu.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func resume():
	print("Pause menu deactivated.")
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	pause_menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_resume_pressed():
	print("Resume button pressed.")
	resume()

func _on_quit_pressed():
	print("Quit button pressed.")
	get_tree().quit()

func _on_options_pressed():
	options.visible = true

func _on_restart_pressed():
	print("Restart button pressed.")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")

func _on_options_hide_options():
	options.visible = false
