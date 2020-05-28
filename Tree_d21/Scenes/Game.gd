extends Node


#export (PackedScene) var player_r
#??

onready var tree = preload ("res://Scenes/Tree.tscn")
onready var Player_R = preload ("res://Scenes/Player_R.tscn")

onready var FirstPosition_R = $FirstPosition_R
#onready var FirstPosition_L = $FirstPosition_L
#FirstPosition = en cas de voler automatitzar l'entrada de players...

onready var Dead_Player = $Dead_Player
#onready var Timer = $Dead_Player/Timer 
onready var Dead_Tree = $Dead_Tree
onready var timer = $Timer

var dead_p = false
var dead_t = false
# p=player ; t=tree



func _ready():
	#first_players()
	Dead_Tree.visible = false
	Dead_Player.visible = false
	
	
func _process(_delta):
	if dead_p:
		return
	if dead_t:
		return
	
	#ESTOS IFS AQUÍ NO LOS PONE! ELS HE POSAT ALS SCRIPTS DE TREE I PLAYER
	#if collision areas del hacha y del tronco bajo tocan = dead árbol
		#if dead_tree:
			#return #END OF THE GAME...
	#if collision areas del hacha y del tronco alto tocan = dead hombre
		#if dead_player:
			#return #repetir animación, que sigan entrando 'mans'



func die_player():
#if las "area entered (en el tree)" true, Dead_Player 
	
	if Dead_Player:
		Dead_Player.position.x = Player_R.position.x
		Dead_Player.visible = true
		dead_p = true
		Player_R.queue_free()
	timer.strat()

func die_tree():
	if Dead_Tree:
		Dead_Tree.visible = true
		dead_t = true
		tree.queue_free()
	timer.strat()
#I no es poden unificar els dos casos de mort, del tree i del player, en una mateixa funció? 

func _on_Timer_timeout():
	get_tree().reload_current_scene()
