extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d: AnimationController = $AnimatedSprite2D

const SPEED: float = 5000.0

func _physics_process(delta: float) -> void:
	# Si el personaje está atacando, no se puede mover
	if animated_sprite_2d.is_attacking:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var direction := Input.get_vector("left", "right", "up", "down")

	if direction != Vector2.ZERO:
		velocity = direction * SPEED * delta
		animated_sprite_2d.play_movement_animation(velocity)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.y = move_toward(velocity.y, 0, SPEED * delta)
		animated_sprite_2d.play_idle_animation()

	move_and_slide()
