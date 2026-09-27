extends Sprite2D

@onready var animate: AnimatedSprite2D = $AnimatedSprite2D



func _ready() -> void:
	animate.play("default")
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _physics_process(delta: float) -> void:
	global_position = get_viewport().get_mouse_position()
	
	if Input.is_action_just_pressed("fire"):
		animate.play("target")
	elif Input.is_action_just_released("fire"):
		animate.play("default")
