extends Area2D
@export var speed = 400
var damage
@export var audio_stream_mp3:AudioStreamMP3

func _ready():
#	set_as_top_level(true)
	add_to_group("Projectiles")
	if not audio_stream_mp3:
		return
	play_sound()

func play_sound()->void:
	$AudioStreamPlayer2D.stream = audio_stream_mp3
	$AudioStreamPlayer2D.play()

func _physics_process(delta):
	position.y -= delta * speed

# Missile has entered a body
func _on_body_entered(body:Node):
	print("Sasdasd", body.name)
	if not body.is_in_group("Monsters"):
		return
	body.takeDamage(self)
	queue_free()
