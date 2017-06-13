puts "Tic-Tac-Toe"
puts "|_1_|_2_|_3_|", "|_4_|_5_|_6_|", "|_7_|_8_|_9_|"
puts "player_1: enter an available number(1-9)"


class Game
  #initializes Player class twice assigning them to player_1 and player_2 respectively
  #assigns player_1 X and player_2 O
  #Back and forth prompts each player to pick an available number
  #Each time a number is picked, that number is added to player number_array
  #after each prompt response, the number picked on game_board is replaced with an X or O
  def turn
    puts game_board
  end

end

class Player
  #the Player class initializes to empty array which will be instance variable.
  #As the game progresses and each respective player takes their turn,
  #the number inputs added to each array will be checked against a
  #hash or array containing "winning combinations". If no winning combinations
  #are found at the end of each turn, the game continues. Once a winning combination
  #is matched, the game ends. If no combinations are found after numbers 1-9 have
  #all been used, the game ends in a draw.
end
