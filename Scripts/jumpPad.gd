extends Area2D

func _on_jumpPad_body_entered(body):
    $AnimatedSprite.play('spring')
    $Timer.start()
    global.player.boost_jump()


func _on_Timer_timeout():
    $AnimatedSprite.play('idle')
