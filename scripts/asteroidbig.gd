extends Area2D

@export var speed: float = 200.0
var direction:Vector2 = Vector2.ZERO
@onready var followpath: PathFollow2D = $spawnpath/PathFollow2D

signal mouse_hover(boolian:bool)
var hover: bool


func _ready() -> void:
	self.mouse_hover.connect(on_hover)


func _physics_process(delta: float) -> void:
	position += direction * speed * delta 

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("fire"):
		print("ig maybe")



func _on_mouse_entered():
	hover = true
	mouse_hover.emit(hover)
	#print("hover true")

func _on_mouse_exited() -> void:
	hover = false
	mouse_hover.emit(hover)
	#print("hover false")


func on_hover(new_hover) -> void:
	if new_hover == true:
		pass #print("yay hovering")
