# the main class
class TicTacToe
  attr_accessor :size

  def initialize x=3
    @size = x
  end
  @@taken=0       #to check whether board is on draw/tie if taken = size*size
 
  #@@size=5        #size of the board
  def arrays
    @spots =  Array.new(@size){Array.new(@size, " ")}        #actual board specified as a two dimension array
 
    @score = Array.new(2*@size+2,0)                          #an array to check win, it has elements for all rows, columns, diagonals and antidiags
  end

  #method to print the status of the game

  def game_status
    for i in 0 ... @size
      for j in 0 ... @size
        print "#{@spots[i][j]}  |"
      end
      print "\n"
      for k in 0 ... @spots.size
        print "---|"
      end
      print "\n"
    end
  end


#checking if chosen cell is empty or already filled
  def check_if_spot_is_valid x
    if x == " "
      true
    else
      false
    end
  end
  def number_or_nil(string)
    Integer(string || '')
    rescue ArgumentError
     nil
  end

#method for player 1's turn
  def player1_turn 
    while true
      puts "Player 1's turn 'X' \n Please choose a square ( in the form of a matrix cell):"
      row1, col1 = gets.chomp.split(" ")
      if row1=="q" || row1=="quit" || col1=="q" || col1=="quit"
        exit
      end
      row1=number_or_nil(row1)
      col1=number_or_nil(col1)
      #choice1 = @spots[row1][col1]
      if (0..@size-1).include?(row1) && (0..@size-1).include?(col1)
        break
      else
        puts "chose according to the already selected size and must be an integer"
      end
    end
    row1=row1.to_i
    col1=col1.to_i
    if check_if_spot_is_valid(@spots[row1][col1])
      @spots[row1][col1] = "X"
      @score[row1]+=1                               #incrementing for the chosen row
      @score[@size+col1]+=1                        #incrementing for the chosen column
      if(row1 == col1)                               #incrementing for the chosen diagonal (if only)
        @score[2*@size]+=1
      end
      if(@size-1-col1 == row1)                      #incrementing for the chosen anti diag ( if only)
        @score[2*@size+1]+=1
      end
	    system "cls"
	    puts "----- Player 1-----"
      game_status
      @@taken+=1
    else 
      puts "already taken chose some other spot"
      player1_turn
    end
    check_for_winner
  end

  def player2_turn                                            #exactly similar function for player 2's turn
    while true
      puts "Player 2's turn 'X' \n Please choose a square(in the form of a matrix cell):"
      row2, col2 = gets.split(" ")
      if row2=="q" || row2=="quit" || col2=="q" || col2=="quit"
        exit
      end
      row2=number_or_nil(row2)
      col2=number_or_nil(col2)
      if (0..@size-1).include?(row2) && (0..@size-1).include?(col2)
        break
      else
        puts "chose according to the already specified size and must be an integer"
      end
    end 
    if check_if_spot_is_valid(@spots[row2][col2])
      @spots[row2][col2] = "O"
      @score[row2]+=-1                                   # DECREMENTING IN THIS METHOD ( FOR 'O')
      @score[@size+col2]+=-1
      if(row2 == col2)
        @score[2*@size]+=-1
      end
      if(@size-1-col2 == row2)
        @score[2*@size+1] += -1
      end
	    system "cls"
	    puts "----- Player 2-----"
      game_status
      @@taken+=1
    else 
      puts "already taken chose some other spot"
      player2_turn
    end
    check_for_winner
  end


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
end                                                 #class ends
while true
  puts "enter the size"
  size=gets.to_i
  if size>=3
    break;
  else
    puts "TicTacToe size must be greater than or equal to 3"
  end
end
t= TicTacToe.new(size)
t.arrays
t.run_game

