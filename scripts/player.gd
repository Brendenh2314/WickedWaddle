extends CharacterBody2D

# Existing constants and variables
const SPEED = 100.0
const SPEED_UP = 180.0
const SPEED_DOWN = 60.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_speed = SPEED
var direction = 1
var jump_counter = 0
var wall_hit_counter = 0
var game_started = false
var faceplant_fall_height = 250
var start_fall_height = 0
var is_faceplant = false

# Level completion tracking
var level_complete = false

# Achievement-related variables
var level_one_achievement_completed = false

#Signals
signal achievement_completed(level, achievement_name)


func _ready():
	# Connect the level complete signal
	$"/root/NextLevel".connect("next_level_level_complete", Callable(self, "_on_next_level_level_complete"))

func _physics_process(delta):
	if not game_started:
		return # Do not process physics until the game starts

	# Handle faceplant logic
	if is_on_floor():
		var fall_height = position.y - start_fall_height
		if fall_height > faceplant_fall_height:
			print("faceplant")
			is_faceplant = true
			velocity.x = 0
			velocity.y = 0
			$AnimatedSprite2D.play("faceplant")
		start_fall_height = position.y
	else:
		if position.y < start_fall_height:
			start_fall_height = position.y
		
	if is_faceplant:
		if Input.is_action_pressed("ui_speed_up") or Input.is_action_pressed("ui_speed_down"):
			is_faceplant = false
			animated_sprite_2d.play("run")
			print("Movement resumed")
		return

	# Add gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump logic
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_counter += 1

	# Adjust speed
	if Input.is_action_pressed("ui_speed_up"):
		current_speed = SPEED_UP 
	elif Input.is_action_pressed("ui_speed_down"):
		current_speed = SPEED_DOWN 
	else:
		current_speed = SPEED

	# Apply movement and handle collisions
	velocity.x = float(direction * current_speed) if not is_faceplant else 0.0
	move_and_slide()

	# Check for wall collisions and reverse direction
	if is_on_wall():
		direction = -direction
		$AnimatedSprite2D.flip_h = direction == -1
		wall_hit_counter += 1

	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
		

func get_jump_counter():
	return jump_counter

func get_wall_hit_counter():
	return wall_hit_counter

func _input(delta):
	if Input.is_action_just_pressed("ui_start") and not game_started:
		game_started = true  # Start the game when the correct button is pressed

func _on_next_level_level_complete():
	if jump_counter < 15:
		emit_signal("achievement_completed", 1, "Complete Level 1 with < 15 Jumps")
		level_one_achievement_completed = true
		print("Level 1 Achievement Completed")
	else:
		print("Level completed, but jump count exceeded the limit.")
