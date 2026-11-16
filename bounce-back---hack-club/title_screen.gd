extends Control


# Called when the node enters the scene tree for the first time.


func _on_play_button_pressed() -> void:
	print("start")
	get_tree().change_scene_to_file("res://rooms/main.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
