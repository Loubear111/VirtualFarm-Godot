extends Node2D

# References
@export var background_tilemap: TileMapLayer  # TileMap for the background (e.g., grass, soil)
var crop_scenes = []  # Store all CropScenes
var crop_tilemaps = []    # Store all CropMaps

# Crop counts
var crop_counts = {
    "Wheat": 0,
    "Corn": 0
}

# Called when the node is added to the scene
func _ready():
    pass

func _on_crop_scene_ready(crop_scene, crop_map):
    # Register the CropScene and its CropMap
    crop_scenes.append(crop_scene)
    crop_tilemaps.append(crop_map)
    print("Registered CropScene: %s with CropMap: %s" % [crop_scene.name, crop_map.name])

# Handle taps on the map
func _input(event):
    if event is InputEventMouseButton:
        for crop_tilemap in crop_tilemaps:
            crop_tilemap.handle_click(event.position)

# Handle harvested crops
func _on_crop_harvested(crop_type, quantity):
    crop_counts[crop_type] += quantity
    print("Harvested %s x%d" % [crop_type, quantity])


func _on_crops_tilemap_crop_harvested(crop_type: Variant, quantity: Variant) -> void:
    pass # Replace with function body.
