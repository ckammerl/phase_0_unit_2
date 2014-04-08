# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: 
	#array of strings (characters)
# Output: 
	#sides: returns the array.length defined when initalizing a new instance
	#roll: returns a randomly chosen element of the input array as string
# Steps:
=begin
WRITE a class Die 
DEFINE how new instances of the class Die should be initalized when the class method .new is called using the method #initalize
=> each instance should be initalized with only one parameter 'labels'; 'labels' should be an array of strings (characters)
=> set the instance varialbe @labels equal to parameter 'label' 
WRITE a instance method #sides (takes no arguments) that returns the result of calling the method lenght on the input array (labels)
WRITE a instance method #roll (takes no arguments) that returns one randomly chosen element of the input array at every call by calling #sample on the input array
Class end
	
=end


# 3. Initial Solution
=begin
class Die
  def initialize(labels)
  	@labels = labels
  	if @labels.empty?
  		raise ArgumentError.new("Wrong number of arguments")
  	end 
  end

  def sides
  	return @labels.length
  end

  def roll
  	return @labels.sample
  end
end

=end

# 4. Refactored Solution

class Die
  attr_reader :labels #=> creates a (hidden) wrapper method that defines what the parameter 'labels' is:
					  # 	def labels
					  # 		@labels
					  # 	end 


  def initialize(labels)
  	@labels = labels
  	if @labels.empty?
  		raise ArgumentError.new("Wrong number of arguments")
  	end 
  end

  def sides
  	return labels.length #=> wrapper method definded what 'labels' is and no need to use instance var
  end

  def roll
  	return labels.sample #=> wrapper method definded what 'labels' is and no need to use instance var
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
labels = ["A", "B", "E", "D","E"]

p Die.new(labels).sides == labels.length
p ''
p Die.new(labels).roll != nil #=> method #sample: if the array is empty the first form returns nil (and the second form returns an empty array)
p ''
p Die.new(labels).roll.empty? == false #=> method #sample: if the array is empty (the first form returns nil and) the second form returns an empty array.
p ''
p Die.new(labels).roll.class == String




# 5. Reflection 
=begin
What parts of your strategy worked? What problems did you face?
I had to look up the Array# sample again at ruby-doc.org. Re-reading what it is returning helped me not only to define #roll but also
to write the driver tests

-Array: .sample returns a randomly choosen element from the array
		.sample(n): n random elements from the array
		NOTE: 
		if the array is empty the first form returns nil and the second form returns an empty array
		http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-sample

Did you learn any new skills or tricks?
After reading chapter 2 in POODR, I wanted to refactor my solution using attr_reader
- first I did some more research on attr_reader, attr_writer and attr_accessor
http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby

- attr_accessor combines attr_reader and attr_writer and it is a method that enables 
	me to read and write instance variables; it is a getter/setter for an object
- it creates wrapper methods like so:

attr_reader creates:
	def foo
	  @foo
	end

attr_writer creates 
	def foo=(value)
	  @foo = value
	end

The wrapper method therefore defines what the parameter 'foo' IS; 
attr_accessor automatically creates the two default wrapper methods which are hidden (example above); 
Why use the attr_ methods?
	it makes it much easier to change the definition of your parameter (instance var) at any time;
	if you want to change the wrapper methods and define the instance variable differently, you could just write / add the wrapper method visibly to the class 

Example
attr_reader creates:
	def labels
	  @labels.shuffle
	end

How confident are you with each of the learning objectives?
Break down problems into implementable pseudocode
Implement a basic Ruby class and identify when to use instance variables - I need more exercise to familiarize myself with the concept of classes
and to identify the best implementation (using attr_ methods)
Use if/else statements, string methods, while/until loops, Enumerable#each methods
Find and use built-in Ruby methods to solve challenges

Which parts of the challenge did you enjoy? all of it

	
=end
