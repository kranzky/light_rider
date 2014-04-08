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

    @square = @game.add.sprite(400, 225, 'square')
    @square.width = 800
    @square.height = 450
    @square.anchor.x = 0.5
    @square.anchor.y = 0.5
    @square.alpha = 0.03

    @photons = @game.add.group()

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 8
    circle.height = 8
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.x = 200
    circle.tint = 0xff0000
    circle.blendMode = Phaser.blendModes.ADD
    circle.checkWorldBounds = true
    circle.events.onOutOfBounds.add (obj)->
      obj.x = 0
    @photons.add(circle)

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 8
    circle.height = 8
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.x = -200
    circle.tint = 0x00ff00
    circle.blendMode = Phaser.blendModes.ADD
    circle.checkWorldBounds = true
    circle.events.onOutOfBounds.add (obj)->
      obj.x = 800
    @photons.add(circle)

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 8
    circle.height = 8
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.y = 200
    circle.tint = 0x0000ff
    circle.blendMode = Phaser.blendModes.ADD
    circle.checkWorldBounds = true
    circle.events.onOutOfBounds.add (obj)->
      obj.y = 0
    @photons.add(circle)

    circle = @game.add.sprite(400, 225, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = 8
    circle.height = 8
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.y = -200
    circle.tint = 0xffff00
    circle.blendMode = Phaser.blendModes.ADD
    circle.checkWorldBounds = true
    circle.events.onOutOfBounds.add (obj)->
      obj.y = 450
    @photons.add(circle)

  render:->
    @buffer.renderXY(@game.stage, 0, 0, false)

  update:->

  destroy:->

  done:=>
    @game.state.start('splash')

LightRider.Arena = Arena
