extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += delta * 200


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("PlayerGroup"):
		body.got_hit()
		queue_free()
