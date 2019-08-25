# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Sample Board for Help
#  0 | 1 | 2
# -----------
#  3 | 4 | 5
# -----------
#  6 | 7 | 8


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #0 'top row win'
  [3,4,5], #1 'middle row win'
  [6,7,8], #2 'bottom row win'
  [0,3,6], #3 'first column win'
  [1,4,7], #4 'second column win'
  [2,5,8], #5 'third column win'
  [0,4,8], #6 'left diagonal win'
  [2,4,6]  #7 'right diagonal win'
]

def won?(board)

  WIN_COMBINATIONS.detect do |win_combination| #First, it reads thhrough each element in 'WIN_COMBINATIONS'.
    win_index_1 = win_combination[0] #For each element (which is an array), it assigns the value at [0] to the variable 'win_index_1'
    win_index_2 = win_combination[1] #Next, it does the same for the value in that array at [1]
    win_index_3 = win_combination[2] #Finally, the value at [2] is assigned, allowing our code below to analyze the contents of each sub-array.
    # board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    # The code below takes our game board array and checks to see if any combination exists that is a winning match.
    board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
  end # If a winning combination is found, the 'detect' will return the array. If not, it returns a falsey value.
end

def full?(board)

  board.all? do |value| #The '#all?' goes through each value of the array to see if it meets the conditions required below.
    value == "X" || value == "O"
  end #If every value is equal to either "X" or "O", then we know the board is full and it is a draw. It will return true.
end #Otherwise, the game is still in progress since a " " was detected, returning false.


def draw?(board)

  if full?(board) && !won?(board) #returns true if the board is full and there are no winning combinations.
    return true
  end

end

def over?(board)

  if won?(board) || full?(board) #returns true if the board has a winning move or the board is full with no winning moves.
    return true #Will return true if the game is over.
  end

end

def winner(board)
  winner = won?(board) #First, we set the variable 'winner' equal to the array resulting from our 'won?' method (if a winning combo is found).
  #We then jump into a conditional statement. If we have a winner, we want to check what character won the game: 'X' or 'O'.
  if winner #First, let's say we had a diagonal winner ([0,5,8]). We can call any value from this array and set it equal to a variable.
    winning_character = winner[1] #winning_character is set equal to the value of the called array position. In this case, we call the middle value of '5'.
    return board[winning_character] #then, we return the board position of the winning_character value, which could be read as 'board[5]'
  else #if there are not winning combinations found, we return a value of 'nil'
    nil
  end

end
