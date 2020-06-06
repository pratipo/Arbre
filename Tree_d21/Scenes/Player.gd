extends Node2D

onready var Corpse = $Corpse
onready var Death_Timer = $Death_Timer
onready var Body = $Body

var speed = 230
var direction = -1
#direction = "left"

var game
var Spawner_L

func _ready():
	game = get_tree().get_root().get_node("Game")
	Body.visible = true
	Corpse.visible = false
#	set_process(false)

func _process(delta):
	position.x += speed * direction * delta 
	
func flip_Player_L():
	if direction == 1:
		Body.flip_h(true)
		direction = "Right"
	if direction == -1:
		Body.flip_h(false)
		direction = "Left"
	

#func movement(left_to_right):
#	if left_to_right:
#		direction = 1
#		var Spawner_L = get_tree().get_root().get_node("First_Position_L")
#		if Spawner_L.position.x < center:
#			Body.scale.x = -abs(scale.x)
#			right = false
#		else:
#			position.x = center + offset
#			Body.scale.x = abs(scale.x)
#			right = true
#	else:
#		direction = -1
#	set_process(true)


func _on_Player_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		speed = 0
		game.die_tree()
		print("dead tree")
		
	if area.is_in_group("High_Trunk"):
		die_player()


func die_player():
	Body.visible = false
	Corpse.visible = true
	speed = 0
	Death_Timer.start()


func _on_Death_Timer_timeout():
	queue_free()
