extends CanvasLayer


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		
func _on_quit_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().quit()

func _on_hud_win():
	visible = true
	$victory.play()
