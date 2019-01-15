extends Node2D

func _ready():
    global.gameState = self


func end_game():
    get_tree().change_scene("res://Scenes/gameOver.tscn")