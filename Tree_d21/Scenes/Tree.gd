extends Node2D

#onready var tree = $Sprite_Tree


# Les animacions
onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right


onready var Dead_Tree = $Dead_Tree
#onready var Timer_Tree = $Timer_Tree


func _ready():
#	tree.visible = true
#	Dead_Tree.visible = false
	pass

#func die_tree():
#	Dead_Tree.visible = true
#	tree.visible = false
#	Timer_Tree.start()
##	queue_free()


func _input(event):
	if event.is_action_pressed ("RightMouseButton"):
		tree_R.play("punch")
	elif event.is_action_pressed ("LeftMouseButton"):
		tree_L.play("punch")





