@tool
extends Node2D

@export_tool_button("export image")
var export_sprit_to_image = func ():
	save_sprit_to_png("res://a.png")

@onready var character_image: Sprite2D = $tanjilo

func _ready() -> void:
	print('on ready...')

func run_a():
	print('run a...')
	
func save_sprit_to_png(path: String):
	print('run save_sprit_to_png...')
	var tex = character_image.texture
	print('run save_sprit_to_png...', tex)
	
	var image = tex.get_image()
	var code := image.save_png(path)
	if code == OK:
		print('saved to ', path)
	else:
		print('failed to save image, error code:', code)
