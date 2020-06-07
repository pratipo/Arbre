extends Node

export (PackedScene) var Player_Scene
export (PackedScene) var Other_Player_Scene

onready var tree = $Tree
onready var Dead_Tree = $Dead_Tree

onready var Timer_Joc = $Timer_Joc
onready var Timer_Spawner = $Timer_Spawner

onready var Spawner_R = $Position_R
onready var Spawner_L = $Position_L

var speed = 230

var players = []

var Player_R
var Player_L
var Body_L



func _ready():
	Player_R = Player_Scene.instance()
	add_child(Player_R)
	Player_L = Other_Player_Scene.instance()
	add_child(Player_L)
#	Body_L = Player_L.get_node("/root/Game/@Player@2/Body")
#	flip_Player_L(true)
	spawn_players()
	Timer_Spawner.start()
	Dead_Tree.visible = false
	tree.visible = true

#func flip_Player_L(Body_L):
#	if Body_L:
#		Body_L.scale.x = -abs(Body_L.scale.x)
#	else:
#		Body_L.scale.x = abs(Body_L.scale.x)


func spawn_players():
	var new_Player_R = Player_Scene.instance()
	add_child(new_Player_R)
	new_Player_R.position = Spawner_R.position
	players.append(new_Player_R)
	var r = rand_range(0.1, 3)
	Timer_Spawner.set_wait_time(r)
	print ("spawn_R") 
	
	
	var new_Player_L = Other_Player_Scene.instance() 
	add_child(new_Player_L)
#	flip_Player_L(true)
	new_Player_L.position = Spawner_L.position
	players.append(new_Player_L)
	var l = rand_range(0.1, 3)
	Timer_Spawner.set_wait_time(l)
	print ("spawn_L") 


func _on_Timer_Spawner_timeout():
	spawn_players()


func die_tree():
	tree.queue_free()
	Dead_Tree.visible = true
	tree.visible = false
	Timer_Spawner.stop()
	Timer_Joc.start()


func _on_Timer_Joc_timeout():
	get_tree().reload_current_scene()
