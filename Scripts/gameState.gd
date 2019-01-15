extends Node2D

export var startingLives = 3
var lives
var coins = 0

func _ready():
    global.gameState = self
    lives = startingLives
    update_gui()

func update_gui():
    global.gui.update_gui(lives, coins)

func hurt():
    global.player.hurt()
    lives -= 1
    update_gui()
    if lives < 0:
        end_game()

func coin_up():
    coins += 1
    update_gui()

func end_game():
    get_tree().change_scene("res://Scenes/gameOver.tscn")