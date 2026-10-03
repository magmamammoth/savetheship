extends Label


var score = 0
var finalscore = 0
var strscore:String

func _ready() -> void:
	score = 0
	EventBus.boom.connect(on_boom_happen)
	EventBus.end.connect(on_end_happen)

func on_boom_happen():
	score += 1
	strscore = str(score)
	text = strscore


func on_end_happen():
	finalscore = score
	score = 0
