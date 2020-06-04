extends Node


export (PackedScene) var Player_Scene

#export (PackedScene) var tree_Scene 

onready var Dead_Tree = $Tree/Dead_Tree

onready var First_Position_R = $First_Position_R

onready var Timer_Joc = $Timer_Joc


func _ready():
#	var tree = tree_Scene.instance()
	Dead_Tree.visible = false

#	while true: 
#		randomize()
#		var new_player_r = Player_R
#		add_child(new_player_r)
#		yield (get_tree().create_timer(rand_range(0.5, 1.25)),"timeout")

	
func die_tree():
#	Dead_Tree.visible = true
#	Timer_Joc.start()
#	tree.queue_free()
	pass

func _on_Timer_Joc_timeout():
	get_tree().change_scene("res://Scenes/Game.tscn")
	

