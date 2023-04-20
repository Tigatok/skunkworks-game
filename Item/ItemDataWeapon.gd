class_name ItemDataWeapon extends ItemData

enum WeaponType {
	RANGED,
	MELEE
}

@export var damage:int = 5
@export var weapon_type: WeaponType
@export var projectile_res:Resource
@export var weapon_sound:AudioStreamMP3 = null
var visibility_notifier = VisibleOnScreenNotifier2D.new()
var missile_scene = preload("res://Missile/missile.tscn")

func use(target)->void:
	if not weapon_type == WeaponType.RANGED:
		return
	# If its a ranged weapon, shoot a missle.
	var missile = spawn_missile(target)
	target.get_node("/root/Main").add_child(missile)

func spawn_missile(target) -> Node:
	if not visibility_notifier:
		visibility_notifier = VisibleOnScreenNotifier2D.new()
	var missile_instance:Node = missile_scene.instantiate()
	missile_instance.get_node("Sprite2D").texture = projectile_res.texture
	missile_instance.position = target.position
	missile_instance.position.y -= 50
	missile_instance.damage = damage
	missile_instance.audio_stream_mp3 = weapon_sound
	missile_instance.add_child(visibility_notifier)
	visibility_notifier.connect("screen_exited", Callable(self,"_on_projectile_screen_exited").bind(missile_instance))
	return missile_instance

func _on_projectile_screen_exited(instance):
	instance.queue_free()
