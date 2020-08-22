require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/start_game'

class StartGameTest < Minitest::Test
  extend Minitest::Spec::DSL

  let(:card1) { Card.new(:heart, 'Jack', 11) }
  let(:card2) { Card.new(:heart, '10', 10) }
  let(:card3) { Card.new(:heart, '9', 9) }
  let(:card4) { Card.new(:diamond, 'Jack', 11) }
  let(:card5) { Card.new(:heart, '8', 8) }
  let(:card6) { Card.new(:diamond, 'Queen', 12) }
  let(:card7) { Card.new(:heart, '3', 3) }
  let(:card8) { Card.new(:diamond, '2', 2) }
  let(:card9) { Card.new(:diamond, '8', 8) }

  # Default deck for player1
  let(:deck_default) { Deck.new([card1, card2, card5, card8]) }

  # Use this deck to start a basic turn
  let(:deck_basic) { Deck.new([card3, card4, card6, card7]) }

  # Use this deck to start a war turn
  let(:deck_war) { Deck.new([card4, card3, card6, card7]) }

  # Use this deck to start a mutually assured destruction turn
  let(:deck_MAD) { Deck.new([card4, card3, card9, card7]) }


  def test_it_exists
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_basic)

    start_game = StartGame.new(player1, player2)
    
    assert_instance_of StartGame, start_game
  end

  def test_it_can_start
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_basic)

    start_game = StartGame.new(player1, player2)

    start_game.start
    
    assert_instance_of StartGame, start_game

  end

end