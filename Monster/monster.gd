extends Area2D

@export var health = 20
@onready var player = $"../Player"
@onready var healthBar = $HealthBar

signal damaged

var damageTaken
var totalSize = 100
	
func _on_body_entered(body):
	takeDamage(body)

func _on_damaged():
	var xRemove = totalSize / damageTaken
	$HealthBar/Green.size.x -= xRemove

func _physics_process(delta):
	moveTowardPlayer(delta)

func moveTowardPlayer(delta):
	var direction = Vector2(player.position - self.position)
	var moveSpeed = direction * delta * 0.04
	position += moveSpeed

func takeDamage(body):
	damageTaken = body.damage
	health -= damageTaken
	body.queue_free()
	damaged.emit()
	print("Hit, health: ", health)
	if (health <= 0):
		queue_free()
