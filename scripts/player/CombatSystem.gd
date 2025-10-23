extends Node2D
class_name CombatSystem

@onready var animated_sprite_2d: AnimationController = $"../AnimatedSprite2D"

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack"):
		if animated_sprite_2d and not animated_sprite_2d.is_attacking:
			animated_sprite_2d.play_attack_animation()
