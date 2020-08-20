require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    assert_instance_of Player, player
  end

  def test_name_method_returns_players_name
    player = Player.new('Clarisa', [])

    assert_equal 'Clarisa', player.name
  end

  def test_deck_method_returns_players_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
  end

  def test_player_loses_when_deck_is_empty
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)

    refute player.has_lost?
    player.deck.remove_card
    refute player.has_lost?
    player.deck.remove_card
    refute player.has_lost?
    player.deck.remove_card
    assert player.has_lost?
    assert player.deck.cards.empty?
  end
end