extends Node

#referenciar l'escena al Game i programar-li els moviments
export (PackedScene) var Player_R_Scene
export (PackedScene) var Player_L_Scene


onready var FirstPosition_R = $FirstPosition_R
onready var FirstPosition_L = $FirstPosition_L


func _ready():
	_first_players()


func _first_players():
	var new_player_R = Player_R_Scene.instance()
	add_child(new_player_R)
	new_player_R.position = FirstPosition_R.position
	
	var new_player_L = Player_L_Scene.instance()
	add_child(new_player_L)
	new_player_L.position = FirstPosition_L.position
	
#func _process(delta):
#	pass
