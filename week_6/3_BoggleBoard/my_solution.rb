# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [by myself].


# 2. Pseudocode



# 3. Initial Solution
class BoggleBoard 

  def initialize(grid)
    @grid = grid
  end 

  def create_word(*coords)
    coords.map { |coord| @grid[coord.first][coord.last]}.join("")
  end

  def get_row(row)
    return @grid[row]
  end 

  def get_col(column)
    return @grid.map { |elem| elem[column] }
  end
end


dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 
puts boggle_board.create_word([1,2], [1,1], [2,1], [3,2])

puts boggle_board.get_row(0..3).map {|x| x.join("")}

puts boggle_board.get_col(0).join('')
puts boggle_board.get_col(1).join('')
puts boggle_board.get_col(2).join('')
puts boggle_board.get_col(3).join('')


=begin
total output:

dock
	
brae
iodt
eclr
take
=> 	
	["brae", "iodt", "eclr", "take"]

biet
roca
adlk
etre
=> 	
	'biet'
	'roca'
	'adlk'
	'etre'

=end

# 4. Refactored Solution
class BoggleBoard < Array #class inherits from class Array; allows to use Array #methods (see driver test)

  def initialize(grid)
    @grid = grid
  end 

  def create_word(*coords)
    coords.map { |coord| @grid[coord.first][coord.last]}.join("")
  end

  def get_row(row)
    return @grid[row]
  end 

  def get_col(column)
    return @grid.map { |elem| elem[column] }
  end

  def get_diagonal(start_row, start_column) #added #get_diagonal
  	result = []
  	while start_row < @grid.length && start_column < @grid.length  
  		char = @grid[start_row][start_column]
  		result.push(char)
  		start_row += 1
  		start_column += 1
  	end 
  	return result
   end
 end


# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]

boggle_board = BoggleBoard.new(dice_grid)

p BoggleBoard.new(dice_grid).class == BoggleBoard

p boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock" # boggle_board.create_word should eql string "dock"

p boggle_board.get_row(2) == ["e", "c", "l", "r"]
p boggle_board.get_col(3) == ["e", "t", "r", "e"]

p boggle_board.get_row(3).at(2) == "k"   #class inherits from class Array; I can use Array #at

p boggle_board.get_diagonal(0, 0) == ["b", "o", "l", "e"]
p boggle_board.get_diagonal(3, 2).length == 1 #class inherits from class Array; I can use Array #length


# 5. Reflection 
=begin
	
What parts of your strategy worked? What problems did you face?
The most difficult part was to write the method #get_diagonal; although I recognized the pattern quiet fast,
I first only restricted my loop using start_row; I got the right result but the array (row) also included nil; this showed
that I am working with a 4 by 4 nested array; but I wanted to get rid of the nil and successfully did it by adding another restriction
for the loop.

Did you learn any new skills or tricks?
I used inheritance to get access to Array methods which helped me write good driver tests

How confident are you with each of the learning objectives?
Create, access, and traverse nested data structures - I would say confident but working with nested arrays still takes some time
Implement a basic Ruby class and identify when to use instance variables - confident

	
=end