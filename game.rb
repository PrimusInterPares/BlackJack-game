# frozen_string_literal: true

require_relative 'interface'
require_relative 'player'
require_relative 'dealer'

class Game
  include Interface

  attr_reader :player, :dealer, :bank

  def initialize
    @player = register_player
    @dealer = Dealer.new
    @bank = 0
    @open_cards = false
  end

  def start
    round0

    loop do
      if both_have_3_cards? || open_cards
        game_results
        if one_more_game?
          reset_game
        else
          display_goodbye_message(player.name)
          return
        end
      end

      display_round(self)
      display_player_actions
      round_n
    end
  end

  private

  attr_accessor :open_cards
  attr_writer :player, :dealer, :bank

  def register_player
    display_hello_message
    gamer_name = gets.chomp
    @player = Player.new(gamer_name)
  end

  def game_results
    display_final_desk(self)
    if draw?
      player.increase_account(bank / 2)
      dealer.increase_account(bank / 2)
      display_tie
      return
    end
    display_winner(winner, bank)
    give_winnings(winner)
  end

  def both_have_3_cards?
    player.count_cards == dealer.count_cards && player.count_cards == 3
  end

  def draw?
    player.score == dealer.score
  end

  def winner
    return dealer if player.score > 21

    if player.score > dealer.score
      player
    else
      dealer
    end
  end

  def give_winnings(player)
    player.increase_account(bank)
  end

  def one_more_game?
    answer = ''
    while answer != 'Y' || answer != 'N'
      display_one_more_game_offer
      answer = gets.chomp.capitalize
      case answer
      when 'Y'
        return true
      when 'N'
        return false
      else
        puts 'Please, enter correct choice.'
      end
    end
  end

  def take_bets
    player.make_bet(10)
    dealer.make_bet(10)
    @bank += 20
  end

  def round0
    player.request_card(2, dealer)
    dealer.request_card(2, dealer)

    take_bets
  end

  def round_n
    action = gets.chomp
    case action
    when '1'
      dealer_turn
    when '2'
      if player.count_cards == 2
        player.request_card(1, dealer)
        dealer_turn
      else
        puts 'You cannot take more cards. You already have 3.'
      end
    when '3'
      @open_cards = true
    else
      puts 'Unknown command'
    end
  end

  def dealer_turn
    dealer.request_card(1, dealer) if dealer.score < 17
  end

  def reset_game
    @bank = 0
    @open_cards = false

    dealer.take_new_deck

    player.clear_hand
    dealer.clear_hand

    round0
  end
end
