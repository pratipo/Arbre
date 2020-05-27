extends Node

#referenciar l'escena al Game i programar-li els moviments
export (PackedScene) var Player_R
#export (PackedScene) var Player_L


onready var FirstPosition_R = $FirstPosition_R
#onready var FirstPosition_L = $FirstPosition_L
onready var Dead_Player = $Dead_Player
onready var Timer = $Dead_Player/Timer 
onready var Dead_Tree = $Dead_Tree

#això no sé per què ho fa servir
var dead_player = false
var dead_tree = false



func _ready():
	#first_players()
	Dead_Tree.visible = false

#?????Ni idea de si està funcionant el first players
#func first_players():
#para instanciar cinco personajes más:
#for counter in range (5):
	#var new_player_R = Player_R.instance()
	#add_child(new_player_R)
	#new_player_R.position = FirstPosition_R.position
	
	#new_player_R.initialize_Player_R (false)
	
	#var new_player_L = Player_L.instance()
	#add_child(new_player_L)
	#new_player_L.position = FirstPosition_L.position


#func _initialise_Player_R():
	#pass	


func _process(delta):
	
	#ESTOS IFS AQUÍ NO LOS PONE!
	#if collision areas del hacha y del tronco bajo tocan = dead árbol
		#if dead_tree:
			#return #END OF THE GAME...
	#if collision areas del hacha y del tronco alto tocan = dead hombre
		#if dead_player:
			#return #repetir animación, que sigan entrando 'mans'
	pass

func die_player():
	Dead_Player.position.x = Player_R.position.x
	Player_R.queue_free()
	Timer.start()
	Dead_Player.visible = true
	dead_player = true
	
func die_tree():
	#Timer.start()
	Dead_Tree.visible = true
	dead_tree = true

func _on_Timer_timeout():
	#get_tree().reload_current_scene()
	pass
