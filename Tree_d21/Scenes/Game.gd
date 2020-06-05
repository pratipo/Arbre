extends Node

export (PackedScene) var Player_Scene

onready var tree = $Tree
onready var Dead_Tree = $Dead_Tree

onready var Timer_Joc = $Timer_Joc

onready var Spawner_R = $First_Position_R
onready var Spawner_L = $First_Position_L
onready var Timer_Spawner = $Timer

var players_R = []
var players_L = []


func _ready():
	Dead_Tree.visible = false
	tree.visible = true
#	spawn()
	Timer_Spawner.start()


func spawn_R():
	var Player_R = Player_Scene.instance()
	add_child(Player_R)
	Player_R.position = Spawner_R.position
	players_R.append(Player_R)
	
	var r = rand_range(0.5, 3)
	Timer_Spawner.set_wait_time(r)


func spawn_L():
	var Player_L = Player_Scene.instance()
	add_child(Player_L)
	Player_L.position = Spawner_L.position
	players_L.append(Player_L)
	
	var r = rand_range(0.5, 3)
	Timer_Spawner.set_wait_time(r)


func _on_Timer_timeout():
	spawn_R()
	spawn_L()


func die_tree():
	tree.queue_free()
	Dead_Tree.visible = true
	tree.visible = false
	Timer_Spawner.stop()
	Timer_Joc.start()


func _on_Timer_Joc_timeout():
	get_tree().reload_current_scene()
#	get_tree().change_scene("res://Scenes/Game.tscn")
