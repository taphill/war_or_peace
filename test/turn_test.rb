require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test
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
    player1 = Player.new("Megan", [])
    player2 = Player.new("Aurora", [])

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    player1 = Player.new("Megan", [])
    player2 = Player.new("Aurora", [])

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
    assert_equal [], turn.spoils_of_war
  end

  def test_it_has_basic_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_basic)

    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_it_has_war_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_war)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_has_mutually_assured_destruction_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_MAD)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_winner_of_basic_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_basic)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_winner_of_war_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_war)

    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_winner_of_mutually_assured_destruction_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_MAD)

    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_pile_cards_for_basic_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_basic)

    turn = Turn.new(player1, player2)

    turn.pile_cards
    assert_equal [card1, card3], turn.spoils_of_war
  end

  def test_pile_cards_for_war_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_war)

    turn = Turn.new(player1, player2)

    turn.pile_cards
    assert_equal [card1, card2, card5, card4, card3, card6], turn.spoils_of_war
  end

  def test_pile_cards_for_mutually_assured_destruction_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_MAD)

    turn = Turn.new(player1, player2)

    turn.pile_cards
    assert_equal [], turn.spoils_of_war
  end

  def test_award_spoils_to_winner_of_basic_turn
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_basic)

    turn = Turn.new(player1, player2)
    winner = turn.winner

    turn.pile_cards
    assert_equal [card1, card3], turn.spoils_of_war

    turn.award_spoils(winner)
    expected = [card2, card5, card8, card1, card3]

    assert_equal expected, player1.deck.cards
    assert_equal [card4, card6, card7], player2.deck.cards
  end

  def test_award_spoils_to_winner_of_war_turn
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_war)

    turn = Turn.new(player1, player2)
    winner = turn.winner

    turn.pile_cards
    assert_equal [card1, card2, card5, card4, card3, card6], turn.spoils_of_war

    turn.award_spoils(winner)
    expected = [card7, card1, card2, card5, card4, card3, card6]

    assert_equal expected, player2.deck.cards
    assert_equal [card8], player1.deck.cards
  end

  def test_award_spoils_for_mutually_assured_destruction_turn_type
    player1 = Player.new("Megan", deck_default)
    player2 = Player.new("Aurora", deck_MAD)

    turn = Turn.new(player1, player2)
    winner = turn.winner

    turn.pile_cards
    assert_equal "No spoils to award", turn.award_spoils(winner)
    assert_equal [card8], player1.deck.cards
    assert_equal [card7], player2.deck.cards
  end

end