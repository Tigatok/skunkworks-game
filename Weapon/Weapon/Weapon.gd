extends Node2D

const ItemType = Item.ItemType

@export var item_id: int
@export var item_name: String
@export var item_icon: Texture
@export var item_type: ItemType

func _ready():
	var item = Item.new(item_id, item_name, item_icon, item_type)
	var item_pickup_instance = $ItemPickup
	item_pickup_instance.item = item
	item_pickup_instance.get_node("ItemIcon").texture = item_icon
	item.connect('use_item', Callable(self, '_on_use_item'))
#	add_child(item_pickup_instance)

func _on_use_item():
	var missile = load("res://Missile/missile.tscn")
	missile = missile.instantiate()
	missile.linear_velocity = Vector2(1, (-4 * missile.speed))
	missile.position = position
	missile.damage = 5
	self.add_child(missile)
