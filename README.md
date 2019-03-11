# tictactoe
a tictactoe game using Ruby
this is a basic tictactoe game designed in RUBY which can be played in command prompt.

the code will give you a basic n*n layout.

 AT first we have to select the size of the grid. Then the selected grid will be presented as such (for example if 3*3 was selected)
```
1  |   2    |   3
__ | ______ | ____

4  |   5    |   6
__ | ______ | ____

7  |   8    |   9
```

game starts with player one having 'X' as his turn. and player 2 will have 'O'.

player 1 can select the position where he wants to place his market by specifying the row and column of the position and the market will be placed. 

player 2 can do it the same way. 

winner will be decided by a generic algorithm that counts the unique markers as the move is made and incremenets the element of "Score" array. Score array has (2*size+2) elements one corresponding to each row, column and diagonals.

