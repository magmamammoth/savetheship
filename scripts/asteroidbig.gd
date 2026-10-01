extends Area2D

@export var speed: float = 200.0
var direction:Vector2 = Vector2.ZERO
@onready var followpath: PathFollow2D = $spawnpath/PathFollow2D
@onready var fire: AudioStreamPlayer = $mouse/fire
@onready var timerms: Timer = $Timer
@onready var animate: AnimatedSprite2D = $AnimatedSprite2D
var dying:bool


signal mouse_hover(boolian:bool)
var hover: bool = false


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	if not dying:
		position += direction * speed * delta 

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("fire"):
		#print("ig maybe")
		dying = true
		destroy()

func destroy():
	animate.play("blasted")
	scale = Vector2(4,4)
	if dying:
		animate.play("blasted")
		await animate.animation_finished
	queue_free()
