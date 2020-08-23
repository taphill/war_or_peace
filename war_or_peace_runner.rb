# frozen_string_literal: true

require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/start_game'
require './lib/card_generator'

filename = 'cards.txt'

deck = CardGenerator.new(filename)
deck.create_cards

shuffled_deck = deck.cards.shuffle

deck1 = Deck.new(shuffled_deck.slice(0..25))
deck2 = Deck.new(shuffled_deck.slice(26..51))

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)

start_game = StartGame.new(player1, player2)
start_game.start
