extends Node


#export (PackedScene) var Player_R
#??



onready var FirstPosition_R = $FirstPosition_R
#onready var FirstPosition_L = $FirstPosition_L
onready var Dead_Player = $Dead_Player
#onready var Timer = $Dead_Player/Timer 
onready var Dead_Tree = $Dead_Tree


onready var tree = preload ("res://Scenes/Tree.tscn")
onready var Player_R = preload ("res://Scenes/Player_R.tscn")


func _ready():
	#first_players()
	Dead_Tree.visible = false
	Dead_Player.visible = false
	
	
func _process(_delta):
	#ESTOS IFS AQUÍ NO LOS PONE!
	#if collision areas del hacha y del tronco bajo tocan = dead árbol
		#if dead_tree:
			#return #END OF THE GAME...
	#if collision areas del hacha y del tronco alto tocan = dead hombre
		#if dead_player:
			#return #repetir animación, que sigan entrando 'mans'
	pass

func die_player():
#if las "area entered (en el tree)" true, Dead_Player 
	Dead_Player.position.x = Player_R.position.x
	
	if Dead_Player:
		Dead_Player.visible = true
		#Timer.start()
		Player_R.queue_free()
	#reempezar el juego

func die_tree():
	if Dead_Tree:
		Dead_Tree.visible = true
		#Timer.start()
		Dead_Tree.queue_free()
	#reempezar el juego

#func _on_Timer_timeout():
	#get_tree().reload_current_scene()

