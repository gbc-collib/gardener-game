extends "res://Interactable.gd"
@export var default_tree_scene: PackedScene  # Default bonsai tree
var tree_scene: PackedScene = null
var has_tree = false


func _ready():
	connect("input_event", _on_click)
	if not tree_scene:
		tree_scene = default_tree_scene  # Use default if none is assigned

func _on_click(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if not has_tree:
			place_tree()
		else:
			interact()

func place_tree():
	if tree_scene:
		var tree = tree_scene.instantiate()
		tree.position = position
		get_parent().add_child(tree)
		has_tree = true

func interact():
	print("Interacting with tree! (Prune, Water, etc.)")
