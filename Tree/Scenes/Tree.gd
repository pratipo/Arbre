extends Node2D

onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right


func _ready():
	pass


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

