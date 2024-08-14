extends Control

@onready var input_button = preload("res://UI/input_button.tscn")
@onready var list_actions = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/listActions

var is_remapping = false
var action_to_remap = null
var remapping_button = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_create_action_list()
	
func _create_action_list():
	InputMap.load_from_project_settings()
	for item in list_actions.get_children():
		item.queue_free()
		
	for action in InputMap.get_actions():
		var button = input_button.instantiate()
		var action_label = button.find_child("LabelAction")
		var input_label = button.find_child("LabelInput")
		
		action_label.text = action
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			input_label.text = events[0].as_text()
		else:
			input_label.text = ""
		
		list_actions.add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
