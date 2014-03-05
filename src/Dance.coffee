RockVomit = window.RockVomit

class Dance extends Phaser.State
  constructor:->

  preload:->

  create:->
    @game.stage.backgroundColor = '#000055'

  update:->

  destroy:->

  done:=>
    @game.state.start('splash')

RockVomit.Dance = Dance
