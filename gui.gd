extends Control

@onready var garden_tool_bar = $GardenToolBar  # Reference to GardenToolBar

func _process(delta):
	if Input.is_action_just_pressed("scroll_up"):  # Select garden tool (1)
		garden_tool_bar.select_tool(garden_tool_bar.get_tool()+1)
	elif Input.is_action_just_pressed("scroll_down"):  # Select seeds (2)
		garden_tool_bar.select_tool(garden_tool_bar.get_tool()-1)
	elif Input.is_action_just_pressed("ui_select_3"):  # Select watering can (3)
		garden_tool_bar.select_tool(2)
