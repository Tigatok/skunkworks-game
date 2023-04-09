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

# Emit a signal so that whatever the item actually is, can handle it.
func use():
	pass
#	emit_signal('use_item')
#	var missile = load("res://Missile/missile.tscn")
#	missile = missile.instantiate()
#	missile.linear_velocity = Vector2(1, (-4 * missile.speed))
#	missile.position = get_parent().position + Vector2(0, -45)
#	missile.damage = 5
#	self.add_child(missile)

func _ready():
	var item_pickup_instance = $ItemPickup
	item_pickup_instance.get_node("ItemIcon").texture = icon
