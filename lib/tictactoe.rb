class TicTacToe
  attr_accessor :size

  def initialize x=3
    @size = x
  end
 
  @@taken=0       #to check whether board is on draw/tie if taken = size*size
 
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
end