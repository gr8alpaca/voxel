@icon("res://icons/voxel.png")
@tool
class_name Voxel extends RefCounted
const GROUP: StringName = &"Voxel"
const SIZE: float = 8.0



@export_storage var draw_properties:= {
	fill_color = Color.SNOW,
	outline_color = Color.BLACK,
	outline_width = 2.0,
}

@export_category("Transform")
@export var transform: Transform3D

var velocity: Vector3

#var body: RID = RID()


func _init() -> void:
	if Engine.is_editor_hint(): return
	#mesh = RenderingServer.mesh_create()
	
	#RenderingServer.mesh_set_custom_aabb(AABB())


func _notification(what: int) -> void:
	match what:
		NOTIFICATION_PREDELETE:
			pass

func get_buffer() -> PackedFloat32Array:
	return PackedFloat32Array([
		transform.basis.x.x, transform.basis.y.x, transform.basis.z.x, transform.origin.x, 
		transform.basis.x.y, transform.basis.y.y, transform.basis.z.y, transform.origin.y, 
		transform.basis.x.z, transform.basis.y.z, transform.basis.z.z, transform.origin.z
		])

#region Property Virtuals

func _get_property_list() -> Array[Dictionary]:
	var props: Array[Dictionary]
	for key: String in draw_properties.keys():
		var dict: Dictionary = {
			name = key, 
			type = typeof(draw_properties[key]), 
			usage = PROPERTY_USAGE_DEFAULT
			}
		
		if key == &"outline_width":
			dict.hint = PROPERTY_HINT_RANGE
			dict.hint_string = "0.0,%01.01f,0.2,suffix:px" % (SIZE/2.0)
		
		props.push_back(dict)
	
	return props



func _get(property: StringName) -> Variant:
	return draw_properties.get(property)


func _set(property: StringName, value: Variant) -> bool:
	if property in draw_properties.keys():
		draw_properties[property] = value
		#draw_properties = draw_properties
		#queue_redraw()
		return true
	return false


#endregion
