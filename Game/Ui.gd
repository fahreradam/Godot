extends CanvasLayer

signal win()

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_player_change_ui_score(new_total) -> void:
	$Score_Value.text = str(new_total)

func _process(delta):
	win_score()
func win_score():
	if $Score_Value.text == "600000":
		emit_signal("win")
		
