extends AnimatedSprite2D
class_name AnimationController

# --- Config ---
var default_state_name: String = "idle"

# Estados instanciados
var states: Dictionary = {}
var current_state = null
var velocity: Vector2 = Vector2.ZERO

# Señal opcional para muerte
signal died

func _ready() -> void:
	# Preload e instancia estados. Ajusta rutas si lo guardas en otra carpeta.
	# NOTA: si tus scripts están en otras rutas, actualiza estos preload(...) con las rutas reales.
	states["idle"]    = preload("res://script/states/idle_state.gd").new()
	states["run"]     = preload("res://script/states/run_state.gd").new()
	states["attack_2"]= preload("res://script/states/attack2_state.gd").new()
	states["attack_3"]= preload("res://script/states/attack3_state.gd").new()
	states["defend"]  = preload("res://script/states/defend_state.gd").new()
	states["hurt"]    = preload("res://script/states/hurt_state.gd").new()
	states["jump"]    = preload("res://script/states/jump_state.gd").new()
	states["death"]   = preload("res://script/states/death_state.gd").new()

	# Asignar controller y agregarlos como hijos para organización (opcional)
	for name in states.keys():
		var s = states[name]
		s.controller = self
		add_child(s)

	# Conectar la señal local de AnimatedSprite2D para saber cuando termina una animación
	if has_signal("animation_finished"):
		connect("animation_finished", Callable(self, "_on_animation_finished"))

	change_state(default_state_name)


func change_state(new_state_name: String, forced: bool=false) -> void:
	if not states.has(new_state_name):
		push_error("[AnimationController] Estado no encontrado: %s" % new_state_name)
		return

	var next_state = states[new_state_name]
	# comprobar prioridad
	if current_state and not forced:
		var cur_prio = 0
		var next_prio = 0
		if current_state.has_method("get_priority"):
			cur_prio = current_state.get_priority()
		if next_state.has_method("get_priority"):
			next_prio = next_state.get_priority()
		# no cambiamos si la prioridad del siguiente es menor que la actual
		if next_prio < cur_prio:
			return

	# cambiar estado
	if current_state:
		current_state.exit()
	current_state = next_state
	current_state.enter(current_state) # opcionalmente pasar prev_state_name


func play_animation(anim_name: String) -> void:
	# reproducir animación solo si existe
	if AnimationExists(anim_name):
		play(anim_name)
	else:
		push_warning("[AnimationController] Animación no encontrada: %s" % anim_name)

func AnimationExists(name: String) -> bool:
	# AnimatedSprite2D: comprobar en la lista de animaciones
	return name in animations

func _physics_process(delta: float) -> void:
	# Lógica por frame: actualizamos estado actual
	if current_state and current_state.has_method("physics_update"):
		current_state.physics_update(delta)

func _on_animation_finished() -> void:
	# delegar a estado actual
	if current_state and current_state.has_method("on_animation_finished"):
		current_state.on_animation_finished()
