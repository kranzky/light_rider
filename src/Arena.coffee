LightRider = window.LightRider

class Arena extends Phaser.State
  constructor:->

  preload:->

  create:->
    @game.stage.backgroundColor = '#000000'

    @buffer = @game.add.renderTexture(800, 450, 'buffer')

    @screen = @game.add.sprite(400, 225, @buffer)
    @screen.anchor.x = 0.5
    @screen.anchor.y = 0.5

    @circle = @game.add.sprite(400, 225, 'circle')
    @circle.width = 24
    @circle.height = 24
    @circle.anchor.x = 0.5
    @circle.anchor.y = 0.5

    @square = @game.add.sprite(400, 225, 'square')
    @square.width = 800
    @square.height = 450
    @square.anchor.x = 0.5
    @square.anchor.y = 0.5
    @square.alpha = 0.05

  render:->
    @buffer.renderXY(@game.stage, 0, 0, false)

  update:->
    @circle.x += 6
    @circle.x %= 800

  destroy:->

  done:=>
    @game.state.start('splash')

LightRider.Arena = Arena
