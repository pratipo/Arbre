extends Node2D

#onready var Player_R = $Player_R
#onready var Taimer = $Timer

onready var Dead_Player = $Body/Dead_Player
onready var Timer_Player = $Timer_Player

onready var Player_R = $Player_R

var speed = 230
var direction = -1

#var Dead_Player

func _ready():
	Dead_Player.visible = false
#	connect("area_entered", self, "_on_area_entered")
	#què és el self????

func _on_Player_R_area_entered(area):
	if area.is_in_group("Low_Trunk"):
		print("hit low trunk")
		#die_tree()
		
	if area.is_in_group("High_Trunk"):
		print("hit hight trunk")
		die_player()
		Dead_Player.visible = true
		queue_free()

func die_player():
#	if Dead_Player:
	#Dead_Player.position = Player_R.position
	Player_R.queue_free()
	Dead_Player.visible = true
	Timer_Player.start()


func _process(delta):
	position.x += speed * direction * delta


func _on_Timer_Player_timeout():
	get_tree().reload_current_scene()
	queue_free()
	
	
	
#func remove (from_left):
		#if from_left:
			#direction = -1
		#else:
			#direction = 1

#Perquè el "mort" marxi i l'animació es reinicii.
#func _on_Timer_timeout():
	#pass 






