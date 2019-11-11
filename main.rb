require './players'
require './questions'
require './game'

player1 = Player.new('Player 1', 'P1')
player2 = Player.new('Player 2', 'P2')

game = Game.new(player1, player2)

game.run
