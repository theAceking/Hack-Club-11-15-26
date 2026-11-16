extends CharacterBody2D

var ball_sprite
var sonc_sprite
var health_label

var hp = 10

var parry_cd = 2
var parrying = false
var parry_time = 0
var vel = 670

func _ready():
	ball_sprite = get_node("Ball")
	sonc_sprite = get_node("Sonc")
	health_label = get_node("Health")
	sonc_sprite.visible = true
	ball_sprite.visible = false


func _physics_process(delta):
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_direction * vel
		move_and_slide()

func _process(delta):
	var dir = Input.get_axis("ui_left", "ui_right")
	health_label.text = str(Playerstats.health)
	if dir > 0: #right
		sonc_sprite.flip_h = true
	if dir < 0:
		sonc_sprite.flip_h = false

func _on_pickup_area_area_entered(area: Area2D) -> void:
	print("aeuhiuqegiueqghiueqg")
	if area.is_in_group("Ram"):
		area.queue_free()
	if area.is_in_group("Door"):
		print("door time")
	if area.is_in_group("Heal"):
		Playerstats.health += 5
		area.queue_free()
	if area.is_in_group("DamageUpgrade"):
		Playerstats.damage += 1
		area.queue_free()
		

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.is_action("parry"):
			var time_now = Time.get_ticks_msec()
			if time_now - parry_time < 600:
				return
			print("deez")
			parrying = true
			parry_time = Time.get_ticks_msec()
			sonc_sprite.visible = false
			ball_sprite.visible = true
			await get_tree().create_timer(0.267).timeout
			parrying = false
			sonc_sprite.visible = true
			ball_sprite.visible = false


func _on_hurtbox_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("Altman"):
		if parrying:
			print('lollllz')
			area.get_parent().health -= Playerstats.damage
			parry_time = 0
			print(area.get_parent().health)
		else:
			Playerstats.health -= 1
			health_label.text = str(Playerstats.health)
