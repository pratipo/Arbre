extends Node


#export (PackedScene) var Player_R
#??

onready var tree = preload ("res://Scenes/Tree.tscn").instance()
onready var Player_R = preload ("res://Scenes/Player_R.tscn").instance()

onready var FirstPosition_R = $FirstPosition_R
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
	Dead_Tree.visible = false
	
func _process(_delta):
	pass
	
func game_over():
	tree.queue_free()
	print("queue_free funciona")
	if Dead_Tree:
		Timer_Joc.start()
		Dead_Tree.visible = true
		print("dead tree @ game -process")
		

func _on_Timer_Joc_timeout():
	get_tree().change_scene("res://Scenes/Game.tscn")
	

