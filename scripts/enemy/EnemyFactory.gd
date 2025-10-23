extends Node
class_name EnemyFactory

func create_enemy(type: String) -> Node:
	match type:
		"melee":
			var path = "res://scenes/enemy/MeleeEnemy.tscn"
			if ResourceLoader.exists(path):
				return preload(path).instantiate()
			return null
		"ranged":
			var path = "res://scenes/enemy/RangedEnemy.tscn"
			if ResourceLoader.exists(path):
				return preload(path).instantiate()
			return null
		_:
			return null
