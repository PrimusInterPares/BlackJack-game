# frozen_string_literal: true

class Card
  attr_accessor :suit, :rank, :value

  SUITS = %W[\u2660 \u2665 \u2663 \u2666].freeze
  RANKS = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '10' => 10,
    'J' => 10,
    'Q' => 10,
    'K' => 10,
    'A' => 11
  }.freeze

  def initialize(suit, rank, value)
    @suit = suit.to_s
    @rank = rank.to_s
    @value = value.to_i
  end
end
