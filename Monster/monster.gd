extends RigidBody2D

signal monster_died(monster:Node)
@export var health = 20
@export var damage = 5
@onready var player = $"../Player"
@onready var healthBar = $HealthBar
@onready var max_health = health
@onready var health_bar_size = $HealthBar.size.x
@export var move_speed = 100

var totalSize = 100

func _ready():
	add_to_group("Monsters")

func _physics_process(delta):
	moveTowardPlayer(delta)
	
func moveTowardPlayer(delta):
	if (!player):
		return
	var direction = Vector2(player.position - self.position).normalized()
	var amount_to_move = direction * delta * move_speed
	move_and_collide(amount_to_move)

func takeDamage(body):
	var damage_taken = body.damage
	health -= damage_taken
	body.queue_free()
	var remove_amount = float(damage_taken)/float(max_health) * float(health_bar_size)
	$HealthBar/Green.size.x -= remove_amount
	
	print("Hit, health: ", health)
	
	if (health <= 0):
		die()

func die():
	queue_free()
	var coin = load("res://Coin/Coin.tscn")
	coin = coin.instantiate()
	coin.position = self.position
	get_parent().add_child(coin)
	monster_died.emit(self)

func _on_body_entered(body:Node):
	print("S")
	if (body.is_in_group("Projectiles")):
		takeDamage(body)
	if (body.name == "Player"):
		body.takeDamage(damage)
