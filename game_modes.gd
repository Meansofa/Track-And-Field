extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_meter_dash_pressed() -> void:
	%"Scene Transition".visible = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://100_meter_dash.tscn")


func _on_meter_hurdles_pressed() -> void:
	%"Scene Transition".visible = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://110_meter_hurdles.tscn")
