extends CanvasLayer

signal action_selected(action: String)

@onready var plant_button = $VBoxContainer/PlantButton
@onready var water_button = $VBoxContainer/WaterButton
@onready var prune_button = $VBoxContainer/PruneButton
func _ready():
	plant_button.pressed.connect(func(): action_selected.emit("plant"))
	water_button.pressed.connect(func(): action_selected.emit("water"))
	prune_button.pressed.connect(func(): action_selected.emit("prune"))
	visible = false  # Start hidden

func show_menu(has_tree: bool, is_watered: bool, position: Vector2):
	var global_position = position
	visible = true
	
	# Enable/disable buttons based on state
	print(plant_button)
	#plant_button.disabled = has_tree
	#water_button.disabled = not has_tree or is_watered
	#prune_button.disabled = not has_tree

func hide_menu():
	visible = false
