@icon("res://icons/voxel_paint.png")
@tool
class_name VoxelRenderer
const SIZE: float = 1.0
#(basis.x.x, basis.y.x, basis.z.x, origin.x, basis.x.y, basis.y.y, basis.z.y, origin.y, basis.x.z, basis.y.z, basis.z.z, origin.z).
var instance: RID
var voxel_mesh: RID 
var multimesh: RID

func _init() -> void:
	if Engine.is_editor_hint(): return
	
	
	#RenderingServer.multimesh_set_physics_interpolated(multimesh, true)
	
	
	
	Engine.get_main_loop().node_added.connect(update_scenario.unbind(1), CONNECT_DEFERRED | CONNECT_ONE_SHOT)
	
	
	#RenderingServer.multimesh_set_mesh()


func update_scenario() -> void:
	var scene: Node3D = Engine.get_main_loop().current_scene
	multimesh = RenderingServer.multimesh_create()
	init_voxel_mesh()
	
	RenderingServer.multimesh_set_mesh(multimesh, voxel_mesh)
	RenderingServer.multimesh_allocate_data(multimesh, 1, RenderingServer.MULTIMESH_TRANSFORM_3D,
	false,
	false,
	false)
	#(basis.x.x, basis.y.x, basis.z.x, origin.x, basis.x.y, basis.y.y, basis.z.y, origin.y, basis.x.z, basis.y.z, basis.z.z, origin.z).
	#RenderingServer.multimesh_get_command_buffer_rd_rid()
	var transform: Transform3D = Voxel.new().transform
	var basis: Basis = transform.basis
	var buffer: PackedFloat32Array = [basis.x.x, basis.y.x, basis.z.x, transform.origin.x, basis.x.y, basis.y.y, basis.z.y, transform.origin.y, basis.x.z, basis.y.z, basis.z.z, transform.origin.z]
	RenderingServer.multimesh_set_buffer(multimesh, buffer)
	instance = RenderingServer.instance_create()
	print(RenderingServer.multimesh_get_buffer(multimesh))
	await Engine.get_main_loop().physics_frame
	
	
	RenderingServer.instance_set_scenario(instance, scene.get_world_3d().scenario)
	RenderingServer.instance_set_base(instance, multimesh)
	
	#var world: World3D = Engine.get_main_loop().current_scene.get_world_3d()
	# TODO Dependency injection
	#RenderingServer.instance_set_base(multimesh, world.scenario)
	
	#RenderingServer.instance_set_scenario(multimesh, world.scenario)


func register(voxel: Voxel) -> void:
	#RenderingServer.instance_cre
	pass
	#voxel.mesh = RenderingServer.mesh_create()

func tick(delta: float, pool: Array[Voxel]) -> void:
	pass

func tick_physics(delta: float, pool: Array[Voxel]) -> void:
	pass


func _predelete(pool: Array[Voxel]) -> void:
	pass


#func update_voxel()


func init_voxel_mesh() -> void:
	var mesh:= BoxMesh.new()
	mesh.size = Vector3(SIZE, SIZE, SIZE)
	voxel_mesh = RenderingServer.mesh_create()
	RenderingServer.mesh_add_surface_from_arrays(voxel_mesh, 
	RenderingServer.PRIMITIVE_TRIANGLES, mesh.get_mesh_arrays(),
	)

static func transform_to_buffer(transform: Transform3D) -> PackedFloat32Array:
	return PackedFloat32Array([
		transform.basis.x.x, transform.basis.y.x, transform.basis.z.x, transform.origin.x, 
		transform.basis.x.y, transform.basis.y.y, transform.basis.z.y, transform.origin.y, 
		transform.basis.x.z, transform.basis.y.z, transform.basis.z.z, transform.origin.z
		])
