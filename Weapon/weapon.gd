extends Node
var weaponName

func fireWeapon():
	print("Firing", weaponName)
	var missile = load("res://Missile/missile.tscn")
	missile = missile.instantiate()
	var parentPosition = get_parent().position
	var position = Vector2(parentPosition.x, parentPosition.y - 40)
	missile.linear_velocity = Vector2(1, (-4 * missile.speed))
	missile.position = position
	get_parent().get_parent().add_child(missile)
