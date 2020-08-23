# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = 'cards.txt'

    deck = CardGenerator.new(filename)

    assert_instance_of CardGenerator, deck
  end

  def test_it_has_attributes
    filename = 'cards.txt'

    deck = CardGenerator.new(filename)

    assert_equal [], deck.cards
  end

  def test_it_can_create_a_card
    filename = 'cards.txt'

    deck = CardGenerator.new(filename)
    deck.create_cards

    assert_instance_of Card, deck.cards[0]
  end

  def test_it_can_create_52_cards
    filename = 'cards.txt'

    deck = CardGenerator.new(filename)
    deck.create_cards

    assert_equal 52, deck.cards.length
  end
end
