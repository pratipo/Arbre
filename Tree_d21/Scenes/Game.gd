extends Node

export (PackedScene) var Player_Scene

onready var tree = $Tree
onready var Dead_Tree = $Dead_Tree

onready var Timer_Joc = $Timer_Joc

onready var Timer_Spawner = $Timer_Spawner

onready var Spawner_R = $Position_R
onready var Spawner_L = $Position_L
var players = []
#var players_R = []
#var players_L = []


func _ready():
	Dead_Tree.visible = false
	tree.visible = true
#	spawn()
	Timer_Spawner.start()


func spawn():
	#(from_right, from_left): per fer un if??
	for spawn in [Spawner_R, Spawner_L]:
		var Player_R = Player_Scene.instance()
		add_child(Player_R)
		players.append(Player_R)
		Player_R.position = Spawner_R.position
		var r = rand_range(1, 10)
		Timer_Spawner.set_wait_time(r)
		print ("spawn_R")


func _on_Timer_Spawner_timeout():
	spawn()

func die_tree():
	tree.queue_free()
	Dead_Tree.visible = true
	tree.visible = false
	Timer_Spawner.stop()
	Timer_Joc.start()


func _on_Timer_Joc_timeout():
	get_tree().reload_current_scene()
#	get_tree().change_scene("res://Scenes/Game.tscn")
