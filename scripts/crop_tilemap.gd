extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
    
func handle_click(eventPos: Vector2i):
    # Plant the crop in the given cell
    var localPos = self.to_local(eventPos)
    var mapPos = self.local_to_map(localPos)
    var data = self.get_cell_tile_data(mapPos)
    if data != null and data.get_custom_data("state") == "plantable":
        self.set_cell(mapPos, 0, Vector2i(0,3))
