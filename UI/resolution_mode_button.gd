extends Control

@onready var option_button = $HBoxContainer/OptionButton as Button

var RESOLUTION_DICT: Dictionary = {
	"1280x720": Vector2i(1280, 720),
	"1152x648": Vector2i(1152, 648),
	"1366×768": Vector2i(1366, 768),
	"1280×1024": Vector2i(1280, 1024),
	"1440×900" : Vector2i(1440, 900),
	"1600×900" : Vector2i(1600, 900),
	"1680x1050" : Vector2i(1680, 1050),
	"1280x800" : Vector2i(1280, 800),
	"1024x768" : Vector2i(1024, 768),
}

func _ready():
	add_resolution_item()
	option_button.item_selected.connect(on_res_selected)
	centre_window()

func add_resolution_item():
	for res_text in RESOLUTION_DICT:
		option_button.add_item(res_text)

func on_res_selected(index: int):
	DisplayServer.window_set_size(RESOLUTION_DICT.values()[index])

func centre_window():
	var centre_screen = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(centre_screen - window_size / 2)
