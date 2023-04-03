extends Area2D

@export var weapon_name = "Cannon"

func _on_body_entered(body):
	var weapon = load("res://Weapon/weapon.tscn")
	weapon = weapon.instantiate()
	weapon.weaponName = weapon_name
	body.add_child(weapon)
	queue_free()
