extends PanelContainer

@export var button_click : AudioStream

func _play_click_sound():
	var audio_player = AudioPlayerFunctions.new()
	add_child(audio_player)
	audio_player.play_sound(button_click)

func _on_meter_dash_pressed() -> void:
	_play_click_sound()
	%"Scene Transition".visible = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://100_meter_dash.tscn")


func _on_meter_hurdles_pressed() -> void:
	_play_click_sound()
	%"Scene Transition".visible = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://110_meter_hurdles.tscn")
