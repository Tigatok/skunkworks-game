class_name Item extends Node

enum ItemType {
	EQUIPMENT,
	GOLD,
	CONSUMABLE
}

@export var id: int
@export var item_name: String
@export var icon: Texture
@export var type: ItemType

func _init(id:int, item_name:String, icon:Texture, type:ItemType):
	self.id = id
	self.item_name = item_name
	self.icon = icon
	self.type = type
