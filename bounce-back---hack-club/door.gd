extends Area2D

@export var scene: PackedScene
#
#var next_scene = preload("res://rooms/combat_tutorial.tscn")

func _next_room():
	print(scene)
	get_tree().change_scene_to_packed(scene)

func _ready() -> void:
	print(scene)
	pass
	#_next_room()


func _on_area_entered(area: Area2D) -> void:
	_next_room()
