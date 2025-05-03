extends CharacterBody2D


@export var MAXIMUM_SPEED = 500.0
@export var ACCELERATION = 1000.0 #how fast the velocity increases to maximum speed 
@export var FRICTION = 80.0 #how fast the velocity decreases to 0 
@export var JUMP_VELOCITY = -250.0

@export var can_run : bool = true
@export var can_jump : bool = true


@export var player_animation : AnimatedSprite2D


var game_start : bool

func _ready() -> void:
	game_start = true

func _physics_process(delta: float) -> void:
	if not game_start:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and can_jump:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor() and can_run:
		if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
			velocity.x = move_toward(velocity.x, MAXIMUM_SPEED * 1, ACCELERATION * delta)
		else:
			velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		
	
	change_animation()
	move_and_slide()

func change_animation():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			player_animation.play("roll")
			player_animation.speed_scale = 1
		else:
			if (player_animation.animation == "roll" or player_animation.animation == "trip" or player_animation.animation == "win")  and  player_animation.is_playing():
				return
			if velocity.x > 0:
				player_animation.play("running")
			elif not player_animation.animation == "trip":
				player_animation.play("default")
			player_animation.speed_scale = velocity.x / 100 + 1

func trip():
	player_animation.play("trip")
	player_animation.speed_scale = 1

func win():
	await get_tree().create_timer(0.5).timeout
	player_animation.play("win")
	velocity.x = 0
	await player_animation.animation_finished
	game_start = false
	player_animation.play("default")
	player_animation.flip_h = true
