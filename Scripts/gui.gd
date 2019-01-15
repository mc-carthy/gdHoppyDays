extends CanvasLayer

func _ready():
    global.gui = self

func update_gui(lives):
    $banner/HBoxContainer/lifeCount.text = str(lives)