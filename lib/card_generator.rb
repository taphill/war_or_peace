# frozen_string_literal: true

require './lib/card'

# This class will read a text file and generate the cards from that file
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
      @cards << Card.new(get_suit(line), get_value(line), get_rank(line))
    end
  end

  private

  def get_suit(line)
    suit(line.scan(/heart|club|diamond|spade/).pop)
  end

  def get_value(line)
    line.scan(/^[\w]*/).pop
  end

  def get_rank(line)
    line.scan(/[0-9][0-9]|[0-9]/).pop.to_i
  end

  def suit(suit)
    return :heart if suit == 'heart'
    return :club if suit == 'club'
    return :diamond if suit == 'diamond'
    return :spade if suit == 'spade'
  end
end
