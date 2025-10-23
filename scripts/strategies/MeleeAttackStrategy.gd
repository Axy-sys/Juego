extends Resource
class_name MeleeAttackStrategy

func attack(owner, target):
	if target and target.has_method("take_damage"):
		target.take_damage(10)
