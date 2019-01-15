extends Node2D

export var startingLives = 3
var lives

func _ready():
    global.gameState = self
    lives = startingLives

func hurt():
    global.player.hurt()
    lives -= 1
    if lives < 0:
        end_game()

func end_game():
    get_tree().change_scene("res://Scenes/gameOver.tscn")