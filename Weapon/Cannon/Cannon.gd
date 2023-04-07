extends Node2D

const ItemType = Item.ItemType

@onready var icon = preload("res://Weapon/weapon.png")
@onready var item = Item.new(0000, 'Cannon', icon, ItemType.EQUIPMENT)

func _ready():
	var item_pickup_instance = $ItemPickup
	item_pickup_instance.item = item
	item_pickup_instance.get_node("ItemIcon").texture = icon
	add_child(item_pickup_instance)
