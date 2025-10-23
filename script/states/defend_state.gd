extends BaseState
class_name DefendState

func get_priority() -> int:
	return 30

func enter(prev_state_name: String = "") -> void:
	# Defend suele ser looped; sólo saldrá por una acción externa
	controller.play_animation("defend")

func physics_update(delta: float) -> void:
	# puedes añadir lógica aquí: por ejemplo, si termina la defensa
	# controller.change_state("idle")
	pass
