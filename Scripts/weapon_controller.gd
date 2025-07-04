extends Node2D

@export var projectile: PackedScene
@export var offset: Vector2 = Vector2.ZERO
@export_flags_2d_physics var collision_mask: int

var ray : RayCast2D = RayCast2D.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(get_global_mouse_position())
	rotation_degrees += 90
	if Input.is_action_just_pressed("click"):
		# Get cursor position and pass it to raycast and gfx methods
		var click_point = get_global_mouse_position()
		#process_ray_cast(click_point)
		ray_cast_gfx(click_point)

func _physics_process(delta: float) -> void:
	if ray.is_colliding():
		var col = ray.get_collider()
		print(col)

# -- TASK 3 Raycast functionality HERE -- #
func process_ray_cast(target_position: Vector2):
	#var ray = RayCast2D
	print(ray.is_colliding())
	ray.target_position = target_position
	ray.collision_mask = collision_mask
	print("Ray: ", ray.target_position)
	var col = ray.get_collider_rid()
	print(col)
	if col:
		print(col)
# --------------------------------------- #

func ray_cast_gfx(click_point: Vector2):
	var clone: Line2D = projectile.instantiate()
	clone.position = global_position + offset.rotated(rotation)
	clone.rotation = global_rotation
	clone.points = [Vector2.ZERO, Vector2.UP * click_point.distance_to(global_position + offset.rotated(rotation))]
	get_tree().root.add_child(clone)
