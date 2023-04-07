class_name Item extends Node2D

enum ItemType {
	EQUIPMENT,
	GOLD,
	CONSUMABLE
}

signal use_item

@export var id: int
@export var item_name: String
@export var icon: Texture
@export var type: ItemType

#func _ready(id:int, item_name:String, icon:Texture, type:ItemType):
#	self.id = id
#	self.item_name = item_name
#	self.icon = icon
#	self.type = type

# Emit a signal so that whatever the item actually is, can handle it.
func use():
#	emit_signal('use_item')
	print("TE")

func _ready():
	var item_pickup_instance = $ItemPickup
	item_pickup_instance.get_node("ItemIcon").texture = icon


#const ItemType = Item.ItemType
#
#@export var item_id: int
#@export var item_name: String
#@export var item_icon: Texture
#@export var item_type: ItemType
#
#func _ready():
#	var item = Item.new(item_id, item_name, item_icon, item_type)
#	var item_pickup_instance = $ItemPickup
#	item_pickup_instance.item = item
#	item_pickup_instance.get_node("ItemIcon").texture = item_icon
#	item.connect('use_item', Callable(self, '_on_use_item'))
##	add_child(item_pickup_instance)
#
#func _on_use_item():
#	var missile = load("res://Missile/missile.tscn")
#	missile = missile.instantiate()
#	missile.linear_velocity = Vector2(1, (-4 * missile.speed))
#	missile.position = position
#	missile.damage = 5
#	self.add_child(missile)
