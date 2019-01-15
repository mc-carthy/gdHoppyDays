extends CanvasLayer

func _ready():
    global.gui = self

func update_gui(lives, coins):
    $banner/HBoxContainer/lifeCount.text = str(lives)
    $banner/HBoxContainer/coinCount.text = str(coins)