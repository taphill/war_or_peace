require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/start_game'

# Hearts
card_1 = Card.new(:heart, 'Two', 2)
card_2 = Card.new(:heart, 'Three', 3)
card_3 = Card.new(:heart, 'Four', 4)
card_4 = Card.new(:heart, 'Five', 5)
card_5 = Card.new(:heart, 'Six', 6)
card_6 = Card.new(:heart, 'Seven', 7)
card_7 = Card.new(:heart, 'Eight', 8)
card_8 = Card.new(:heart, 'Nine', 9)
card_9 = Card.new(:heart, 'Ten', 10)
card_10 = Card.new(:heart, 'Jack', 11)
card_11 = Card.new(:heart, 'Queen', 12)
card_12 = Card.new(:heart, 'King', 13)
card_13 = Card.new(:heart, 'Ace', 14)

# Clubs
card_14 = Card.new(:club, 'Two', 2)
card_15 = Card.new(:club, 'Three', 3)
card_16 = Card.new(:club, 'Four', 4)
card_17 = Card.new(:club, 'Five', 5)
card_18 = Card.new(:club, 'Six', 6)
card_19 = Card.new(:club, 'Seven', 7)
card_20 = Card.new(:club, 'Eight', 8)
card_21 = Card.new(:club, 'Nine', 9)
card_22 = Card.new(:club, 'Ten', 10)
card_23 = Card.new(:club, 'Jack', 11)
card_24 = Card.new(:club, 'Queen', 12)
card_25 = Card.new(:club, 'King', 13)
card_26 = Card.new(:club, 'Ace', 14)

# Diamonds
card_27 = Card.new(:diamond, 'Two', 2)
card_28 = Card.new(:diamond, 'Three', 3)
card_29 = Card.new(:diamond, 'Four', 4)
card_30 = Card.new(:diamond, 'Five', 5)
card_31 = Card.new(:diamond, 'Six', 6)
card_32 = Card.new(:diamond, 'Seven', 7)
card_33 = Card.new(:diamond, 'Eight', 8)
card_34 = Card.new(:diamond, 'Nine', 9)
card_35 = Card.new(:diamond, 'Ten', 10)
card_36 = Card.new(:diamond, 'Jack', 11)
card_37 = Card.new(:diamond, 'Queen', 12)
card_38 = Card.new(:diamond, 'King', 13)
card_39 = Card.new(:diamond, 'Ace', 14)

# Spades
card_40 = Card.new(:spade, 'Two', 2)
card_41 = Card.new(:spade, 'Three', 3)
card_42 = Card.new(:spade, 'Four', 4)
card_43 = Card.new(:spade, 'Five', 5)
card_44 = Card.new(:spade, 'Six', 6)
card_45 = Card.new(:spade, 'Seven', 7)
card_46 = Card.new(:spade, 'Eight', 8)
card_47 = Card.new(:spade, 'Nine', 9)
card_48 = Card.new(:spade, 'Ten', 10)
card_49 = Card.new(:spade, 'Jack', 11)
card_50 = Card.new(:spade, 'Queen', 12)
card_51 = Card.new(:spade, 'King', 13)
card_52 = Card.new(:spade, 'Ace', 14)

deck = [ card_1, card_2, card_3, card_4,
         card_5, card_6, card_7, card_8,
         card_9, card_10, card_11, card_12,
         card_13, card_14, card_15, card_16,
         card_17, card_18, card_19, card_20,
         card_21, card_22, card_23, card_24,
         card_25, card_26, card_27, card_28,
         card_29, card_30, card_31, card_32,
         card_33, card_34, card_35, card_36,
         card_37, card_38, card_39, card_40,
         card_41, card_42, card_43, card_44,
         card_45, card_46, card_47, card_48,
         card_49, card_50, card_51, card_52 ]

shuffled_deck = deck.shuffle

deck_1 = Deck.new(shuffled_deck.slice(0..25))
deck_2 = Deck.new(shuffled_deck.slice(26..51))

player1 = Player.new("Megan", deck_1)
player2 = Player.new("Aurora", deck_2)

start_game = StartGame.new(player1, player2)
start_game.start