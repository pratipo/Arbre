extends Node2D

#onready var Player_R = $Player_R
#onready var Taimer = $Timer

var speed = 23
var direction = -1
var game 


func _ready():
	game = get_parent()
#	connect("area_entered", self, "_on_area_entered")
	#què és el self????

func _on_Player_R_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		print("hit low trunk")
		#game.die_tree()
	if area.is_in_group("High_Trunk"):
		print("hit hight trunk")
		#game.die_player()

#func initialise_Player_R():
	#pass

#Perquè es mogui en la seva direcció.
func _process(delta):
	position.x += speed * direction * delta



#func remove (from_left):
		#if from_left:
			#direction = -1
		#else:
			#direction = 1

#Perquè el "mort" marxi i l'animació es reinicii.
#func _on_Timer_timeout():
	#pass 



