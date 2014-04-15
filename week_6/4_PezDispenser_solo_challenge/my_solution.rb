# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself, with: ].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode
=begin

INPUT = array of strings (the strings represent flavors)
OUTPUT =
pez_count: integer
see_all_pez: array of strings (the strings represent flavors)	
add_pez: nothing (modiefies state of instance)
get_pez: nothing (modifies state of instance)

WRITE a class PezDispenser

WRITE a method .initialize
- new instances are initialized with one argument (array of strings which are possible flavors of a pez)
- set the instance variable @content equal to the array of strings

WRITE #pez_count which should return an integer as result of of calling #length on @content

WRITE #add_pez which takes one parameter (string/flavor) and uses #unshift to add a pez on idx 0 of @content
- #add_pez increases the length of @content by one and by prepending an object to the front of @content,
 it moves other elements upwards by one. 

WRITE #get_pez which doesn't take an argument; it uses #shift to substract one pez - which is the pez
at idx 0 of @content; #get_pez decreases the length of @content by one and moves other elements downwards by one

WRITE #see_all_pez which should return the latest version of @content 

=end


# 3. Initial Solution

=begin
class PezDispenser 
	attr_reader :content

 	def initialize(content)
 		@content = content
 	end 

 	def pez_count
 		return @content.length
 	end

 	def add_pez(flavor)
 		@content.unshift(flavor)
 	end 

 	def get_pez
 		@content.shift
 	end 

 	def see_all_pez
 		return @content
 	end 
end
=end


# 4. Refactored Solution - adding different solution which adds pez to the end of the content row


class PezDispenser 
	attr_reader :content

 	def initialize(content)
 		@content = content
 	end 

 	def pez_count
 		return @content.length
 	end

 	def add_pez(flavor)
 		@content.push(flavor) #pushing new pez to end..
 	end 

 	def get_pez
 		@content.shift #..but still taking pez from top 
 	end 

 	def see_all_pez
 		return @content
 	end 
end
 


# 1. DRIVER TESTS GO BELOW THIS LINE

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)

puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
puts super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"
puts super_mario.see_all_pez 

def assert
	raise "Assertion failed" unless yield
end

assert { PezDispenser.instance_method(:initialize).arity == 1 }
assert { PezDispenser.instance_method(:add_pez).arity == 1 }
assert { super_mario.pez_count == flavors.length }
assert { super_mario.respond_to?('get_pez')}
assert { super_mario.respond_to?('add_pez')}
assert { super_mario.see_all_pez.class == Array }


# 5. Reflection 
=begin
What parts of your strategy worked? What problems did you face?
The user story was easy to understand; writing assertions and the pseudocode went very well. I could translate
my pseudocode into the initital solution to immediatly make all test passing and therefore solving the challenge.

What questions did you have while coding? What resources did you find to help you answer them?
I looked up the difference between #shif and #unshift as I always confuse which one is adding/deleting
I also looked up the class method arity to broaden my assertions

Array - #shift http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-shift
Class::arity - http://www.ruby-doc.org/core-2.1.1/Method.html#method-i-arity
=> Returns an indication of the number of arguments accepted by a (instance)method. 
=> Returns a nonnegative integer for methods that take a fixed number of arguments. 
=> For Ruby methods that take a variable number of arguments (*arg), returns -n-1, where n is the number of required arguments. 

Did you learn any new skills or tricks?
using Class::arity; but I need more practice to get a hang of it

How confident are you with each of the learning objectives?
Implement a basic Ruby class and identify when to use instance variables - confident
Translate a user story into driver code and solutions - confident
Translate driver test code into a class structure using object-oriented design - confident

Which parts of the challenge did you enjoy? the whole thing; I haven't eaten pez for a looong time and I definitly try to get some soon :)

Which parts of the challenge did you find tedious?
I must say that the addition information given as driver test, i.e. in this case the puts statements really helped me to
fully understand the user story and what each method should do/return. I am not sure whether the user story could have been phrased 
a little bit differently or whether it is just an issue of non being a non-native speaker that more and more details are always great
to understand a text/ action 100% :)
=end