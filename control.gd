extends Control

func _physics_process(delta: float) -> void:
	print("PHYSICS TICK.... %03.02f" % (Time.get_ticks_msec() /1000.0) )

func _notification(what: int) -> void:
	#print("NOTIFICATION %d" % what)
	match what:
		pass
		#
		#NOTIFICATION_PARENTED:
			#printt("NOTIFICATION_PARENTED", get_parent())
