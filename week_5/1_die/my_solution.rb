# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: an instance of the class Die that takes one parameter (integer, defining num of sides)
# Output: 
#sides: the sides of the new instance i.e. an integer whose value is defined when the instance is initalized; 
#roll: a random integer within range of 1 to sides of the new instance
# Steps:
=begin
WRITE a class Die 
=>	declare a new instance of the class with one parameter by declaring 
	an instance method initialize with one parameter called sides;
	set the instance variable sides equal to the integer 6

=> 	write an instance method sides that takes no arguments;
	this method returns the instance variable sides

=> 	write an instance method roll that takes no arguments
	this method returns a random number in the range of 1 to the value of the 
	instance variable sides
INIT a new instance of the class Die
=end


# 3. Initial Solution
=begin
class Die
  def initialize(sides)
    @sides = sides
    unless @sides > 1
    	raise ArgumentError.new("negative parameter")
    end
  end
  
  def sides
    return @sides
  end
  
  def roll
    return rand(1..@sides)
  end
end
=end

# 4. Refactored Solution

class Die
  def initialize(sides)
    @sides = sides
    if @sides < 1 
    	raise ArgumentError.new("parameter 'sides' is 0 or negative")
    elsif @sides > 6
    	raise ArgumentError.new("parameter 'sides' is over range")
	  end
  end

  def sides
    return @sides
  end
  
  def roll
    return rand(1..@sides)
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
p Die.new(6).sides == 6
p Die.new(6).sides > 0

range = (1..6)
test1 = Die.new(6).roll
p range.include?(test1)

p Die.new(0).class == ArgumentError #=> no valid test, still looking for info on how to check if error has been raised


# 5. Reflection 
=begin

What parts of your strategy worked? What problems did you face?
The strategy I chose worked right away and I did not face any problems.

What questions did you have while coding? What resources did you find to help you answer them?
I had to go through parts of the specs line by line to fully understand them; especially the specs related to #roll (below),
but I managed it and found the answers witouth any further research. That felt good :)

describe '#roll' do

    it 'returns a random number between 1 and the number of sides' do
      sides = 100 + rand(100)
      die = Die.new(sides)

      possible_values = (1..sides).to_a
      unique_rolls = Array.new(20000) { die.roll }.uniq.sort

      unique_rolls.should eq possible_values
    end
  end

I was trying to find a way to add a driver test to check if an exeption has been raised; 
I found an overview of possible ways to raise an expection at rubylearning.com: http://rubylearning.com/satishtalim/ruby_exceptions.html
but I am not clear yet how to test (driver test) that an exeption has actully been raised.

How confident are you with each of the learning objectives?
- Break down problems into implementable pseudocode - confident
- Implement a basic Ruby class and identify when to use instance variables - confident
- Use if/else statements, string methods, while/until loops, Enumerable#each methods - confident
- Find and use built-in Ruby methods to solve challenges - confident
- Explain how instance variables and methods represent the characteristics and actions of an object - understood their definitions and I feel
confident that additional practicing will ensure I'll internalize them

=end