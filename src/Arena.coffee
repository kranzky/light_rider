LightRider = window.LightRider

class Arena extends Phaser.State
  constructor:->

  preload:->

  create:->
    @game.stage.backgroundColor = '#000055'

  update:->

  destroy:->

  done:=>
    @game.state.start('splash')

LightRider.Arena = Arena
