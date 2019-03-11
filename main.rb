# the main class


require './lib/tictactoe.rb'
require './lib/turns.rb'
require './lib/winner.rb'
                                   
while true
  puts "enter the size"
  size=gets.to_i
  if size>=3
    break;
  else
    puts "TicTacToe size must be greater than or equal to 3"
  end
end
t= Winner.new(size)
t.arrays
t.run_game

