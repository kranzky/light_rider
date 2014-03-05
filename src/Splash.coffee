RockVomit = window.RockVomit

class Splash extends Phaser.State
  constructor:->

  create:->
    @game.stage.backgroundColor = '#FFFFFF'

    @labs = @game.add.sprite(@game.world.centerX, @game.world.centerY, 'labs')
    @labs.body = null
    @labs.scale.setTo(0.4, 0.4)
    @labs.anchor.setTo(0.5, 0.5)
    @labs.alpha = 0

    fade_in = @game.add.tween(@labs)
    fade_in.to({ alpha: 1 }, 1000, Phaser.Easing.Linear.None, false)

    fade_out = @game.add.tween(@labs)
    fade_out.to({ alpha: 0 }, 1000, Phaser.Easing.Linear.None, false)

    fade_in.onComplete.addOnce(=> fade_out.start())
    fade_out.onComplete.addOnce(@done)

    fade_in.start()

  destroy:->
    destroy(@labs)

  done:=>
    @game.state.start('dance')

RockVomit.Splash = Splash
