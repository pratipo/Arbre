extends Node2D

onready var tree_L = $Tree_Left
onready var tree_R = $Tree_Right
onready var High_Trunk = $Tree/High_Trunk
onready var Low_Trunk = $Tree/Low_Trunk

var game

func _ready():
	game = get_parent()
#	connect("area_entered", self, "_on_area_entered")

func _on_High_Trunk_area_entered(area):
	if area.is_in_group("Player"):
		print("kill player")
		game.die_player()
		
func _on_Low_Trunk_area_entered(area):
	if area.is_in_group("Player"):
#		game.die_tree()
		print("kill tree")

func _input(event):
	if event.is_action_pressed ("RightMouseButton"):
		tree_R.play("punch")
	elif event.is_action_pressed ("LeftMouseButton"):
		tree_L.play("punch")
	#else:
		#tree_R = false
		#tree_L = false


func _process(_delta):
	pass


