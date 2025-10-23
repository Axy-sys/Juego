extends AnimatedSprite2D
class_name AnimationController

var is_attacking: bool = false
var last_direction: String = "right"

func play_movement_animation(velocity: Vector2) -> void:
	if is_attacking:
		return
	
	if velocity.x > 0:
		last_direction = "right"
		flip_h = false
		play("walk")
	elif velocity.x < 0:
		last_direction = "left"
		flip_h = true
		play("walk")
	elif velocity.y != 0:
		play("walk")
	else:
		play("idle")

func play_idle_animation() -> void:
	if is_attacking:
		return
	play("idle")

func play_attack_animation() -> void:
	if is_attacking:
		return

	is_attacking = true
	play("attack_1")

	# 🕒 Calcular duración manual (para todas las versiones de Godot)
	var frame_count = sprite_frames.get_frame_count("attack_1")
	var fps = sprite_frames.get_animation_speed("attack_1")
	var attack_length = frame_count / float(fps)

	await get_tree().create_timer(attack_length).timeout

	is_attacking = false
	play("idle")
