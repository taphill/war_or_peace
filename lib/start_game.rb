require './lib/turn'

class StartGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_number = 0
  end

  def start
    #intro
    #user_ready?
    turn
    # "*~*~*~* #{} has won the game! *~*~*~*"
  end

private

  def intro
    puts "\nWelcome to War! (or Peace) This game will be played with 52 cards.
    The players today are #{@player1.name} and #{@player2.name}.
    Type 'GO' to start the game!
    ------------------------------------------------------------------"
  end

  def user_ready?
    user_input = gets.chomp

    if user_input.upcase == 'GO'
      nil
    else
      puts "Type 'GO' if you're ready!"
    end
  end

  def turn
    until player_deck_empty? || @turn_number == 20
      turn = Turn.new(@player1, @player2)      
      @turn_number += 1
#require 'pry'; binding.pry if turn.type == :war
      turn.pile_cards
require 'pry'; binding.pry if turn.type == :war
      turn_console_message(turn)
      turn.award_spoils(turn.winner) unless turn.winner == 'No Winner'
    end
  end
  
  def turn_console_message(turn)
    print "\nTurn #{@turn_number}: "

    if turn.type == :basic
      print "#{turn.winner.name} "
    elsif turn.type == :war
      print "WAR - #{turn.winner.name} "
    elsif turn.type == :mutually_assured_destruction
      return print "*mutually assured destruction* 6 cards removed from play"
    else
      print "ERROR"
    end

    print "won #{turn.spoils_of_war.length} #{turn.type}"
    print " ------- #{@player1.name} deck = #{@player1.deck.cards.size} +++ #{@player2.name} deck = #{@player2.deck.cards.size}"
  end

  def player_deck_empty?
    @player1.deck.cards.empty? || @player2.deck.cards.empty?
  end

end