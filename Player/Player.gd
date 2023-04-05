extends CharacterBody2D

signal coin_picked
signal item_picked_up

@export var speed = 300
@export var weapons = []
@export var playerHealth = 50
@onready var maxSize = playerHealth

func handle_move():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	handle_animation_change(input_dir)

func handle_fire():
	if(!Input.is_action_just_pressed("space")):
		return
	if (!$Weapon):
		return
	# Check for active weapon, or fire all of them.
	var activeWeapon = $Weapon
	activeWeapon.fireWeapon()

func handle_animation_change(input_dir:Vector2):
	if (input_dir.x > 0):
		$AnimatedSprite2D.play("bank")
		$AnimatedSprite2D.flip_h = false
	elif (input_dir.x < 0):
		$AnimatedSprite2D.play("bank")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.flip_h = false

func _physics_process(delta):
	if (playerHealth <= 0):
		dead()
		return
	handle_move()
	handle_fire()
	move_and_collide(velocity * delta)

func dead():
	$AnimatedSprite2D.play("explode")
	$AnimatedSprite2D.animation_finished

	
func takeDamage(damageTaken: int):
	var ratio = float(damageTaken) / float(maxSize)
	var amountToRemove = float(ratio) * float(100)
	$HealthBar/Green.size.x -= amountToRemove
	playerHealth -= damageTaken

func collectCoin():
	print("collected coin")
	coin_picked.emit()

func collectWeapon(weapon):
	print("Collected weapon", weapon)
	item_picked_up.emit(weapon)
