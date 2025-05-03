extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%"Main Menu".visible = true

func _on__player_pressed() -> void:
	%"Main Menu".visible = false
	%"Game Modes".visible = true
