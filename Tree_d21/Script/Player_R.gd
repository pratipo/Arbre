extends Node2D

onready var Player_R = $Player_R

var speed = 230
var direction = -1


func _ready():
	pass # Replace with function body.


#func initialise_Player_R():
	#pass
	
func remove (from_left):
		if from_left:
			direction = -1
		else:
			direction = 1

func _process(delta):
	position.x += speed * direction * delta
