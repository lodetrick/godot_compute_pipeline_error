extends Node2D

var rd: RenderingDevice
var pipeline: RID
var shader_rid: RID

func _ready():
	init_rd()

# Called when the node enters the scene tree for the first time.
func init_rd():
	rd = RenderingServer.create_local_rendering_device()
	# Load GLSL shader
	var shader_file: RDShaderFile = load("res://compute.glsl")
	var shader_spirv: RDShaderSPIRV = shader_file.get_spirv()
	shader_rid = rd.shader_create_from_spirv(shader_spirv)
	# Create a compute pipeline
	pipeline = rd.compute_pipeline_create(shader_rid)
