extends RigidBody2D

export var thrust = 10
var reward = 10

func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	if Input.is_action_pressed('space'):
		state.apply_central_impulse(Vector2.UP * thrust)

func _on_sled_body_entered(_body):
	if linear_velocity.y > .01:
		GameManager.earn_points(reward)
	else:
		GameManager.earn_points(-reward)
	GameManager.load_new_game()
