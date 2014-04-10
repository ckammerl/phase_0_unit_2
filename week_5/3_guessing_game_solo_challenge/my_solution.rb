# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: integer
# Output: 
# 	#guess returns :symbol;
# 	#solved? returns bolean value;
# Steps:
=begin
WRITE a class GuessingGame 

WRITE a instance method #initalize to initalize new instances of the class with one parameter (integer) called 'answer' 
	SET the instance varialbe @answer eql answer
	SET an instance variable @solved eql false

WRITE an instance method #guess which takes one parameter (integer) called 'guess'
	the methods checks if guess eql @answer and puts a message to help the user find 
	the correct answer; it can change the bolean value of the instance variable @solved and returns a :symbol;
	IF 
		guess less than @answer return :low
		puts message guess lower than @answer
		@solved eql false
	ElSIF 
		guess greater than @answer return :high 
		puts message guess greater than @answer
	ELSE
		guess eql @answer return :correct
		puts message correct, guess eql @answer
		@solved eql false
	END
WRITE an instance method #solved? that takes no argument
	it returns @solved with the value true or false based on the returned value of @solved in #guess
CLASS END

=end  
	

# 3. Initial Solution

class GuessingGame

def initialize(answer)
	@answer = answer
	@solved = false
end 

def guess(guess)
  if guess < @answer
    puts "Your guess #{guess} is smaller than the correct number."
    @solved = false
    return :low
  elsif guess > @answer
    puts "Your guess #{guess} is greater than the correct number."
    @solved = false
    return :high
  else
    puts "Your guess #{guess} is correct!"
    @solved = true
    return :correct
  end
end

  def solved?
  	@solved
  end
end 


# 4. Refactored Solution

class GuessingGame

  def initialize(answer)
	@answer = answer
	@solved = false
  end 

  def guess(num) # changed param name to num
  	@solved = false #writing it before the if statement
   if num < @answer
     puts "Your guess #{num} is smaller than the correct number."
     return :low
   elsif num > @answer
     puts "Your guess #{num} is greater than the correct number."
     return :high
   else
     puts "Your guess #{num} is correct!"
     @solved = true
     return :correct
   end
  end

  def solved?
   	@solved
  end
end 


# 1. DRIVER TESTS GO BELOW THIS LINE


test = GuessingGame.new(16)

p test.guess(14) == :low
p test.solved? == false

p test.guess(20) == :high
p test.solved? == false

p test.guess(16) == :correct
p test.solved? == true



# 5. Reflection 
=begin
What parts of your strategy worked? What problems did you face?
Writing the correct #initalize method and the instance var @answer as well as the method #guess worked well and I 
could write the solution without any reaserach. I had problems to define the method #solved? as I first asked the method to
return the instance var @solved?, i.e. ending with a question mark. That's not valid.. But I rememberd that instance var
names do not have to be the same as the method name (nor as the input/ param name, like @answer = answer could also be @solution = answer).
The next problem was to understand why I need to add '@solved = false' to the #initialize method, and why I can't add it to #guess. I can create
instance var in each of the class' instance methods, it doesn't has to be in the method #initialize. 
But:
To solve this challenge,  I had to make sure that FOR EACH call of #guess, @solved is set eql to false first 
(and then depending of the outcome of the if/else statement in #guess stays false or becomes true).
In order to achieve that, I had to define @solved within #initialize. Only this way I made sure that if the same instance (test) 
is calling the method #guess multiple times, the instance knows that the value of @solved eql false.
It was a try & error approach to figure this out.

What questions did you have while coding? What resources did you find to help you answer them?
I read chapter 3 of the Well-Grounded Rubyist

How confident are you with each of the learning objectives?
Break down problems into implementable pseudocode - confident
Implement a basic Ruby class and identify when to use instance variables - With more and more challenges solved, I am getting a much better understanding of the scope of instance variables
Use if/else statements, string methods, while/until loops, Enumerable#each methods - confident
Explain how instance variables and methods represent the characteristics and actions of an object - confident

Which parts of the challenge did you enjoy?
It was another good exercise! It would be great if you could point out the benefits of using :symbols (instead of 'strings')in next challenges 
=end  
  


