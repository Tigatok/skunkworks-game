class_name Item

enum ItemType {
	EQUIPMENT,
	GOLD,
	CONSUMABLE
}

var id: int
var itemName: String
var icon: Texture
var type: ItemType

func _init(id:int, itemName:String, icon:Texture, type:ItemType):
	self.id = id
	self.itemName = itemName
	self.icon = icon
	self.type = type
