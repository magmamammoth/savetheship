extends CharacterBody2D

var slide = create_tween()

func _ready() -> void:
	slide.tween_property($".", "position", Vector2(578, 458), 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
