extends Node2D

@export var bonsai_type: String = "default"
@export var sprite_sheet: Texture2D  # Assign the full sprite sheet in Inspector
@export var water_requirement: int = 3
@export var growth_speed: float = 5.0

@onready var sprite = $Sprite2D  # Ensure Bonsai has a Sprite2D

var is_watered = false
var growth_stage = 0
const SPRITE_SIZE = Vector2(16, 16)

func _ready():
	update_texture()

func interact():
		set_watered_state(true)

func set_watered_state(watered: bool):
	is_watered = watered
	update_texture()

func update_growth():
	if is_watered and growth_stage < 3:  # 0 to 3 stages
		growth_stage += 1
		update_texture()

func update_texture():
	var row = 1 if is_watered else 0  # Row 1 = Wet, Row 0 = Dry
	var col = growth_stage  # Column based on growth stage

	var region = Rect2(col * SPRITE_SIZE.x, row * SPRITE_SIZE.y, SPRITE_SIZE.x, SPRITE_SIZE.y)
	sprite.region_rect = region  # Update the sprite to show the correct stage
	sprite.texture = sprite_sheet
	sprite.region_enabled = true  # Ensure region mode is on
