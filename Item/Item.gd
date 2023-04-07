class_name Item extends Node

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

func _init(id:int, item_name:String, icon:Texture, type:ItemType):
	self.id = id
	self.item_name = item_name
	self.icon = icon
	self.type = type

# Emit a signal so that whatever the item actually is, can handle it.
func use():
	emit_signal('use_item')
