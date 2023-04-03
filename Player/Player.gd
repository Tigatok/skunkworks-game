extends CharacterBody2D

@export var speed = 300
@export var weapons = []

func handle_move():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	handle_animation_change(input_dir)

func handle_fire():
	if(!Input.is_action_just_pressed("space")):
		return
	var hasWeaponEquipped = weapons.size() > 0
	print("S", weapons)
	if (!hasWeaponEquipped):
		return;
	# Check for active weapon, or fire all of them.
	var activeWeapon = weapons[0]
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
	handle_move()
	handle_fire()
	move_and_collide(velocity * delta)
