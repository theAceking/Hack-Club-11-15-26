extends CharacterBody2D

var player
var rb
var angle = 0
var vel = 700

func _ready() -> void:
	player = get_node("../Hedgie")
	print(player)


func _process(delta: float) -> void:
	var playerPos = player.position
	var clankerPos = position
	
	var xdis = playerPos.x - clankerPos.x
	var ydis = playerPos.y - clankerPos.y
	angle = atan2(ydis, xdis)
	print(rad_to_deg(angle))
	rotation = angle
	
func _physics_process(delta: float) -> void:
	print(velocity)
	velocity = Vector2(vel*cos(angle), vel*sin(angle))
	move_and_slide()
