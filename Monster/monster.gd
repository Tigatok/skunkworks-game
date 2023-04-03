extends RigidBody2D

@export var health = 20
@export var damage = 5
@onready var player = $"../Player"
@onready var healthBar = $HealthBar

signal damaged

var damageTaken
var totalSize = 100

func _on_damaged():
	var xRemove = totalSize / damageTaken
	$HealthBar/Green.size.x -= xRemove

func _physics_process(delta):
	#move_and_collide(Vector2(player.position).normalized())
	moveTowardPlayer(delta)
#	if (!$Weapon):
#		return
#	# Check for active weapon, or fire all of them.
#	var activeWeapon = $Weapon
#	activeWeapon.fireWeapon()
	
func moveTowardPlayer(delta):
	if (!player):
		return
	var direction = Vector2(player.position - self.position)
	var moveSpeed = direction * delta * 0.4
	move_and_collide(moveSpeed)

func takeDamage(body):
	damageTaken = body.damage
	health -= damageTaken
	body.queue_free()
	damaged.emit()
	print("Hit, health: ", health)
	if (health <= 0):
		queue_free()


func _on_body_entered(body):
	if (body.name == "Missile"):
		takeDamage(body)
	if (body.name == "Player"):
		body.takeDamage(damage)
