class Winner < Turns
  def check_for_winner                                    #method to check for the winner calling it after every move
    for i in 0 ... @score.size
      if @score[i] == @size                             #if any element of score array is equal of + size then player 1 wins
        puts "PLAYER 1 WON"
        exit 
      elsif @score[i] == -@size                         #if any element of score array is eqaul to  -size then player 2 wins
        puts "Player 2 won"
        exit
      end
    end
    if(@@taken>=@size*@size)                            # this is a logic to check if board is at draw/tie
      puts " you have got a tie"
      exit
    end
  end

  def start_game
    puts "TICTACTOE using RUBYish language"
    puts "To start playing enter your spot. "
    puts "To quit, enter q at any time"
  end

  def run_game
    start_game
    game_status
    while true
      player1_turn
      player2_turn
    end
  end
end            