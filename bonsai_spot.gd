extends "res://Interactable.gd"
var tree_scene: PackedScene = null
var has_tree = false
@export var bonsai_menu_scene: PackedScene
var bonsai_menu = null


func _ready():
	# Create bonsai menu instance
	bonsai_menu = bonsai_menu_scene.instantiate()
	bonsai_menu.action_selected.connect(_on_action_selected)
	get_tree().root.add_child(bonsai_menu)  # Add menu to scene
	pass

func place_tree():
	if tree_scene:
		var tree = tree_scene.instantiate()
		tree.position = position
		get_parent().add_child(tree)
		has_tree = true

func _on_action_selected(action: String):
	match action:
		"plant":
			place_tree()
		"water":
			print("Watering the tree!")
		"prune":
			print("Pruning the tree!")
	bonsai_menu.hide_menu()


func interact():
	bonsai_menu.show_menu(has_tree, false, global_position + Vector2(0, -30))
