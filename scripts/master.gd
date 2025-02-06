class_name Master extends SceneTree

const EXIT_ON_KEY: int = KEY_ESCAPE

#var root
#var current_scene

func _initialize() -> void:
	root.set_process(false)
	root.set_physics_process(false)
	

func _finalize() -> void:
	pass

func change_scene(node: Node) -> void:
	if current_scene: 
		root.remove_child(current_scene)
		current_scene.free()
	
	root.add_child(node)
	current_scene = node


func _process(delta: float) -> bool:
	#root.notify_thread_safe(Node.NOTIFICATION_PROCESS)
	#root.propagate_call(&"process", [delta])
	return Input.is_key_pressed(EXIT_ON_KEY) if EXIT_ON_KEY else false

func _physics_process(delta: float) -> bool:
	#root.notify_thread_safe(Node.NOTIFICATION_PHYSICS_PROCESS)
	#root.propagate_call(&"physics_process", [delta])
	
	return Input.is_key_pressed(EXIT_ON_KEY) if EXIT_ON_KEY else false
