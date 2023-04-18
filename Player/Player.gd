extends CharacterBody2D

@export var speed: int = 300
@export var player_health: int = 50
@export var inventory_data:InventoryData

@onready var max_size:= player_health

func _ready() -> void:
	PlayerManager.player = self 
	add_to_group("Players")

func handle_move():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	handle_animation_change(input_dir)

func _unhandled_key_input(event):
	var key_pressed:String = event.as_text()
	if (!event.is_action_pressed(key_pressed)):
		return	
	if (key_pressed == "Space"):
		var active_slot_data = get_active_slot_data()
		if not active_slot_data:
			return
		active_slot_data.item_data.use(self)

func get_active_slot_data() -> SlotData:
	if not inventory_data.active_slot_data:
		return
	return inventory_data.active_slot_data

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
