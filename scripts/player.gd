extends CharacterBody2D

var slide = create_tween()
@onready var out: AudioStreamPlayer = $out

func _ready() -> void:
	slide.tween_property($".", "position", Vector2(578, 458), 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("destryoed")
	out.play()
	await out.finished
	get_tree().paused = true
