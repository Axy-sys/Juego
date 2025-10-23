extends BaseState
class_name DeathState

func get_priority() -> int:
	return 100  # máxima prioridad: bloquea TODO

func enter(prev_state_name: String = "") -> void:
	controller.play_animation("death")

func on_animation_finished() -> void:
	# muerte finalizada → opcional: emitir señal, desactivar el personaje, etc.
	controller.emit_signal("died") if controller.has_signal("died") else null
	# no cambiar de estado
