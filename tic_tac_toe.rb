class TicTacToe
  attr_accessor(:game_board, :winning_combos)
  def initialize
    @game_board = ["|_1_|_2_|_3_|", "|_4_|_5_|_6_|", "|_7_|_8_|_9_|"]
    @winning_combos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @used_values = []
    @turn_count = 0
    @user_input = ''
  end

  def new_game
    puts "Tic-Tac-Toe"
    player_1 = Player.new("player_1", "X")
    player_2 = Player.new("player_2", "O")
    while @turn_count < 9
      player_turn(player_1)
      player_turn(player_2)
    end
  end

  def player_turn(player)
    @turn_count += 1
    show_board
    puts "#{player.name} pick a square:"
    get_input
    player.add_choices(@user_input.to_i)
    update_board(@user_input, player)
    game_over?(player)
  end

  def show_board
    @game_board.each {|row| puts row}
  end

  def update_board(user_input, player)
    @game_board.each do |row|
      row_num = @game_board.index(row)
      if row.include? user_input
        @game_board[row_num] = row.gsub(user_input, player.symbol)
      end
    end
  end

  def get_input
    @user_input = gets.chomp
    if @user_input.to_i > 9
      puts "The value given is too large, try again:"
      get_input
    elsif @user_input.to_i < 1
      puts "The value given is either too small or not a number, try again:"
      get_input
    else
      @used_values << @user_input
    end
  end

  def game_over?(player)
    if victory_check(player)
      show_board
      puts "Tic-Tac-Toe, three in a row! #{player.name.capitalize} has won the game!"
      exit
    elsif @turn_count == 9
      show_board
      puts "All tiles have been filled, the game ends in a draw."
      exit
    end
  end

  def victory_check(player)
    @winning_combos.each do |array|
      if array.all? {|num| player.player_choices.include? num}
        return true
      end
    end
    false
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
