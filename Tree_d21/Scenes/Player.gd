extends Node2D

onready var Corpse = $Player_R/Corpse
onready var Death_Timer = $Player_R/Death_Timer
onready var Body = $Player_R/Body

var speed = 230
var direction = -1


var game


func _ready():
	Body.visible = true
	Corpse.visible = false
	game = get_tree().get_root().get_node("Game")


func _process(delta):
	position.x += speed * direction * delta


func movement(right_to_left):
	if right_to_left:
		direction = -1
	else:
		direction = 1
	set_process(true)


func _on_Player_R_area_entered(area):
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


func _on_Dead_Player_timeout():
	queue_free()
	


func _on_Death_Timer_timeout():
	pass # Replace with function body.
