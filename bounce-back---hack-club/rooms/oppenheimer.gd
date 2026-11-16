extends Node2D


func _ready() -> void:
	if Playerstats.ram >= 40:
		pass
	else:
		get_node("SmeggyVictory").visible = false
		get_node("Label").text = "You don't have all 40 ram sticks, you cant blow up the datacenter now :(("


func _process(delta: float) -> void:
	pass
