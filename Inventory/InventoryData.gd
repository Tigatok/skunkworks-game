class_name InventoryData extends Resource

@export var slot_datas:Array[SlotData]

signal inventory_updated(inventory_data:InventoryData)
signal inventory_data_updated(slot_index:int)

var active_slot_data

func pick_up_slot_data(slot_data:SlotData) -> bool:
	for index in slot_datas.size():
		if (not slot_datas[index]):
			slot_datas[index] = slot_data
			inventory_updated.emit(self)
			return true
	return false

func set_active_slot_data(slot_index: int) -> void:
	if not slot_datas[slot_index]:
		return
	active_slot_data = slot_datas[slot_index]
	inventory_data_updated.emit(slot_index)
