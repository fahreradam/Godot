extends RichTextLabel


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func ready():
	get_tree().get_nodes_in_group("Player")[0].connect("change_ui_score", self, "points")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func points(score):
	print("here")
	text = score
	
