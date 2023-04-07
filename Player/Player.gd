extends CharacterBody2D

#signal coin_picked

@export var speed: int = 300
@export var player_health: int = 50

@onready var max_size:= player_health
@onready var inventory: Inventory = Inventory.new()
@onready var inventory_bar: InventoryBar = $"../InventoryBar"
@onready var active_item: Item = null

func _ready() -> void:
	add_to_group("Players")
	inventory.connect('inventory_updated', Callable(inventory_bar, '_on_inventory_inventory_updated'))
	inventory_bar.connect("update_active_item", Callable(self, "_on_update_active_item"))
	
func handle_move():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	handle_animation_change(input_dir)

func _unhandled_key_input(event):
	var key_pressed:String = event.as_text()
	if (!event.is_action_pressed(key_pressed)):
		return	
	if (key_pressed == 'Space'):
		handle_use()
		

func handle_use():
	if (!active_item):
		return
	active_item.use()
	pass
#func handle_fire():
#	if(!Input.is_action_just_pressed("space")):
#		return
#	if (!$Weapon):
#		return
#	# Check for active weapon, or fire all of them.
#	var activeWeapon = $Weapon
#	activeWeapon.fireWeapon()

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
	if (player_health <= 0):
		dead()
		return
	handle_move()
	move_and_collide(velocity * delta)
	
func dead():
	$AnimatedSprite2D.play("explode")
	$AnimatedSprite2D.animation_finished

	
func takeDamage(damage_taken: int):
	var ratio = float(damage_taken) / float(max_size)
	var amount_to_remove = float(ratio) * float(100)
	$HealthBar/Green.size.x -= amount_to_remove
	player_health -= damage_taken

func pick_up_item(item):
	inventory.add_item(item)

func _on_update_active_item(item):
	print("New item for meee")
	active_item = item
