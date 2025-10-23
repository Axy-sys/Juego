extends BaseState
class_name IdleState

func get_priority() -> int:
	return 0

func enter(prev_state_name: String = "") -> void:
	controller.play_animation("idle")

func physics_update(delta: float) -> void:
	# si empieza a moverse -> cambiar a run
	if controller.velocity.length() > 0.1:
		controller.change_state("run")
