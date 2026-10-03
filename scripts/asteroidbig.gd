extends Area2D

@export var speed: float = 200.0
var direction:Vector2 = Vector2.ZERO
@onready var followpath: PathFollow2D = $spawnpath/PathFollow2D
@onready var fire: AudioStreamPlayer = $mouse/fire
@onready var timerms: Timer = $Timer
@onready var animate: AnimatedSprite2D = $AnimatedSprite2D
const ASTEROIDBIG = preload("uid://dg5mvore6qxc7")



var dying:bool
var score = 0
signal boom

signal mouse_hover(boolian:bool)
var hover: bool = false


func _ready() -> void:
	EventBus.end.connect(on_end_recieve)







func _physics_process(delta: float) -> void:
	if not dying:
		position += direction * speed * delta 

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("fire"):
		#print("ig maybe")
		dying = true
		destroy()

func destroy():
	EventBus.boom.emit()
	animate.play("blasted")
	if dying:
		animate.play("blasted")
		await animate.animation_finished
	queue_free()


func on_end_recieve():
	destroy()
