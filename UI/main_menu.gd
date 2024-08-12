class_name Mainmenu
extends Control

@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var start_level = preload("res://world.tscn") as PackedScene
@onready var options = $Options
@onready var margin_container = $MarginContainer

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(start_level)

func _on_exit_button_pressed():
	get_tree().quit()

func _on_option_button_pressed():
	options.visible = true
	margin_container.visible = false
