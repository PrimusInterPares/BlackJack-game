# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize(empty)
    @cards = []

    # rubocop:disable Style/GuardClause
    if empty.zero?
      Card::SUITS.each do |suit|
        Card::RANKS.each do |rank, value|
          @cards.push(Card.new(suit, rank, value))
        end
      end
    end
  end
  # rubocop:enable Style/GuardClause

  def add_card(card)
    @cards.push(card)
  end

  def take_out_card
    @cards.shift
  end
end
