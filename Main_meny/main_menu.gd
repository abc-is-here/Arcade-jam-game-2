class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var start_level = preload("res://world.tscn") as PackedScene

func _on_start_button_button_down():
	get_tree().change_scene_to_packed(start_level)


func _on_exit_button_button_down():
	get_tree().quit()
