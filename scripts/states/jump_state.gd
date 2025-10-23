extends BaseState
class_name JumpState

func get_priority() -> int:
	return 40

func enter(prev_state_name: String = "") -> void:
	controller.play_animation("jump")

func physics_update(delta: float) -> void:
	# ejemplo simple: si el sprite cae y la animación terminó -> idle/run
	# si usas un CharacterBody2D, podrías verificar is_on_floor() aquí.
	pass

func on_animation_finished() -> void:
	if controller.velocity.length() > 0.1:
		controller.change_state("run")
	else:
		controller.change_state("idle")
