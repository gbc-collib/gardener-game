extends CharacterBody2D

@export var speed: float = 125  # Movement speed
@onready var raycast = $RayCast2D
@export var interaction_range:float = 100
@onready var player_variables = $PlayerVariables  # Reference to PlayerVariables script
var last_direction = Vector2.ZERO

func _ready():
	raycast.enabled = true

func _process(delta):
	var direction = Vector2.ZERO
	
	# Input handling for movement (WASD / Arrow keys)
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	
	# Normalize direction to prevent diagonal speed boost
	direction = direction.normalized()
	if direction != Vector2.ZERO:
		last_direction = direction  # Update the last direction if there is movement
	if last_direction != Vector2.ZERO:
		raycast.rotation = last_direction.angle() - deg_to_rad(90)
	# Set velocity based on direction
	velocity = direction * speed
	# Move the gardener with the updated velocity
	move_and_slide()
	if Input.is_action_just_pressed("ui_accept") and raycast.is_colliding():
		print("TRYN INTERACT")
		var hit_object = raycast.get_collider()
		if hit_object.has_method("interact"):
			print("Interacting")
			hit_object.interact()
