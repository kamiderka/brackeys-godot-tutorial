extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300

@onready var sword: Area2D = $Sword
@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D

func start():
	PlayerData.last_checkpoint = self.position
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if direction:
			player_sprite.play("run")
		else:
			player_sprite.play("idle")
	else:
		player_sprite.play("jump")

	if direction:
		if direction > 0:
			player_sprite.flip_h = false
			sword.set_left = false
			
		else:
			player_sprite.flip_h = true
			sword.set_left = true
			
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
