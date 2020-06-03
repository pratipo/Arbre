extends Node


#export (PackedScene) var Player_R
#??

#onready var tree = preload ("res://Scenes/Tree.tscn").instance()
#onready var Player_R = preload ("res://Scenes/Player_R.tscn").instance()

onready var tree = $Tree
onready var Player_R = $Player_R
onready var First_Position_R = $Player_R/First_Position_R

var last_spawn_position
#onready var FirstPosition_L = $FirstPosition_L
#FirstPosition = en cas de voler automatitzar l'entrada de players...

onready var Corpse = $Player_R/Corpse
onready var Dead_Tree = $Tree/Dead_Tree
onready var Timer_Joc = $Timer_Joc

#var dead_p = false
#var dead_t = false
# p=player ; t=tree


func _ready():
	#first_players()
#	var arbre = tree.instance()
#	Dead_Tree.visible = false
	_spawn_first_player_R()

func _spawn_first_player_R():
	while true: 
		randomize()
		var new_player_r = Player_R
#		add_child(new_player_r)
		new_player_r.set_pos(First_Position_R)
		yield (get_tree().create_timer(rand_range(0.5, 1.25)),"timeout")




func _process(_delta):
#ˇ	Player_R.randomize()
#	var x = randi() % Player_R.size()
#	location.x = FirstPosition_R
#	location.y = FirstPosition_R
#	var scene = Player_R[x].instance()
#	scene.position = location
#	add_child(scene)
	pass
	
#func game_over():
##	tree.queue_free()
#	Dead_Tree.visible = true
#	Timer_Joc.start()
#	print("game over")
		

func _on_Timer_Joc_timeout():
	get_tree().change_scene("res://Scenes/Game.tscn")
	

