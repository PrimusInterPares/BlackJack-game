# frozen_string_literal: true

require_relative 'player'

class Dealer < Player
  attr_reader :game_deck

  DEFAULT_NAME = 'Dealer'

  def initialize(name = nil, account = nil)
    super
    @name = DEFAULT_NAME
    @game_deck = Deck.new(0)
  end

  def give_card
    @game_deck.take_out_card!
  end

  private

  attr_writer :game_deck
end
