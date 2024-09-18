extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var score_label: Label = $"../Labels/ScoreLabel"

@onready var checkpoint :Vector2 = player.get_position()
var score :int = 0


# Called when the node enters the scene tree for the first time.
func add_point() -> void:
	score += 1
	score_label.text = "Congratulation! You collected " + str(score) + " coins"
	
