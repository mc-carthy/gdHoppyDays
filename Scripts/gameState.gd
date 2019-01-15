extends Node2D

export var startingLives = 3
var lives

func _ready():
    global.gameState = self
    lives = startingLives
    update_gui()

func update_gui():
    global.gui.update_gui(lives)

func hurt():
    global.player.hurt()
    lives -= 1
    update_gui()
    if lives < 0:
        end_game()

func end_game():
    get_tree().change_scene("res://Scenes/gameOver.tscn")