class Card
  include Comparable

  Faces = {'11': 'Jack', '12': 'Queen', '13': 'King', '14': 'Ace'}

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    rank <=> other.rank
  end

  def to_s
    t_rank = rank
    t_rank = Faces[rank.to_s.to_sym] if t_rank > 10

    "%s of %s"%[t_rank, suit]
  end
end
