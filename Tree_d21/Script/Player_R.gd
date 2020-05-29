extends Node2D

#onready var Player_R = $Player_R
#onready var Taimer = $Timer
onready var tree = preload ("res://Scenes/Tree.tscn").instance()
onready var Corpse = $Corpse
onready var Timer_Player = $Timer_Player
onready var Body = $Body


var speed = 230
var direction = -1

#var Dead_Player

func _ready():
	Body.visible = true
	Corpse.visible = false
#	connect("area_entered", self, "_on_area_entered")
	#què és el self????

func _on_Player_R_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		print("hit low trunk")
		tree.die_tree()
		
	if area.is_in_group("High_Trunk"):
		die_player()
		


func die_player():
#	if Dead_Player:
	#Dead_Player.position = Player_R.position
	Body.visible = false
	Corpse.visible = true
	speed = 0
	Timer_Player.start()


func _process(delta):
	position.x += speed * direction * delta


func _on_Timer_Player_timeout():
#	get_tree().reload_current_scene()
	queue_free()
	
	
	
#func remove (from_left):
		#if from_left:
			#direction = -1
		#else:
			#direction = 1

#Perquè el "mort" marxi i l'animació es reinicii.
#func _on_Timer_timeout():
	#pass 






