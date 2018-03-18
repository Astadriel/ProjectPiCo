extends Node2D

const TOWER_BUILD_PATH = "res://instances/Tower.tscn"
var tower_overcost = 1.1

#func _ready():
#	# Called every time the node is added to the scene.
#	# Initialization here
#	pass

func _process(delta):
	pass

func _on_Slot_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("Mouse_Button_Left"):
		if get_tree().get_root().get_node("World").ressource >= get_tree().get_root().get_node("World").tower_cost:
			get_tree().get_root().get_node("World").ressource -= get_tree().get_root().get_node("World").tower_cost
			get_tree().get_root().get_node("World").tower_cost= floor(get_tree().get_root().get_node("World").tower_cost*tower_overcost)
			var tower_build_preload = preload(TOWER_BUILD_PATH)
			var tower_build_instance = tower_build_preload.instance()
			get_tree().get_root().get_node("World").add_child(tower_build_instance)
			tower_build_instance.global_position.x = global_position.x 
			tower_build_instance.global_position.y = global_position.y 
			print(get_tree().get_root().get_node("World").tower_cost)
			queue_free()
