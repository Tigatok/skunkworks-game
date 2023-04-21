class_name DropTable extends Resource

@export var drop_data = {}

func add_item(monster_id:String, item: ItemData, drop_rate: float) -> void:
	drop_data[monster_id] = {'item': item, 'drop_rate': drop_rate}

func get_drop(monster_id:String):
	for item_id in drop_data[monster_id]:
		if randf() <= drop_data[monster_id]['drop_rate']:
			return drop_data[monster_id]['item']
