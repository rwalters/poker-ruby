lib = File.expand_path('lib', File.dirname(__FILE__))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'securerandom'
require 'deck'

deck = Deck.new.shuffle

players = []
SecureRandom.random_number(2..10).times { players << Player.new }
table = Table.new

2.times do
  players.each do |player|
    deck.deal_to(player)
  end
end

5.times{ deck.deal_to(table) }

puts table.to_s
puts "\n---\n"
players.each{|p| puts p.pairs(table).flatten.map(&:to_s).to_s}

puts "\n-----\n"
player = players.shift
players.each do |other|
  player = other if other.beats?(player, table)
end
puts player.pairs(table).flatten.map(&:to_s).to_s
