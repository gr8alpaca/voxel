class_name VoxelPhysics

class PhysicsProperties:
	pass

## Height(position:y) at which to remove voxel from simultation
const KILL_HEIGHT: float = -100.0

func register(voxel: Voxel) -> void:
	pass
	#call_deferred(voxel)
	

func tick(delta: float, pool: Array[Voxel]) -> void:
	pass
func tick_physics(delta: float, pool: Array[Voxel]) -> void:
	pass
