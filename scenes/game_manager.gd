extends Node2D

var score = 0

@onready var score_label: Label = $"../Labels/ScoreLabel"

# Called when the node enters the scene tree for the first time.
func add_point() -> void:
	score += 1
	score_label.text = "Congratulation! You collected " + str(score) + " coins"
	
