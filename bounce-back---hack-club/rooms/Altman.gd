extends CharacterBody2D

var player
var rb
var angle = 0
var impulseangle = 0
var vel = 1200
var bouncing = false
@export var health: int = 3

func _ready() -> void:
	player = get_node("../Hedgie")
	print(player)


func _process(delta: float) -> void:
	var playerPos = player.position
	var clankerPos = position
	
	var xdis = playerPos.x - clankerPos.x
	var ydis = playerPos.y - clankerPos.y
	angle = atan2(ydis, xdis)
	rotation = angle
	if(health <= 0):
		queue_free()
		
func _physics_process(delta: float) -> void:
	if not bouncing:
		vel = 1200
		velocity = Vector2(vel*cos(angle), vel*sin(angle))
		move_and_slide()
	else:
		vel = -1800
		velocity = Vector2(vel*cos(impulseangle), vel*sin(impulseangle))
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Sonc"):
		bouncing = true
		impulseangle = angle
		await get_tree().create_timer(0.3).timeout
		bouncing = false
