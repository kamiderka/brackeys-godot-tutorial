extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
const swordDamage := 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		animation_player.play("hit")
		animation_player.queue("RESET")



func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body.has_method("take_damage"):
		body.take_damage(swordDamage)
		
