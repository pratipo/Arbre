extends Node2D

onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right
onready var High_Trunk = $Tree/High_Trunk
onready var Low_Trunk = $Tree/Low_Trunk
onready var Dead_Tree = $Dead_Tree
onready var Timer_Tree = $Timer_Tree

#onready var Game = preload ("res://Scenes/Game.tscn").instance()


func _ready():
	Dead_Tree.visible = false
#	connect("area_entered", self, "_on_area_entered")


func die_tree():
	queue_free()
	Dead_Tree.visible = true
	Timer_Tree.start()


func _input(event):
	if event.is_action_pressed ("RightMouseButton"):
		tree_R.play("punch")
	elif event.is_action_pressed ("LeftMouseButton"):
		tree_L.play("punch")
	#else:
		#tree_R = false
		#tree_L = false



func _on_Timer_Tree_timeout():
	queue_free()
