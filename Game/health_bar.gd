extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = $Viewport.get_texture()


func set_percentage(value):
	if value < 0:
		value = 0
	if value > 100:
		value = 100
	$Viewport/TextureProgress.value = value
	
func get_percentage():
	return $Viewport/TextureProgress.value
