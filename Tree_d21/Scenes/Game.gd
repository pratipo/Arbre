extends Node

export (PackedScene) var Player_Scene


onready var tree = $Tree

onready var Dead_Tree = $Dead_Tree
onready var Timer_Joc = $Timer_Joc


#func _init():
#	var tree = Arbre_Scene.instance()
#	add_child(tree)


func _ready():
	Dead_Tree.visible = false
	tree.visible = true
	die_tree()


func die_tree():
	var Player_Reaches = Player_Scene.instance()
	add_child(Player_Reaches)
	Player_Reaches._on_Player_R_area_entered().is_in_group("Low_Trunk")
	if Player_Reaches: 
		tree.queue_free()
		Dead_Tree.visible = true
		Timer_Joc.start()


func _on_Timer_Joc_timeout():
	get_tree().reload_current_scene()
#	get_tree().change_scene("res://Scenes/Game.tscn")
