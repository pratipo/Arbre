extends Node2D

#onready var Player_R = $Player_R
#onready var Taimer = $Timer
#onready var tree = preload ("res://Scenes/Tree.tscn").instance(PackedScene)
export (PackedScene) var tree

onready var Corpse = $Corpse
onready var Timer_Player = $Timer_Player
onready var Body = $Body

var speed = 230
var direction = -1


func _ready():
	var tree = tree.instance(PackedScene)
	Body.visible = true
	Corpse.visible = false


func _process(delta):
	position.x += speed * direction * delta


func _on_Player_R_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		speed = 0
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
	Timer_Player.start()


func _on_Timer_Player_timeout():
	queue_free()
	
	
	
#func remove (from_left):
		#if from_left:
			#direction = -1
		#else:
			#direction = 1

#Perquè el "mort" marxi i l'animació es reinicii.
#func _on_Timer_timeout():
	#pass 






