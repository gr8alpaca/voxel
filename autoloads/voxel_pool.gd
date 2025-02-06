@icon("res://icons/folder_voxel.png")
extends Node

#region modules
var physics: VoxelPhysics = VoxelPhysics.new()
var renderer: VoxelRenderer = VoxelRenderer.new()

var pool: Array[Voxel]

func register(voxel: Voxel) -> void:
	if not voxel in pool:
		physics.register(voxel)
		renderer.register(voxel)
		pool.push_back(voxel)

func _process(delta: float) -> void:
	physics.tick(delta, pool)
	renderer.tick(delta, pool)

func _physics_process(delta: float) -> void:
	physics.tick_physics(delta, pool)
	renderer.tick_physics(delta, pool)
