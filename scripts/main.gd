extends Node2D

@onready var follow_path: PathFollow2D = $spawnpath/PathFollow2D
@onready var player: CharacterBody2D = $player
@export var asteroidbig: PackedScene



func _on_timer_timeout() -> void:
	#print("timeout went off")
	
	if not asteroidbig:
		#print("asteroid missing")
		return
	
	#random value and x,y of asteroid & target_pos var
	follow_path.progress_ratio = randf()
	var spawn_pos: Vector2
	spawn_pos = follow_path.global_position
	var target_pos: Vector2
	
	#chance system
	if randf() <= 0.6 and is_instance_valid(player):
		var distraction = Vector2(randf_range(-50,50), randf_range(-50,50))
		target_pos = player.global_position + distraction
	else:
		var screen_size = get_viewport_rect().size
		target_pos = Vector2(
			randf_range(100, screen_size.x - 100),
			randf_range(100, screen_size.y - 100)
		)

	#asteroid
	var asteroid = asteroidbig.instantiate()
	asteroid.global_position = spawn_pos
	
	asteroid.direction = (target_pos-spawn_pos).normalized()
	asteroid.rotation = asteroid.direction.angle()
	
	add_child(asteroid)
