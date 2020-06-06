extends Node

export (PackedScene) var Player_Scene

onready var tree = $Tree
onready var Dead_Tree = $Dead_Tree

onready var Timer_Joc = $Timer_Joc
onready var Timer_Spawner = $Timer_Spawner

onready var Spawner_R = $Position_R
onready var Spawner_L = $Position_L

var speed = 230
var direction = -1
var direction_L = 1

var players = []

var Player_R
var Player_L



func _ready():
	Player_R = Player_Scene.instance()
	add_child(Player_R)
	Player_L = Player_Scene.instance()
	add_child(Player_L)

#	spawn_first_players()
	Timer_Spawner.start()

	Dead_Tree.visible = false
	tree.visible = true


#Hauria d'anar a l'script del player, 
#però allà no tinc les dues variables, R i L.I no es pot instanciar a un mateix.
func _process(delta):
	Player_R.position.x += speed * direction * delta 
	Player_L.position.x += speed * direction_L * delta 


func spawn_players():
#	var Player_R = Player_Scene.instance()
#	add_child(Player_R)
	Player_R.position = Spawner_R.position
	players.append(Player_R)
	var r = rand_range(0.1, 3)
	Timer_Spawner.set_wait_time(r)
	print ("spawn_R") #sí que fa print
	
	var Player_L = Player_Scene.instance()
	add_child(Player_L)
#	Player_L.get_node(@"Player/Body")
	Player_L.scale.x = -abs(scale.x)
	Player_L.position = Spawner_L.position
	players.append(Player_L)
	var l = rand_range(0.1, 3)
	Timer_Spawner.set_wait_time(l)
	print ("spawn_L") #NO fa print


func _on_Timer_Spawner_timeout():
	pass


func die_tree():
	tree.queue_free()
	Dead_Tree.visible = true
	tree.visible = false
	Timer_Spawner.stop()
	Timer_Joc.start()


func _on_Timer_Joc_timeout():
	get_tree().reload_current_scene()
