extends Node2D

#onready var Player_R = $Player_R
#onready var Taimer = $Timer
#onready var tree = preload ("res://Scenes/Tree.tscn").instance(PackedScene)



onready var Corpse = $Corpse
onready var Dead_Player = $Dead_Player
onready var Body = $Body

var speed = 230
var direction = -1


func _ready():
	Body.visible = true
	Corpse.visible = false


func _process(delta):
	position.x += speed * direction * delta


func _on_Player_R_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		speed = 0
		
		print("dead tree")
		
	if area.is_in_group("High_Trunk"):
		die_player()
		

func die_player():
	Body.visible = false
	Corpse.visible = true
	speed = 0
	Dead_Player.start()


func _on_Dead_Player_timeout():
	queue_free()
