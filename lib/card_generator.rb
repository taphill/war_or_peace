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

      @cards << Card.new(get_suit(line), get_value(line), get_rank(line))
    end
  end

private

  def get_suit(line)
    set_suit(line.scan(/heart|club|diamond|spade/).pop)
  end

  def get_value(line)
    line.scan(/^[\w]*/).pop
  end

  def get_rank(line)
    line.scan(/[0-9][0-9]|[0-9]/).pop.to_i
  end

  def set_suit(suit)
    return :heart if suit == "heart"
    return :club if suit == "club"
    return :diamond if suit == "diamond"
    return :spade if suit == "spade"
  end

end