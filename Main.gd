extends Node

@onready var player = $Player
@onready var inventory_interface:InventoryInterface = $UI/InventoryInterface
@onready var monster = preload("res://Monster/monster.tscn")
@onready var spawn_path = $SpawnPath

var monsters = []

func _ready() ->void:
	inventory_interface.set_player_inventory_data(player.inventory_data)

func _on_game_timer_timeout():
	if  monsters.size() > 10:
		return
	var new_monster:RigidBody2D = monster.instantiate()
	var random_point = get_random_point_on_path(spawn_path)
#	new_monster.position = random_point
	new_monster.connect("monster_died", Callable(self, '_on_monster_died'))
	monsters.append(new_monster)
	add_child(new_monster)

func _on_monster_died(monster:Node):
	var index = monsters.find(monster)
	monsters.remove_at(index)

func get_random_point_on_path(path2D: Path2D) -> Vector2:
	# Get a random offset along the baked path
	var random_offset = randf() * path2D.curve.get_baked_length()
	print("R", random_offset)
	# Interpolate the baked curve at the random offset
#	var random_point = path2D.curve.interpolate_baked(random_offset)
	
	return random_point
