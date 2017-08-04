require 'player'
require 'card'

class Deck
  Suits= %w(Spades Clubs Diamonds Hearts)

  Ranks= (2..14).to_a

  attr_reader :cards

  def initialize
    @cards = Suits.flat_map do |suit|
      Ranks.flat_map do |rank|
        Card.new(rank, suit)
      end
    end
  end

  def deal_to(player)
    player.receive(cards.shift)
  end

  def shuffle
    @cards = cards.shuffle
    self
  end

  def to_s
    cards.map(&:to_s).join("\n")
  end
end
