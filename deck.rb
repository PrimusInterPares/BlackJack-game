# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :cards

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
    @cards.push(card) if card.instance_of?(Card)
  end

  def take_out_card
    @cards.shift
  end

  private

  attr_writer :cards
end
