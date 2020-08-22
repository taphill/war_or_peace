require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"

    deck = CardGenerator.new(filename)

    assert_instance_of CardGenerator, deck
  end

  def test_it_has_attributes
    filename = "cards.txt"

    deck = CardGenerator.new(filename)
  
    assert_equal [], deck.cards
  end
end