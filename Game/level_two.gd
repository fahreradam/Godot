extends Spatial

signal paused()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pause_screen()
func pause_screen():
	if Input.is_action_just_pressed("pause"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		emit_signal("paused")


func _on_win_screen_visibility_changed() -> void:
	if $background.playing == true:
		$background.stop()


func _on_lose_screen_visibility_changed() -> void:
	if $background.playing == true:
		$background.stop()
