# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge with Adam Ryssdal.

$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode
=begin
DEFINE method called create_word that takes two inputs - board array and coordinates
Coordinates can be multiple arguments in form of arrays with two elements
ITERATE through coordinates using #map in order to get copy of original array
First element of coords should be an index for an element of board array
Second element of coords should be an index for an element within the element of board array
which the first element of coords defined.
join on the copy array in order to return a single string
=end

# Initial Solution
 
 def create_word(board, *coords)
    coords.map { |coord| board[coord.first][coord.last]}.join("")
  end


# Refactored Solution
#The initial solution is already very clear and dry; no refactoring needed

# DRIVER TESTS GO BELOW THIS LINE
  puts create_word($boggle_board, [2,1], [1,1], [1,2], [0,3])  == "code"  
  puts create_word($boggle_board, [0,1], [0,2], [1,2])  == "rad"
  puts create_word($boggle_board, [0,1], [0,2], [1,2]).class == String


#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# WRITE a method #get_row which takes one argument "row"; "row" is an integer defining the index of the input array
# DEFINE var boggle_board as an array of arrays whose elements are strings
# RETURN the element of the input array at index row 

# Initial Solution
def get_row(row)
        boggle_board = [["b", "r", "a", "e"],
                  ["i", "o", "d", "t"],
                  ["e", "c", "l", "r"],
                  ["t", "a", "k", "e"]]
  return boggle_board[row]
end 

puts get_row(3)

# Refactored Solution
def get_row(row)
  return $boggle_board[row] #using global variable
end 

puts get_row(3)

# DRIVER TESTS GO BELOW THIS LINE
puts get_row(0) == ["b", "r", "a", "e"]
puts get_row(1).class == Array
puts get_row(1).length == 4


#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# WRITE a method #get_col which takes one argument "col"; "col" is an integer 
# ITERATE through input array using #map in order to get an array returned
# => look at each element of input array and within each element find the element at index col; 
# RETURN the array containing the elements from each nested array of the input array at index col

# Initial Solution
def get_col(col)
  return $boggle_board.map { |row| row[col] }
end 

# Refactored Solution
# initial solution is short, clear and dry

# DRIVER TESTS GO BELOW THIS LINE
puts get_col(4) == [nil, nil, nil, nil]
puts get_col(2) == ["a", "d", "l", "k"]
puts get_col(1).class == Array


# Reflection 
=begin
What parts of your strategy worked? What problems did you face?
Our strategy worked right away; describing the initital solution of part 1 in pseudocode forced us to really understand
each part of it and to see which parts access which element of an nested array. 

What questions did you have while coding? What resources did you find to help you answer them?
We both rememberd global variables and looked at our notes (based on info at to http://www.tutorialspoint.com/ruby/ruby_classes.htm) to 
see how we can use them in our refactored solution

Did you learn any new skills or tricks?
Got a better feeling for how to iterate through nested arrays; global variables
How confident are you with each of the learning objectives? - confident

Which parts of the challenge did you find tedious?
Part 1 confused me at the first glance; I didn't find the instructions clear and first wondered whether we should find a "new" initial solution or whether
the given one needs only to be refactored.

=end 
        


