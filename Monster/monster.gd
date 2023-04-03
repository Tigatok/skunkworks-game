extends Area2D

@export var health = 20

signal damaged
var damageTaken
var totalSize = 100

func _ready():
	var healthBar = $HealthBar
	
func _on_body_entered(body):
	damageTaken = body.damage
	health -= damageTaken
	body.queue_free()
	damaged.emit()
	print("Hit, health: ", health)
	if (health <= 0):
		queue_free()


func _on_damaged():
	var xRemove = totalSize / damageTaken
	$HealthBar/Green.size.x -= xRemove
