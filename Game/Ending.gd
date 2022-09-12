extends CanvasLayer



var time = 3.63
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var prev_visible = visible
	if get_tree().get_nodes_in_group("Player")[0].health <= 0:
		visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if prev_visible != visible:
		$lose_sound.play()
	if time <= 0:
		$lose_sound.stop()
	if $lose_sound.playing == true:
		time -= delta
func _on_quit_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().quit()

func _on_new_game_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://level_one.tscn")
