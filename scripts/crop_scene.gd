extends Node2D

signal crop_scene_ready(crop_scene, crop_map)

@export var crop_map: TileMapLayer  # Assign the CropMap in the Inspector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    # Emit signal to notify the Town script when the CropScene is ready
    emit_signal("crop_scene_ready", self, crop_map)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
