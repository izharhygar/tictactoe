$taken=0

#defining variables for cells
def board
  @a = " "
  @b = " "
  @c = " "
  @d = " "
  @e = " "
  @f = " "
  @g = " "
  @h = " "
  @i = " "
end


#taking the empty squares as an array
def spots
  [@a, @b, @c, @d, @e, @f, @g, @h, @i]
  
end


#all the winning combinations
def win_combinations
  [[@a, @b, @c],
   [@a, @d, @g],
   [@a, @e, @i],
   [@g, @h, @i],
   [@d, @e, @f],
   [@g, @e, @c],
   [@b, @e, @h],
   [@c, @f, @i]]
  
end


#method to print the status of the game
def game_status
  puts "A  #{@a} | #{@b} | #{@c} " 
  puts "  ---|---|---"
  puts "B  #{@d} | #{@e} | #{@f} "
  puts "  ---|---|---"
  puts "C  #{@g} | #{@h} | #{@i} "  
end


#checking if chosen cell is empty or already filled
def check_if_spot_is_valid x
  if x == " "
    true
  else
    false
  end
end


#method for player 1's turn
def player1_turn
  choice1_hash = {"1" => @a,
                  "2" => @b,
                  "3" => @c,
                  "4" => @d,
                  "5" => @e,
                  "6" => @f,
                  "7" => @g,
                  "8" => @h,
                  "9" => @i}
                    
  while true
    puts "Player 1's turn 'X' \n Please choose a square:"
    choice1 = gets.chomp.downcase
    if (1..9).include?(choice1.to_i)
      break
    elsif choice1=="q" || choice1=="quit"
      exit
    else
      puts "chose in between 1 to 9 only"
    end
  end
  choice1_hash.each do |choice, square|
    if choice1 == choice 
      if check_if_spot_is_valid(square)
        square.sub!(" ", "X")
	     	system "cls"
	    	puts "----- Player 1-----"
        game_status
        $taken+=1
      else 
        puts "already taken chose some other spot"
        player1_turn
      end
    elsif choice1 == "q" or choice1 == "quit"
      exit
    end
  end
  check_for_winner
end

def player2_turn
  choice2_hash = {"1" => @a,
                  "2" => @b,
                  "3" => @c,
                  "4" => @d,
                  "5" => @e,
                  "6" => @f,
                  "7" => @g,
                  "8" => @h,
                  "9" => @i}                  

  while true
    puts "Player 2's turn 'O' \n Please choose a square:"
    choice2 = gets.chomp.downcase
    if (1..9).include?(choice2.to_i)
      break
    elsif choice2=="q" || choice2=="quit"
      exit
    else
      puts "chose in between 1 to 9 only"
    end
  end
  choice2_hash.each do |choice, square|
    if choice2 == choice 
      if check_if_spot_is_valid(square)
        square.sub!(" ", "O")
		system "cls"
		puts "----- Player 2-----"
        game_status
        $taken+=1
      else 
        puts "already taken chose some other spot"
        player2_turn
      end
    elsif choice2 == "q" or choice2 == "quit"
      exit
    end
  end
  check_for_winner
end

def check_for_winner 
  win_combinations.each do |y| 
    if y[0] == "O" && y[1] == "O" && y[2] == "O"
      puts "Player 2 wins."
      exit 
    elsif y[0] == "X" && y[1] == "X" && y[2] == "X"
      puts "Player 1 wins."
      exit
    end
  end
  if($taken>=9)
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
  board
  game_status
  while true
    player1_turn
    player2_turn
  end
end

run_game

