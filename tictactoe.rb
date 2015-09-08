class Game

  def setup
    @game_over = false
    @board = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]]
  end

  def begin
    setup
    puts "Welcome to tic-tac-toe. Player one is 'X's, player 2 is 'O's."
    until @game_over
      print_board
      get_move("X")
      check_status
      break if @game_over
      print_board
      get_move("O")
      check_status
    end
    puts "Game over"
  end

  def print_board
    @board.each do |row|
      row.each do |square|
        print " #{square} "
      end
      puts ""
    end
  end

  def get_move(player)
    print "Which square, player #{player}?: "
    move = gets.chomp.to_i
    @board.each do |row|
      row[row.index(move)] = player if row.include?(move)
    end
  end

  def check_status
    @game_over = true if @board[0].all? { |square| square == "X"} || @board[0].all? { |square| square == "Y"}
    @game_over = true if @board[0][0] == "X" && @board[1][0] == "X" && @board[2][0] == "X"
    @game_over = true if @board[0][0] == "O" && @board[1][0] == "O" && @board[2][0] == "O"
    @game_over = true if @board[0][1] == "X" && @board[1][1] == "X" && @board[2][1] == "X"
    @game_over = true if @board[0][1] == "O" && @board[1][1] == "O" && @board[2][1] == "O"
    @game_over = true if @board[0][2] == "X" && @board[1][2] == "X" && @board[2][2] == "X"
    @game_over = true if @board[0][2] == "O" && @board[1][2] == "O" && @board[2][2] == "O"
    @game_over = true if @board[0][0] == "X" && @board[1][1] == "X" && @board[2][2] == "X"
    @game_over = true if @board[0][0] == "O" && @board[1][1] == "O" && @board[2][2] == "O"
    @game_over = true if @board[0][2] == "X" && @board[1][1] == "X" && @board[2][0] == "X"
    @game_over = true if @board[0][2] == "O" && @board[1][1] == "O" && @board[2][0] == "O"
  end

end

game = Game.new
game.begin

