extends Area2D

@export var weapon_name = "Cannon"
@export var weapon_icon = preload('res://Weapon/weapon.png')

signal weapon_picked_up

func _ready():
	print("New ", weapon_name)

func _on_body_entered(body):
	var weapon = preload("res://Weapon/weapon.tscn")
	weapon = weapon.instantiate()
	weapon.weaponName = weapon_name
	weapon.weaponIcon = weapon_icon
	body.add_child(weapon)
#	weapon.connect('weapon_picked_up', weapon_picked_up)
	weapon_picked_up.emit(weapon)
	queue_free()
