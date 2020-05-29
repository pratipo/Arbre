extends Node


#export (PackedScene) var Player_R
#??

onready var tree = preload ("res://Scenes/Tree.tscn").instance()
onready var Player_R = preload ("res://Scenes/Player_R.tscn").instance()

onready var FirstPosition_R = $FirstPosition_R
#onready var FirstPosition_L = $FirstPosition_L
#FirstPosition = en cas de voler automatitzar l'entrada de players...

onready var Dead_Player = $Player_R/Body/Dead_Player
onready var Dead_Tree = $Tree/Tree/Dead_Tree
onready var Timer_Joc = $Timer_Joc

#var dead_p = false
#var dead_t = false
# p=player ; t=tree


func _ready():
	#first_players()
	pass
	
func _process(_delta):
	if Dead_Player:
		print("dead p @ game -process")
		return
	if Dead_Tree:
		print("dead tree @ game -process")
		return

func _on_Timer_Joc_timeout():
	get_tree().reload_current_scene()
	

