extends Area2D

@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = get_tree().current_scene.get_node("Player")

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	


func _on_timer_timeout() -> void:
	player.position = PlayerData.last_checkpoint
