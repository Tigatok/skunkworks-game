extends Node

const ItemType = Item.ItemType

@onready var icon = preload("res://Weapon/weapon.png")
@onready var item_pickup:PackedScene = preload("res://Item/ItemPickup/ItemPickup.tscn")

@onready var item = Item.new(0000, 'Cannon', icon, ItemType.EQUIPMENT)
func _ready() -> void:
	var item_pickup_instance = item_pickup.instantiate()
	item_pickup_instance.item = item
	item_pickup_instance.get_node("ItemIcon").texture = icon
	item_pickup_instance.position.x=500
	item_pickup_instance.position.y=500
	add_child(item_pickup_instance)
