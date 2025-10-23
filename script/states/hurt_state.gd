extends BaseState
class_name HurtState

func get_priority() -> int:
	return 70

func enter(prev_state_name: String = "") -> void:
	controller.play_animation("hurt")

func on_animation_finished() -> void:
	# priorizar volver a idle/run
	if controller.velocity.length() > 0.1:
		controller.change_state("run")
	else:
		controller.change_state("idle")
