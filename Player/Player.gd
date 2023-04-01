extends Area2D
@export var missile_scene: PackedScene
@export var speed = 400

var screen_size
func _ready():
	screen_size = get_viewport_rect().size

	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	velocity = handleDirection(velocity)
	velocity = normalizeSpeed(velocity)
	handleAnimation(velocity)
	updatePosition(velocity, delta)
	handleInput()

func handleInput():
	if Input.is_action_pressed("space"):
		fireWeapon()

func handleAnimation(velocity: Vector2):
	$AnimatedSprite2D.animation = 'top'
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "side"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0

# Update position based on velocity.
func updatePosition(velocity:Vector2, delta:float):
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
# Normalizes speed, if not exists, diagonal would go faster.
func normalizeSpeed(velocity:Vector2):
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	return velocity

# Handles the direction of movement.
func handleDirection(velocity:Vector2): 
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	return velocity
 
# This function needs to spawn in a missile, and set it to go.
func fireWeapon():
	var missile = missile_scene.instantiate()
	add_child(missile)
