@tool
class_name Main extends Node3D

@export_tool_button("Create Voxel", "CollisionShape3D")
var caller:= VoxelPool.register.bind(voxel)

var voxel: Voxel = Voxel.new()

@export var voxel_transform: Transform3D:
	get: return voxel.transform
	set(val): voxel.transform = val

func get_base() -> MeshInstance3D:
	var mesh: MeshInstance3D = $MeshInstance3D
	mesh.get_instance()
	return mesh

#func _validate_property(property: Dictionary) -> void:
	#match property.name:
		#
		#&"voxel_transform":
			#
			#property.usage = PROPERTY_USAGE_DEFAULT
	#
