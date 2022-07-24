extends RigidBody2D

export var thrust = 10
var reward = 10
var onground = false

onready var crash_tex = load("res://images/MiniGameJam - Colors/Sled Fall/sledbreak.png")
onready var landed = load("res://images/MiniGameJam - Colors/Sled Fall/sledland.png")

func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	if onground:
		return
	if Input.is_action_pressed('space'):
		state.apply_central_impulse(Vector2.UP * thrust)

func _on_sled_body_entered(_body):
	if onground:
		return
	if(!$finished_timer.is_stopped()):
		return
	end(linear_velocity.y > 50)

func _on_finished_timer_timeout():
	GameManager.finish_game()

func end(crash):
	if onground:
		return	
	if crash:
		GameManager.earn_points(-reward)
		$Sprite.texture = crash_tex
		$CrashSound.play()
	else:
		GameManager.earn_points(reward)
		$Sprite.texture = landed
		$Sprite.rotation_degrees = -62.6
		$Sprite.position += Vector2(-100, 0)
	$finished_timer.start()
	onground = true

func _on_VisibilityNotifier2D_screen_exited():
	end(true)
