extends Node
class_name GameManager

@onready var enemy_factory: EnemyFactory = null

func _ready():
	enemy_factory = get_node_or_null("/root/EnemyFactory") or get_node_or_null("../EnemyFactory")
