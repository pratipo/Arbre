extends Node2D

export (PackedScene) var Title_Scene

onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right

onready var title = $Title

var game
var titol

func _ready():
	game = get_tree().get_root().get_node("Game")
	titol = Title_Scene.instance()
	add_child(titol)
	titol.visible = true

func _input(event):

	if event.is_action_pressed ("RightMouseButton"):
		tree_R.play("punch")
		game._on_Timer_Title_timeout()
		
	elif event.is_action_pressed ("LeftMouseButton"):
		tree_L.play("punch")
		game._on_Timer_Title_timeout()



