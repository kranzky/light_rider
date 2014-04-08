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
    @square.alpha = 0.045

    @photons = @game.add.group()
    @_addPhoton(128, 400, 225, 200, 0, 0xff0000)
    @_addPhoton(128, 400, 225, -200, 0, 0x00ff00)
    @_addPhoton(128, 400, 225, 0, 200, 0x0000ff)

    key = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)
    key.onDown.add(@_split)
    @game.input.onTap.add(@_split)

  render:->
    @buffer.renderXY(@game.stage, 0, 0, false)

  update:->

  destroy:->

  done:=>
    @game.state.start('splash')

  _split:=>
    console.log(@photons)

  _addPhoton:(r, x, y, vx, vy, colour)->
    circle = @game.add.sprite(x, y, 'circle')
    @game.physics.enable(circle, Phaser.Physics.ARCADE)
    circle.width = r
    circle.height = r
    circle.anchor.x = 0.5
    circle.anchor.y = 0.5
    circle.body.velocity.x = vx
    circle.body.velocity.y = vy
    circle.tint = colour
    circle.blendMode = Phaser.blendModes.SCREEN
    circle.checkWorldBounds = true
    circle.events.onOutOfBounds.add (obj)->
      if vx > 0
        obj.x = -r
      if vx < 0
        obj.x = 800 + r
      if vy > 0
        obj.y = -r
      if vy < 0
        obj.y = 450 + r

    @photons.add(circle)

LightRider.Arena = Arena
