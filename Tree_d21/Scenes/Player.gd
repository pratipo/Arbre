extends Node2D

onready var Corpse = $Corpse
onready var Death_Timer = $Death_Timer
onready var Body = $Body


var speed = 230
var direction = -1

var game


func _ready():
	game = get_tree().get_root().get_node("Game")
	Body.visible = true
	Corpse.visible = false

func _process(delta):
	position.x += speed * direction * delta 

func flip_Player_L(cuerpo, muerto):
	if cuerpo:
		Body.scale.x = -1
	if muerto:
		Corpse.scale.x = -1

func _on_Player_area_entered(area):
	if area.is_in_group("Low_Trunk"):
#		speed = 0
		game.die_tree()
		
	if area.is_in_group("High_Trunk"):
		die_player()

func die_player():
	Body.visible = false
	Corpse.visible = true
	speed = 0
	Death_Timer.start()

func _on_Death_Timer_timeout():
#	Corpse.queue_free()
	queue_free()
