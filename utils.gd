@tool
extends EditorScript

func _run() -> void:
	print(123)
	
	var scene := preload("res://scenes/fire.tscn").instantiate()
	
	scene.call("run_a")
	
	scene.call('save_sprit_to_png', "res://saved_image.png")
