require './lib/card'

class CardGenerator
  attr_reader :cards

  def initialize(file)
    @file = file
    @cards = []
  end

  def create_cards
    File.open(@file).each do |line|
      next if line.chop.empty?
      line.downcase

      suit = line.scan(/heart|club|diamond|spade/).pop
      value = line.scan(/^[\w\-]+/).pop
      rank = line.scan(/[0-9][0-9]|[0-9]/).pop.to_i

      @cards << Card.new(set_suit(suit), value, rank)
    end
require 'pry'; binding.pry
  end

private

  def set_suit(suit)
    return :heart if suit == "heart"
    return :club if suit == "club"
    return :diamond if suit == "diamond"
    return :spade if suit == "spade"
  end

  def set_value(value)

  end

  def set_rank(rank)

  end

end