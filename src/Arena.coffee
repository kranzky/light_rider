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

    @photons = @game.add.group()

    @square = @game.add.sprite(400, 225, 'square')
    @square.width = 800
    @square.height = 450
    @square.anchor.x = 0.5
    @square.anchor.y = 0.5
    @square.alpha = 0.05

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 24
    circle.height = 24
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.x = 200
    @photons.add(circle)

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 24
    circle.height = 24
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.x = -200
    @photons.add(circle)

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 24
    circle.height = 24
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.y = 200
    @photons.add(circle)

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 24
    circle.height = 24
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.y = -200
    @photons.add(circle)

  render:->
    @buffer.renderXY(@game.stage, 0, 0, false)

  update:->

  destroy:->

  done:=>
    @game.state.start('splash')

LightRider.Arena = Arena
