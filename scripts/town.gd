extends Node2D

# References
@export var background_tilemap: TileMapLayer  # TileMap for the background (e.g., grass, soil)
@export var crops_tilemap: TileMapLayer  # TileMap for crops

# Crop counts
var crop_counts = {
	"Wheat": 0,
	"Corn": 0
}

# Called when the node is added to the scene
func _ready():
	pass

# Handle taps on the map
func _input(event):
	if event is InputEventMouseButton:
		#var tile_pos = crops_tilemap.world_to_map(event.position)
		var localPos = crops_tilemap.to_local(event.position)
		var mapPos = crops_tilemap.local_to_map(localPos)
		var data = crops_tilemap.get_cell_tile_data(mapPos)
		if data != null and data.get_custom_data("state") == "plantable":
			crops_tilemap.set_cell(mapPos, 0, Vector2i(0,3))  # Set the tile to the growth stage

# Handle harvested crops
func _on_crop_harvested(crop_type, quantity):
	crop_counts[crop_type] += quantity
	print("Harvested %s x%d" % [crop_type, quantity])


func _on_crops_tilemap_crop_harvested(crop_type: Variant, quantity: Variant) -> void:
	pass # Replace with function body.
