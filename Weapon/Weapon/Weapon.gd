extends Node2D

const ItemType = Item.ItemType

@onready var icon = preload("res://Weapon/weapon.png")
@export var item_id: int
@export var item_name: String
@export var item_icon: Texture
@export var item_type: ItemType

func _ready():
	var item = Item.new(item_id, item_name, item_icon, item_type)
	var item_pickup_instance = $ItemPickup
	item_pickup_instance.item = item
	item_pickup_instance.get_node("ItemIcon").texture = icon
	add_child(item_pickup_instance)
