# frozen_string_literal: true

module Interface
  DASHED_LINE = '---------------------------'
  DEALER_DECK = '* * *'

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
  end

  module InstanceMethods
    DASHED_LINE = '------------------------'
    DEALER_DECK = '* * *'

    def display_hello_message
      puts '#' * 14
      puts 'BLACKJACK GAME'
      puts '#' * 14
      print "\nPlease, enter your name: "
    end

    def display_round(game, player)
      puts DASHED_LINE
      display_dealer_name
      display_dealer_deck
      puts ''
      display_bank(game.bank)
      puts ''
      display_player_name(player.name)
      display_player_score(player.score)
      display_player_account(player.account)
      display_player_deck(player.deck)
      puts DASHED_LINE
    end

    def display_tie
      puts DASHED_LINE
      puts 'It is a tie! Nobody wins!'
      puts DASHED_LINE
    end

    def display_winner(name, prize)
      puts DASHED_LINE
      puts "#{name} wins and gets #{prize}$!"
      puts DASHED_LINE
    end

    def display_loser(name, prize)
      puts DASHED_LINE
      puts "#{name} loses! Dealer gets #{prize}!"
      puts DASHED_LINE
    end

    def display_one_more_game_offer
      puts DASHED_LINE
      puts 'Do you want to play one more game? Y/N'
      puts DASHED_LINE
    end

    def display_goodbye_message(name)
      puts DASHED_LINE
      puts "Goodbye, #{name}! Thank you for the game!"
      puts DASHED_LINE
    end

    def display_player_actions
      puts DASHED_LINE
      puts 'Please, choose your action (enter the number):'
      puts '1 - Skip turn,'
      puts '2 - Request a card,'
      puts '3 - Show your cards (game will end).'
      puts DASHED_LINE
    end

    def clear_screen
      system('clear') || system('cls')
    end

    private

    def display_dealer_name
      puts 'Dealer'
    end

    def display_dealer_deck
      puts DEALER_DECK
    end

    def display_bank(amount)
      puts "\tBank: #{amount}$"
    end

    def display_player_score(score)
      puts "Your score: #{score}"
    end

    def display_player_name(name)
      puts "Player #{name}"
    end

    def display_player_account(account)
      puts "Your account: #{account}$"
    end

    def display_player_deck(deck)
      output = ''
      deck.cards.each do |card|
        output += "#{card.rank}#{card.suit} "
      end
      puts "Your cards: #{output}"
    end
  end
end
