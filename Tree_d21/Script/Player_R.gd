extends Node2D

#onready var Player_R = $Player_R
#onready var Taimer = $Timer
#onready var tree = preload ("res://Scenes/Tree.tscn").instance(PackedScene)

export (PackedScene) var Arbre_Scene

onready var Corpse = $Corpse
onready var Dead_Player = $Dead_Player
onready var Body = $Body

var speed = 230
var direction = -1

var Game_Scene

func _ready():
	Body.visible = true
	Corpse.visible = false


func _process(delta):
	position.x += speed * direction * delta


func _on_Player_R_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		speed = 0
		var tree = Arbre_Scene.instance()
		add_child(tree)
		tree.die_tree()
		
		print("dead tree")
		
	if area.is_in_group("High_Trunk"):
		die_player()
		

func die_player():
#	if Dead_Player:
	#Dead_Player.position = Player_R.position
	Body.visible = false
	Corpse.visible = true
	speed = 0
	Dead_Player.start()


func _on_Dead_Player_timeout():
	queue_free()
	
	
	
#func remove (from_left):
		#if from_left:
			#direction = -1
		#else:
			#direction = 1

#Perquè el "mort" marxi i l'animació es reinicii.
#func _on_Timer_timeout():
	#pass 






