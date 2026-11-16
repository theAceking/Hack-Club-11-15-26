extends Area2D

@export var scene: PackedScene
@export var thingy: String

var next_scene

func _ready() -> void:
	#if thingy == "tutorial":
		#next_scene = preload("res://rooms/combat_tutorial.tscn")
	#if thingy == "arena":
		#next_scene = preload("res://rooms/arena.tscn")
	#if thingy == "main":
		#next_scene = preload("res://rooms/node_2d.tscn")
	#if thingy == "shredder":
		#next_scene = preload("res://rooms/shredder.tscn")
	pass

func _next_room():
	print(scene)
	print(thingy)
	get_tree().change_scene_to_packed(scene)

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Sonc"):
		print("switching")
		_next_room()
