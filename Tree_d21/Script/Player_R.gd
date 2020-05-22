extends Node2D

onready var Player_R = $Player_R
onready var Dead = $Dead
onready var Taimer = $Timer

var speed = 230
var direction = -1


func _ready():
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(area):
	if area.is_in_group("Chof"):
		Player_R.dead()

#func initialise_Player_R():
	#pass
	
func _process(delta):
	position.x += speed * direction * delta

func remove (from_left):
		if from_left:
			direction = -1
		else:
			direction = 1

func dead ():
	Dead.position.x = Player_R.position.x
	Dead.visible = true
	 
func _on_Timer_timeout():
	pass # Replace with function body.
