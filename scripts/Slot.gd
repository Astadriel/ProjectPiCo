extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tower_build = false
const TOWER_BUILD_PATH = "res://sprites/Tower_Build.tscn"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	pass

func _on_Slot_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("Mouse_Button_Left"):
        print("Clicked")
		var tower_build_preload = preload(TOWER_BUILD_PATH)
		var tower_build_instance = tower_build_preload.instance()
		get_tree().get_root().get_node("World").add_child(tower_build_instance)
		tower_build = true
