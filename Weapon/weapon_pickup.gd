extends Area2D

@export var weapon_name = "Cannon"

func _on_body_entered(body):
	var weapon = load("res://Weapon/weapon.tscn")
	weapon = weapon.instantiate()
	body.weapons.append(weapon)
	queue_free()
