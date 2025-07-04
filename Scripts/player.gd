extends CharacterBody2D

class_name Player

const SPEED = 300.0
var Score : int = 0

var Health : int = 3

var start_pos = Vector2(400, 400)

func _ready():
	global_position = start_pos
	Score = 0
	Health = 3



func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func got_hit():
	Health -= 1
	if Health <= 0:
		Score = 0
		Health = 3
		global_position = start_pos
