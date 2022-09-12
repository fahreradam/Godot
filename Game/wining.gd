extends CanvasLayer

var time = 0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if len(get_tree().get_nodes_in_group("Enemy")) <= 0 and time <= 0:
		get_tree().paused = true
		visible = true
func _on_quit_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().quit()
