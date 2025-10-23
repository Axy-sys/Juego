extends Node
class_name BaseState

# Referencia al controlador (se asigna tras instanciar el estado)
var controller

# Opcional: prioridad numérica. Estados con mayor prioridad
# no son interrumpidos por estados de menor prioridad.
func get_priority() -> int:
	return 0

func enter(prev_state_name: String = "") -> void:
	# ejecutado al entrar en el estado
	pass

func exit() -> void:
	# ejecutado al salir del estado
	pass

func physics_update(delta: float) -> void:
	# lógica por frame (física)
	pass

func on_animation_finished() -> void:
	# se llama cuando el AnimatedSprite2D avisa que terminó la animación actual
	pass
