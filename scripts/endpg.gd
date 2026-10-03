extends Control


func _on_button_pressed() -> void:
	print("end")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
