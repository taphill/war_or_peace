require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    deck = Deck.new([])

    assert_instance_of Deck, deck
  end

  def test_it_has_attributes
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_instance_of Array, deck.cards
  end

  def it_has_a_size
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 3, deck.size
  end

  def test_it_can_find_the_rank_of_a_card
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_can_find_the_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_it_can_return_precentage_of_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_removes_card_from_top_of_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal card1, deck.remove_card
    assert_equal card2, deck.remove_card
    assert_equal card3, deck.remove_card
    assert deck.cards.empty?
  end

  def test_it_adds_card_to_end_of_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal card3, deck.cards.last

    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    assert_equal card4, deck.cards.last
  end

  def test_adding_and_removing_cards_updates_high_ranking_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
    assert_equal 66.67, deck.percent_high_ranking

    card4 = Card.new(:club, '5', 5)
    deck.add_card(card4)

    assert_equal [card1, card3], deck.high_ranking_cards
    assert_equal 50.0, deck.percent_high_ranking

    card5 = Card.new(:diamond, 'King', 13)
    card6 = Card.new(:club, 'Jack', 11)
    deck.add_card(card5)
    deck.add_card(card6)
    deck.remove_card

    assert_equal 5, deck.cards.size
    assert_equal [card3, card5, card6], deck.high_ranking_cards
    assert_equal 60.0, deck.percent_high_ranking
  end
end