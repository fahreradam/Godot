extends CanvasLayer

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().paused == true:
		self.visible = true

func _on_continue_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().paused = false
		self.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
func _on_new_game_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().paused = false
		self.visible = false
		get_tree().change_scene("res://level_two.tscn")

func _on_exit_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().quit()
