class Player
  attr_reader :hand

  def initialize(hand=[])
    @hand = Array(hand)
  end

  def receive(card)
    @hand << card
    @hand = hand.sort
  end

  def beats?(player, table)
    puts __callee__
    my_highest_pair = pairs(table).last || []
    p my_highest_pair
    their_highest_pair = player.pairs(table).last || []
    p their_highest_pair

    if their_highest_pair.first.nil?
      self
    else
      if my_highest_pair.first.nil?
        player
      else
        if my_highest_pair.first.rank >= their_highest_pair.first.rank
          self
        else
          player
        end
      end
    end
  end

  def pairs(table)
    pairs = []
    full_hand = (hand + table.hand).sort
    prev = full_hand.shift
    full_hand.each do |card|
      if prev.rank == card.rank
        pairs << [prev, card]
      end
      prev = card
    end

    pairs
  end

  def to_s
    hand.join("\n")
  end
end

class Table < Player
end
