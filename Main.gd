extends Node

const ItemType = preload("res://Item/Item.gd").ItemType

# Called when the node enters the scene tree for the first time.
func _ready():
	var icon = load("res://Weapon/weapon.png")
	var item = Item.new(0000, 'Cannon', icon, ItemType.EQUIPMENT)
	var itemPickup = load("res://Item/ItemPickup.tscn")
	itemPickup = itemPickup.instantiate()
	itemPickup.item = item
	itemPickup.get_node("ItemIcon").texture = icon
	itemPickup.position.x=500
	itemPickup.position.y=500
	add_child(itemPickup)
	var player = $Player
