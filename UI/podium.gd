extends Control

onready var score_label = $ColorRect/CenterContainer/MarginContainer/score

func _ready():
	set_points()
	yield(SceneManager, "transition_finished")
	if GameManager.add_points > 0:
		$PointSound.pitch_scale = .5
	else:
		$PointSound.pitch_scale = 1.5
	$ScoreTimer.start()

func _on_Timer_timeout():
	$AnimationPlayer.play("point")

	if GameManager.add_points < 0:
		if $PointSound.pitch_scale > .4:
			$PointSound.pitch_scale -= .05
		GameManager.current_points -= 1
		GameManager.add_points += 1
	elif GameManager.add_points > 0:
		if $PointSound.pitch_scale < 2:
			$PointSound.pitch_scale += .05
		GameManager.current_points += 1
		GameManager.add_points -= 1
	set_points()
	if GameManager.add_points == 0:
		$ScoreTimer.stop()
		$EndTimer.start()

func set_points():
	score_label.bbcode_text = "[center]%s[/center]" % GameManager.current_points

func _on_EndTimer_timeout():
	GameManager.load_new_game()
