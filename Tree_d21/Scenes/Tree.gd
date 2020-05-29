extends Node2D

onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right
onready var High_Trunk = $Tree/High_Trunk
onready var Low_Trunk = $Tree/Low_Trunk
onready var Dead_Tree = $Tree/Dead_Tree
onready var Game = $Game
#onready var Game = preload ("res://Scenes/Game.tscn").instance()

var game

func _ready():

	Dead_Tree.visible = false
	game = get_parent()
#	connect("area_entered", self, "_on_area_entered")

func _input(event):
	if event.is_action_pressed ("RightMouseButton"):
		tree_R.play("punch")
	elif event.is_action_pressed ("LeftMouseButton"):
		tree_L.play("punch")
	#else:
		#tree_R = false
		#tree_L = false

func die_tree():
	Dead_Tree.visible = true
	if true:
		pass



func _process(_delta):
	pass


