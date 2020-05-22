extends Node2D

onready var Player_L = $Player_L

var speed = 230
var direction = 1


func _ready():
	pass 
	

func remove (from_right):
		if from_right:
			direction = 1
		else:
			direction = -1


func _process(delta):
	position.x += speed * direction * delta
