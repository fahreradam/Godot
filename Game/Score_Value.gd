extends RichTextLabel
signal points(score)

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func ready():
	self.connect("change_ui_score", self, "points")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func points(score):
	print("here")
	text = score
	
