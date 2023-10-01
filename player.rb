# frozen_string_literal: true

require_relative 'deck'

class Player
  attr_reader :name, :account, :deck, :score

  START_ACCOUNT = 100

  def initialize(name = 'No_name', account = START_ACCOUNT)
    @name = name.to_s
    @account = account.to_i
    @deck = Deck.new(1)
    @score = count_score
  end

  def make_bet(bet_size)
    @account -= bet_size unless (account - bet_size).negative?
  end

  def request_card(number, dealer)
    return unless dealer.instance_of?(Dealer)

    number.times { deck.add_card!(dealer.give_card) }
    @score = count_score
  end

  def count_cards
    deck.cards.length
  end

  def increase_account(amount)
    @account += amount
  end

  def clear_hand
    @deck = Deck.new(1)
  end

  private

  attr_writer :name, :account, :deck, :score

  def count_score
    return 0 if deck.cards.empty?

    score = 0
    count_aces = 0
    deck.cards.each do |card|
      count_aces += 1 if card.rank == 'T'
      score += if (card.rank == 'T') && (count_aces > 1)
                 1
               else
                 card.value
               end
    end
    score
  end
end
