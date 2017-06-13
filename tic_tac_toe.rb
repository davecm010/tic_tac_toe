class TicTacToe
  attr_accessor(:game_board, :turn_counter, :winning_combos)
  def initialize
    @game_board = [["|_1_|_2_|_3_|"], ["|_4_|_5_|_6_|"], ["|_7_|_8_|_9_|"]]
    @turn_counter = 0
    @winning_combos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  def new_game
    puts "Tic-Tac-Toe"
    player_1 = Player.new("player_1", "X")
    player_2 = Player.new("player_2", "O")
    for i in 0..5
      player_decision(player_1)
      player_decision(player_2)
    end
  end

  def update_board(user_input, player)
    @game_board.each do |row|
      if row.include? user_input
        row.gsub(user_input, player.symbol)
      end
    end
  end

  def show_board
    @game_board.each {|row| puts row}
  end

  def turn_counter
    @turn_counter += 1
  end

  def player_decision(player)
    show_board
    puts "#{player.name} pick a square:"
    user_input = gets.chomp
    player.add_choices(user_input)
    update_board(user_input, player)
    turn_counter
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
