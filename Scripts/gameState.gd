extends Node2D

export var startingLives = 3
export var coins_for_extra_life = 20

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
    global.gui.hurt()
    lives -= 1
    update_gui()
    if lives < 0:
        end_game()

func coin_up():
    global.gui.coin_up()
    coins += 1
    update_gui()
    if coins % coins_for_extra_life == 0:
        lives += 1
        global.gui.life_up()
        update_gui()

func end_game():
    get_tree().change_scene("res://Scenes/gameOver.tscn")