extends Area2D

@export var scene: PackedScene
@export var thingy: String
#
#var next_scene = preload("res://rooms/combat_tutorial.tscn")

func _next_room():
	print(scene)
	print(thingy)
	get_tree().change_scene_to_packed(scene)

func _ready() -> void:
	print(scene)
	#_next_room()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Sonc"):
		_next_room()
