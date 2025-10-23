extends Node
class_name Health

@export var max_health: int = 100
var current: int = 100

signal health_changed(current)
signal died()

func _ready():
	current = max_health

func take_damage(amount: int):
	current = max(current - amount, 0)
	emit_signal("health_changed", current)
	if current == 0:
		emit_signal("died")
