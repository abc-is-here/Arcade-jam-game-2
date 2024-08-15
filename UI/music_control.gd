extends Control

@onready var label_2 = $HBoxContainer/Label2
var master_bus = AudioServer.get_bus_index("Master")

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	label_2.text = str(value * 10) + "%"
	AudioServer.set_bus_mute(master_bus, value == 0)
