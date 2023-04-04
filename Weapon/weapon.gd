extends Node
var weaponName
var weaponIcon
var canFire = true
@export var automatedFiring = false
@export var damage = 5

func fireWeapon():
	if (canFire):
		var missile = load("res://Missile/missile.tscn")
		missile = missile.instantiate()
		var parentPosition = get_parent().position
		var position = Vector2(parentPosition.x, parentPosition.y - 40)
		missile.linear_velocity = Vector2(1, (-4 * missile.speed))
		missile.position = position
		missile.damage = damage
		self.add_child(missile)
		$Timer.start($Timer.wait_time)
		canFire = false
	
func _on_timer_timeout():
		canFire = true
