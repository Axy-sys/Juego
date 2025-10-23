extends BaseState
class_name RunState

func enter(prev_state_name: String = "") -> void:
	controller.play_animation("run")

func physics_update(delta: float) -> void:
	if controller.velocity.length() <= 0.1:
		controller.change_state("idle")
