extends Node2D

onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right

var game

func _ready():
	game = get_parent()
	connect("area_entered", self, "_on_area_entered")

#Ho he dit tot a l'script del Player_R - No funciona només allà... 
func _on_area_entered(High_Trunk, Low_Trunk):
	if High_Trunk.is_in_group("Axe"):
		game.die_player()
	if Low_Trunk.is_in_group("Axe"):
		game.die_tree()


func _input(event):
	if (event is InputEventMouseButton) and event.is_action_pressed ("RightMouseButton"):
		tree_R.play("punch_R")
	elif event.is_action_pressed ("LeftMouseButton"):
			tree_L.play("punch")
	#else:
		#tree_R = false
		#tree_L = false


#func _process(_delta):
	#pass

