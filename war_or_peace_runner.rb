require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/start_game'
require './lib/card_generator'

filename = "cards.txt"

deck = CardGenerator.new(filename)
deck.create_cards

shuffled_deck = deck.cards.shuffle

deck_1 = Deck.new(shuffled_deck.slice(0..25))
deck_2 = Deck.new(shuffled_deck.slice(26..51))

player1 = Player.new("Megan", deck_1)
player2 = Player.new("Aurora", deck_2)

start_game = StartGame.new(player1, player2)
start_game.start