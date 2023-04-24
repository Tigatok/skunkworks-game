extends Node

@onready var player = $Player
@onready var inventory_interface:InventoryInterface = $UI/InventoryInterface
@onready var monster = preload("res://Monster/monster.tscn")
@onready var spawn_path = $SpawnPath

var monsters = []

func _ready() ->void:
	inventory_interface.set_player_inventory_data(player.inventory_data)

func _on_game_timer_timeout():
	if  monsters.size() > 20:
		return
	var new_monster:Monster = monster.instantiate()
	var safe_range = 1200
	new_monster.position = player.position + Vector2(safe_range, 0).rotated(randf_range(0, 2*PI))
	new_monster.monster_id = 'blob'
	new_monster.connect("monster_died", Callable(self, '_on_monster_died'))
	monsters.append(new_monster)
	add_child(new_monster)

func _on_monster_died(monster:Node):
	var index = monsters.find(monster)
	monsters.remove_at(index)

func get_random_point_on_path(path2D: Path2D) -> Vector2:
	# Get a random offset along the baked path
	var baked_length = path2D.curve.get_baked_length()
	var random_offset = randf() * path2D.curve.get_baked_length()
	# Interpolate the baked curve at the random offset
	var random_point = path2D.curve.sample_baked(random_offset)
	return random_point
