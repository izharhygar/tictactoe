def board
  @1 = " "
  @2 = " "
  @3 = " "
  @4 = " "
  @5 = " "
  @6 = " "
  @7 = " "
  @8 = " "
  @9 = " "
end

def spots
  [@1, @2, @3, @4, @5, @6, @7, @8, @9]
  
end

def wins
  [[@1, @2, @3],
  [@1, @4, @7],
  [@1, @5, @9],
  [@7, @8, @9],
  [@4, @5, @6],
  [@7, @5, @3],
  [@2, @5, @8],
  [@3, @6, @9]]
  
end

def printgame
  puts "A  #{@1} | #{@2} | #{@3} " 
  puts "  ---|---|---"
  puts "B  #{@4} | #{@5} | #{@6} "
  puts "  ---|---|---"
  puts "C  #{@7} | #{@8} | #{@9} "
  check_for_winner
  
end

def checkifspotisvalid x
  if x == " "
    true
  else
    puts "chose again"
  end
end

def turn1
  choice1_hash = {"1" => @a1,
                      "2" => @a2,
                      "3" => @a3,
                      "4" => @b1,
                      "5" => @b2,
                      "6" => @b3,
                      "7" => @c1,
                      "8" => @c2,
                      "9" => @c3}
                    

  puts "Player 1's turn \n Please choose a square:"
  choice1 = gets.chomp.downcase
  choice1_hash.each do |choice, square|
    if choice1 == choice 
      if checkifspotisvalid(square)
        square.sub!(" ", "X")
		system "cls"
		puts "----- Player 1-----"
        printgame
      end
    elsif choice1 == "q" or choice1 == "quit"
      exit
    end
  end
end

def turn2
  choice2_hash = {"1" => @a1,
                      "2" => @a2,
                      "3" => @a3,
                      "4" => @b1,
                      "5" => @b2,
                      "6" => @b3,
                      "7" => @c1,
                      "8" => @c2,
                      "9" => @c3}
                    

  puts "PLAYER 2's TURN \n Please choose a square:"
  choice2 = gets.chomp.downcase
  choice2_hash.each do |choice, square|
    if choice2 == choice 
      if checkifspotisvalid(square)
        square.sub!(" ", "O")
		system "cls"
		puts "----- Player 2-----"
        printgame
      end
    elsif choice2 == "q" or choice2 == "quit"
      exit
    end
  end
end

def check_for_winner 
  wins.each do |y| 
    if y[0] == "O" && y[1] == "O" && y[2] == "O"
      puts "Player 2 wins."
      exit 
    elsif y[0] == "X" && y[1] == "X" && y[2] == "X"
      puts "Player 1 wins."
      exit
    end
  end
end

def start_game
  puts "TICTACTOE using RUBYish language"
  puts "To start playing enter your spot. "
  puts "To quit, enter q at any time"
end

def run_game
  start_game
  board
  printgame
  while true
    turn1
    turn2
  end
end

run_game
