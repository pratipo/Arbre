extends Position2D

export (PackedScene) var Player_Scene

func _ready():
	spawn()


func spawn():
	var new_Player_R = Player_Scene.instance()
	get_tree().get_nodes_in_group("Game")[0].call_deferred("add_child", new_Player_R)
	new_Player_R.global_position = global_position
#	rand_range(0.5, 1.25)

func _on_Timer_timeout():
	spawn()
