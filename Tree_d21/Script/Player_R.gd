extends Node2D

onready var Player_R = $Player_R
onready var Dead = $Dead
onready var Taimer = $Timer

var speed = 230
var direction = -1
var game 


func _ready():
	game = get_parent()
	connect("area_entered", self, "_on_area_entered")
#què és el self????

func _on_area_entered(Axe):
	if Axe.is_in_group("Low_Trunk"):
		game.die_tree()
	if Axe.is_in_group("High_Trunk"):
		game.die_player()

#func initialise_Player_R():
	#pass
	
func _process(delta):
	position.x += speed * direction * delta

func remove (from_left):
		if from_left:
			direction = -1
		else:
			direction = 1

	 
func _on_Timer_timeout():
	pass # Replace with function body.
