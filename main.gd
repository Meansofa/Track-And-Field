extends Node2D

@export var background_music : AudioStream
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio_player = AudioStreamPlayer.new()
	
	audio_player.stream = background_music
	audio_player.bus = "Music"
	add_child(audio_player)
	
	# Step 5: Play the audio
	audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
