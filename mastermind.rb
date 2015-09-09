# classes: board, peg, solution

# board must store the history of guesses etc

module Mastermind

  COLORS = ["R", "O", "Y", "G", "B", "I"]

  class Game

    attr_reader :game_over, :turns

    def initialize
      @game_over = false
      @turn = 1
    end

    def play
      intro
      until @game_over
        puts "\nTurn number: #{@turn} (#{13-@turn} turns remaining)."
        print "Enter your guess: "
        guess = gets.chomp.upcase.split("")
        while guess.length != 4 || !guess.all? { |peg| COLORS.include?(peg) }
          puts "Your guess must be 4 colors from R, O, Y, G, B, I."
          print "Enter your guess: "
          guess = gets.chomp.upcase.split("")
        end
        check_guess(guess)
        @turn += 1
      end
    end

    def intro
      puts "Welcome to mastermind."
      puts "The peg colors are (R)ed, (O)range, (Y)ellow, (G)reen, (B)lue and (I)ndigo."
      puts "Each turn, make your guess by entering your guesses in order."
      puts "e.g. 'GYBR' (without speech marks)."
      puts "Setting up the game..."
      @comp = Computer.new
      puts "The computer has selected their pegs."
    end

    def check_guess(guess)
      @correct = 0
      guess.each_index do |i|
        puts "Checking #{guess[i]}"
        if guess[i] == @comp.solution[i]
          @correct += 1
          puts "#{guess[i]} is the correct peg in the correct place."
        end
      end
      if @correct == 4
        puts "You won! All were correct."
        @gameover = true
      end
    end

  end


  class Computer

    attr_reader :solution

    def initialize
      @solution = []
      4.times { @solution << COLORS[rand(0..COLORS.length-1)] }
      puts @solution
    end

  end


end

game = Mastermind::Game.new
game.play
