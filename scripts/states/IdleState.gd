extends BaseState
class_name IdleState

func enter(owner):
	if owner.has_method("play_idle_animation"):
		owner.play_idle_animation()

func execute(owner, delta):
	# Example transition: if owner has input handler and is moving
	if owner.has_node("InputHandler") and owner.get_node("InputHandler").call("is_moving"):
		if owner.has_method("change_state") and owner.has_node("RunState"):
			owner.change_state(owner.get_node("RunState"))
