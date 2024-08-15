extends Control

signal hide_options

func _on_exit_button_pressed():
	emit_signal("hide_options")
