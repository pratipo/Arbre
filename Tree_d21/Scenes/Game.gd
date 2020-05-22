extends Node

#referenciar l'escena al Game i programar-li els moviments
export (PackedScene) var Player_R
export (PackedScene) var Player_L


onready var FirstPosition_R = $FirstPosition_R
onready var FirstPosition_L = $FirstPosition_L


func _ready():
	_first_players()


func _first_players():
	#para instanciar cinco personajes más:
#for counter in range (5):
	var new_player_R = Player_R.instance()
	add_child(new_player_R)
	new_player_R.position = FirstPosition_R.position
	
	new_player_R.initialize_Player_R (false)
	
	var new_player_L = Player_L.instance()
	add_child(new_player_L)
	new_player_L.position = FirstPosition_L.position

	
	
#func _initialise_Player_R():
	#pass
	
	
#func _process(delta):
#	pass
