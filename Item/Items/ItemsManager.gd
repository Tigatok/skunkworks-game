extends Node

@onready var drop_table = DropTable.new()
@onready var item_pickup = preload("res://Item/ItemPickup/ItemPickup.tscn")

func _ready():
	drop_table.add_item('blob', preload("res://Item/Items/gray_cannon.tres"), 0.5)

func _on_monster_died(monster)->void:
	#todo remove.
	var item_to_drop = drop_table.drop_data['blob']
	var item_pickup_instance:ItemPickup = item_pickup.instantiate()
	var slot_data = SlotData.new()
	slot_data.item_data = item_to_drop.item
	item_pickup_instance.slot_data = slot_data
	item_pickup_instance.position = monster.position
	monster.get_node('/root/Main').add_child(item_pickup_instance)
