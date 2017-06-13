class TicTacToe
  attr_accessor(:game_board, :winning_combos, :used_values)
  def initialize
    @game_board = ["|_1_|_2_|_3_|", "|_4_|_5_|_6_|", "|_7_|_8_|_9_|"]
    @winning_combos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @used_values = []
  end

  def new_game
    puts "Tic-Tac-Toe"
    player_1 = Player.new("player_1", "X")
    player_2 = Player.new("player_2", "O")
    5.times do
      player_turn(player_1)
      player_turn(player_2)
    end
  end

  def update_board(user_input, player)
    @game_board.each do |row|
      row_num = @game_board.index(row)
      if row.include? user_input
        @game_board[row_num] = row.gsub(user_input, player.symbol)
      end
    end
  end

  def show_board
    @game_board.each {|row| puts row}
  end

  def player_turn(player)
    show_board
    puts "#{player.name} pick a square:"
    user_input = gets.chomp
    until user_input.to_i <= 9 && user_input.to_i > 0
      puts "The value given is either not an integer,too large,or already in use."
      puts "Please enter a new value."
      user_input = gets.chomp
    end
    @used_values << user_input
    player.add_choices(user_input.to_i)
    update_board(user_input, player)
  end
end

class Player
  attr_accessor(:name, :player_choices, :symbol)

  def initialize(name, symbol)
    @name = name
    @player_choices = []
    @symbol = symbol
  end

  def add_choices(user_input)
    @player_choices << user_input
  end
end

game = TicTacToe.new
game.new_game
