extends Node


@onready var HP : Label = $UI/HP
@onready var SCORE : Label = $UI/Score


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node_or_null("Player"):
		HP.text = str($Player.Health)
		SCORE.text = str($Player.Score)
