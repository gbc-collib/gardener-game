extends Node2D

@export var backyard_scene: PackedScene  # Reference to backyard.tscn
@export var player_scene: PackedScene  # Reference to player (gardener) scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Instance the backyard scene
	var backyard = backyard_scene.instantiate()
	
	# Set the parent of the backyard instance to the World node
	var world_node = get_node("world")  # Get the World node (make sure it's named "world" in the Scene Tree)
	world_node.add_child(backyard)
	var spawn_point = backyard.get_node("SpawnPoint")
	#Add player model
	var player = player_scene.instantiate()
	world_node.add_child(player)
	print(spawn_point.position)
	player.position = spawn_point.position
	print(player.position)
	
	# Optionally, adjust the position or properties of the backyard
	#backyard.position = Vector2(0, 0)  # Set the starting position of the backyard (adjust if necessary)
