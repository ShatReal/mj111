extends Control

enum state {GOOD, BAD}
onready var die = $ViewportContainer/Viewport/die
onready var raycasts = $ViewportContainer/Viewport/die/raycasts
var faces = [state.GOOD, state.GOOD, state.BAD, state.GOOD, state.BAD, state.GOOD]
var award = 20
onready var debuff_mat = load("res://minigames/dice_roll/debuff_die.material")

func _ready():
	$endtimer.start()
	$Timer2.start()
	$Timer3.start()

func debuff() -> void:
	award = 30
	faces = [state.BAD, state.GOOD, state.GOOD, state.GOOD, state.BAD, state.BAD]
	die.get_node("die_mesh/Cube").mesh.surface_set_material(0, debuff_mat)

func _on_Timer2_timeout() -> void:
	die.apply_central_impulse(Vector3.UP * 5)
	die.apply_torque_impulse(RandUtils.vec3() * 8)

func _on_Timer3_timeout() -> void:
	var index = 0
	var largest = 0
	var largest_index = 0
	
	for raycast in raycasts.get_children():
		var normal = Vector3.UP.dot(raycast.get_collision_normal())
		if normal > largest:
			largest = normal
			largest_index = index
		index += 1
		
	if faces[largest_index] == state.GOOD:
		GameManager.earn_points(award)
	else:
		GameManager.earn_points(-award)


func _on_endtimer_timeout():
	GameManager.finish_game()
