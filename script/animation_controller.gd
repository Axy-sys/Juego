extends AnimatedSprite2D

class_name AnimationController

const MOVEMENT_TO_IDLE = {
	"walk": "idle",
	"attack_1": "idle"
}

func play_movement_animation(velocity: Vector2):
	if velocity.x > 0:
		play("walk")
	elif velocity.x < 0:
		play("walk")
	
	if velocity.y > 0:
		play("walk")
	elif velocity.y < 0:
		play("walk")
	
func play_idle_animation():
	if MOVEMENT_TO_IDLE.keys().has(animation):
		play("idle")
