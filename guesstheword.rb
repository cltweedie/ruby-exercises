# Simple word guessing game that selects a random word from a text file of 58,000 words
# The user guesses letters and has up to 10 incorrect guesses

class Game

  def self.new_game
    @game_over = false
    @won = false
    @wrong_answers_left = 10
    @correct_guesses = 0
    @guessed_letters = []
    self.setup
    self.print_board
    while  !@game_over && !@won
      puts "\nYou have #{@wrong_answers_left} incorrect guesses left...\n"
      self.get_letter
      if @wrong_answers_left == 0
        @game_over = true
        puts "\nGAME OVER! THE WORD WAS #{@word.upcase}!\n"
        puts " "
      end
      if @correct_guesses >= @word.length
        @won = true
        puts "\nWELL DONE, YOU WON! YOU GUESSED THE WORD WAS #{@word.upcase}!"
        puts " "
      end
    end
  end

  def self.setup
    word_list = File.read("wordlist.txt")
    words = word_list.split("\n")
    @word = words[rand(words.length)]
    @letters = @word.split("")
    @board = []
    @letters.each do |letter|
      @board.push("_")
    end
  end

  def self.print_board
    puts " "
    @board.each do |letter|
      print "#{letter} "
    end
    puts " "
  end

  def self.get_letter
    puts " "
    print "Enter a letter to guess: "
    guess = gets.chomp
    if @guessed_letters.include?(guess) == false
      @guessed_letters.push(guess)
      self.check_letter(guess)
    else
      puts "\nYou already guessed that letter!"
    end
  end

  def self.check_letter(guess)
    @guess_was_correct = false
    @letters.each_with_index do |letter, i|
      if letter == guess
        @board[i] = guess
        @guess_was_correct = true
        @correct_guesses += 1
      end
    end
    self.print_board
    @wrong_answers_left -= 1 if !@guess_was_correct
  end

end

Game.new_game