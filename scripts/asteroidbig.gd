extends Area2D

@export var speed: float = 200.0
var direction:Vector2 = Vector2.ZERO

signal mouse_hover(boolian:bool)
var hover: bool


func _physics_process(delta: float) -> void:
	position += direction * speed * delta 


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	hover = true
	mouse_hover.emit(hover)

func _on_mouse_exited() -> void:
	hover = false
	mouse_hover.emit(hover)
