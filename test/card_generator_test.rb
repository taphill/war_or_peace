require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"

    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_it_can_read_file
    filename = "cards.txt"

    cards = CardGenerator.new(filename)
  
    cards.create_cards
  end
end