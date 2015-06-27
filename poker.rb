# Basic poker hand evaluator
# Deals random 5 cards and tells you what you have

class Poker

  @deck = ['2h','3h','4h','5h','6h','7h','8h','9h','Th','Jh','Qh','Kh','Ah',
          '2d','3d','4d','5d','6d','7d','8d','9d','Td','Jd','Qd','Kd','Ad',
          '2c','3c','4c','5c','6c','7c','8c','9c','Tc','Jc','Qc','Kc','Ac',
          '2s','3s','4s','5s','6s','7s','8s','9s','Ts','Js','Qs','Ks','As',]
  @hand = []

  def self.shuffle_deck
    @shuffled_deck = @deck.shuffle
  end

  def self.deal_hand
    @hand.push(@shuffled_deck[0], @shuffled_deck[1], @shuffled_deck[2], @shuffled_deck[3], @shuffled_deck[4])
    puts "Player hand: #{@hand}"
  end

  def self.analyse_hand
    @suits = []
    @ranks = []
    @hand.each do |card|
      @suits.push(card[1])
    end
    @hand.each do |card|
      @ranks.push(card[0])
    end
    if self.pair? && self.trips?
      puts "Full house"
    elsif self.trips?
      puts "Three of a kind"
    elsif self.pair?
      puts "Pair"
    elsif self.straight? && self.flush?
      puts "Straight Flush"
    else
      puts "Straight" if self.straight?
      puts "Flush" if self.flush?
      puts "Four of a kind" if self.quads?
    end
  end

  def self.flush?
    @suits.uniq.length == 1
  end

  def self.pair?
    @ranks.uniq.length == 4
  end

  def self.trips?
    @ranks.detect { |rank| @ranks.count(rank) == 3 }
  end

  def self.quads?
    @ranks.detect { |rank| @ranks.count(rank) == 4 }
  end

  def self.straight?
    @ranks.each do |rank|
      @ranks[@ranks.index(rank)] = 10 if rank == "T"
      @ranks[@ranks.index(rank)] = 11 if rank == "J"
      @ranks[@ranks.index(rank)] = 12 if rank == "Q"
      @ranks[@ranks.index(rank)] = 13 if rank == "K"
      @ranks[@ranks.index(rank)] = 14 if rank == "A"
    end
    @ranks.map! { |rank| rank.to_i }
    @ranks.sort!
    @ranks.inspect
    if @ranks[4] - @ranks[3] == 1 && @ranks[3] - @ranks[2] == 1 && @ranks[2] - @ranks[1] == 1 && @ranks[1] - @ranks[0] == 1
      return true
    end
  end

end

Poker.shuffle_deck
Poker.deal_hand
puts Poker.analyse_hand
