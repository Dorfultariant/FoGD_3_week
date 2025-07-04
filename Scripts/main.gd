extends Node


@onready var HP : Label = $UI/HP
@onready var SCORE : Label = $UI/Score

var hp
var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# If this works, its the fault of the testing
	score = $Player.Score
	hp = $Player.Health		
	
	HP.text = str(hp)
	SCORE.text = str(score)
			
