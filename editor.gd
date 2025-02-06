@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	print("Running...")
	var scene:= get_scene()
	
	for prop in scene.get_property_list():
		if "rotation" not in prop.name: continue
		print(prop)  
