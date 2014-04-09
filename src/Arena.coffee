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

    key = @game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR)
    key.onDown.add(@_split)
    @game.input.onTap.add(@_split)

  render:->
    @buffer.renderXY(@game.stage, 0, 0, false)

  update:->
    @_init() if @photons.countLiving() < 4

  destroy:->

  done:=>
    @game.state.start('splash')

  _init:->
    @_addPhoton(64, 400, 225, 100, 0, 0xff0000)
    @_addPhoton(64, 400, 225, -100, 0, 0x00ff00)
    @_addPhoton(64, 400, 225, 0, 100, 0xff00ff)
    @_addPhoton(64, 400, 225, 0, -100, 0x00ffff)

  _split:=>
    return if @photons.countLiving() > 512
    spawn = [] 
    @photons.forEach (photon)=>
      data =
        r: photon.width
        x: photon.x
        y: photon.y
        vx: photon.body.velocity.x
        vy: photon.body.velocity.y
        colour: photon.tint
      spawn.push(data)
    for data in spawn
      @_addPhoton(data.r * 0.5, data.x, data.y, data.vy, data.vx, data.colour)
      @_addPhoton(data.r * 0.5, data.x, data.y, -data.vy, -data.vx, data.colour)

  _addPhoton:(r, x, y, vx, vy, colour)->
    r = 16 if r < 16
    photon = @game.add.sprite(x, y, 'circle')
    @game.physics.enable(photon, Phaser.Physics.ARCADE)
    photon.width = r
    photon.height = r
    photon.anchor.x = 0.5
    photon.anchor.y = 0.5
    photon.body.velocity.x = vx
    photon.body.velocity.y = vy
    photon.tint = colour
    photon.blendMode = Phaser.blendModes.SCREEN
    fade = @game.add.tween(photon)
    fade.to({ alpha: 0 }, 5000, Phaser.Easing.Linear.None, true)
    fade.onComplete.add (obj)=>
      obj.destroy()
    photon.checkWorldBounds = true
    photon.events.onOutOfBounds.add (obj)=>
      @photons.remove(obj)

    @photons.add(photon)

  _wrap:(photon)->
    if photon.x > 800 && photon.body.velocity.x > 0
      photon.x = -photon.width
    if photon.x < 0 && photon.body.velocity.x < 0
      photon.x = 800 + photon.width
    if photon.y > 450 && photon.body.velocity.y > 0
      photon.y = -photon.height
    if photon.y < 0 && photon.body.velocity.y < 0
      photon.y = 450 + photon.height

LightRider.Arena = Arena
