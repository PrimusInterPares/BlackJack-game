# frozen_string_literal: true

module Interface
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
  end

  module InstanceMethods
    DASHED_LINE = '-----------------------------------'
    DEALER_DECK = '* * *'

    def display_hello_message
      puts '#' * 26
      puts '      BLACKJACK GAME'
      puts '#' * 26
      print "\nPlease, enter your name: "
    end

    def display_round(game)
      puts DASHED_LINE
      display_dealer_name
      display_dealer_deck_hidden(game.dealer)
      puts ''
      display_bank(game.bank)
      puts ''
      display_player_stats(game.player)
      puts DASHED_LINE
    end

    def display_final_desk(game)
      puts DASHED_LINE
      display_dealer_name
      display_dealer_score(game.dealer.score)
      display_dealer_deck(game.dealer)
      puts ''
      display_bank(game.bank)
      puts ''
      display_player_stats(game.player)
    end

    def display_tie
      puts DASHED_LINE
      puts 'It is a tie! Nobody wins!'
      puts DASHED_LINE
    end

    def display_winner(winner, bank)
      puts DASHED_LINE
      puts "#{winner.name} wins and gets #{bank}$!"
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

    private

    def clear_screen
      system('clear') || system('cls')
    end

    def display_dealer_name
      puts 'Dealer'
    end

    def display_dealer_deck(dealer)
      output = ''
      dealer.deck.cards.each do |card|
        output += "#{card.rank}#{card.suit} "
      end
      puts "Cards: #{output}"
    end

    def display_dealer_deck_hidden(dealer)
      count_cards = dealer.count_cards
      count_cards.times { print '* ' }
    end

    def display_dealer_score(score)
      puts "Score: #{score}"
    end

    def display_bank(amount)
      puts "\tBank: #{amount}$"
    end

    def display_player_stats(player)
      display_player_name(player.name)
      display_player_score(player.score)
      display_player_account(player.account)
      display_player_deck(player.deck)
    end

    def display_player_score(score)
      puts "Score: #{score}"
    end

    def display_player_name(name)
      puts "Player #{name}"
    end

    def display_player_account(account)
      puts "Account: #{account}$"
    end

    def display_player_deck(deck)
      output = ''
      deck.cards.each do |card|
        output += "#{card.rank}#{card.suit} "
      end
      puts "Cards: #{output}"
    end
  end
end
