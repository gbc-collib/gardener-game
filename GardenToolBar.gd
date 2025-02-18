extends Node

@onready var player_variables = $PlayerVariables  # Reference to PlayerVariables

func select_tool(tool_index: int):
	match tool_index:
		0:
			player_variables.selected_tool = PlayerVariables.ToolType.GARDEN_TOOL
		1:
			player_variables.selected_tool = PlayerVariables.ToolType.SEEDS
		2:
			player_variables.selected_tool = PlayerVariables.ToolType.WATERING_CAN
	# Additional logic like updating UI can go here

func get_tool() -> int:
	return player_variables.selected_tool
