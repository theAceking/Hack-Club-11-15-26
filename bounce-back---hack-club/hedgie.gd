extends CharacterBody2D

var ball_sprite
var sonc_sprite

var parry_cd = 2
var parrying = true
var parry_time

func _ready():
	ball_sprite = get_node("Ball")
	sonc_sprite = get_node("Sonc")
	sonc_sprite.visible = true
	ball_sprite.visible = false
	parry_time = Time.get_ticks_msec()

func _physics_process(delta):
		var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = input_direction * 670
		move_and_slide()

func _on_pickup_area_area_entered(area: Area2D) -> void:
	print("aeuhiuqegiueqghiueqg")
	if area.is_in_group("Ram"):
		area.queue_free()
	if area.is_in_group("Door"):
		print("door time")
		

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.is_action("parry"):
			var time_now = Time.get_ticks_msec()
			if time_now - parry_time < 1000:
				return
			print("deez")
			parrying = true
			parry_time = Time.get_ticks_msec()
			sonc_sprite.visible = false
			ball_sprite.visible = true
			await get_tree().create_timer(0.5).timeout
			parrying = true
			sonc_sprite.visible = true
			ball_sprite.visible = false
