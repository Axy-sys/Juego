extends BaseState
class_name Attack1State

func get_priority() -> int:
	return 50  # alto: interrumpe run/idle

func enter(prev_state_name: String = "") -> void:
	# reproducir la animación (no en loop)
	controller.play_animation("attack_1")

func on_animation_finished() -> void:
	# al terminar el ataque, volver a idle o run según velocidad
	if controller.velocity.length() > 0.1:
		controller.change_state("run")
	else:
		controller.change_state("idle")
