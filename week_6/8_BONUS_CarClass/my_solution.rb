# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [by myself].


# 2. Pseudocode
=begin
WRITE attr_accessor methods for :model and :color
WRITE attr_reader method for :speed, :distance

attributes
each instance of class Cars is inititalized with two arguments: model and color
set instance var @model eql to model
set instance var @color eql to color
set instance var @speed eql to 0
set instance var @distance eql to 0


methods	
WRITE a instance method #distance_to_drive that takes one argument "miles" (integer or float) 
 return the result of adding miles to @distance
end 
 
WRITE a method #check_location
 stop_and_right = 25
 school_zone = 26.5
 stop_and_left = 51.5
 goal = 52.9

if @distanc eql stop_and_right
	puts "You reached a stop sign. Stop and then turn right."

elsif @distanc eql school_zone
	puts "You reached school zone and must reduce your speed to 15 mph."

elsif @distanc eql stop_and_left
	puts "You reached a stop sign. Stop and then turn left."

elsif @distanc eql == goal
	puts "You reached your destination."
end   


WRITE a instance method #make_turn which takes one argument(string, left or right)
IF argument eql  string left
  puts "You took a left."
ELSE
  puts "You took a right"
end 


WRITE a instance method #accelerate(arg)
	 arg.times do @speed + 5 end
	 return @speed
	 puts "You're now driving #{@speed}."


WRITE a instance method #decelerate(arg)
 IF @speed eql 0
   puts "Your car is not moving at all, no need to decelerate."
 
 ELSE
	arg.times do @speed - 5 end
	 return @speed
	 puts "You're now driving #{@speed}."
END


WRITE a instance method get_travel_distance
 return @distance

=end


# 3. Initial Solution
=begin
	
class Car 
	attr_accessor :model, :color
	attr_reader :speed, :distance, :compartment

	def initialize(model, color)
		@model = model
		@color = color
		@speed = 0
		@distance = 0 
		@compartment = []
	end 

	def distance_to_drive(miles) 
		@distance = @distance + miles
	end 
 
	def check_location
 		stop_and_right = 25.0
 		school_zone = 26.5
 		stop_and_left = 51.5
 		goal = 52.9

		if @distance == stop_and_right
			puts "You reached a stop sign. Stop and then turn right."

		elsif @distance == school_zone
			puts "You reached a school zone and must reduce your speed to 15 mph."

		elsif @distance == stop_and_left
			puts "You reached a stop sign. Stop and then turn left."

		elsif @distance == goal
			puts "You reached your destination."
		end   
	end

	def make_turn(direction)
		if direction == "left"
  			puts "You took a left."
		else
  			puts "You took a right"
		end 
	end 


	def accelerate(value)
	 	value.times do 
	 		@speed += 5 
	 	end
	 	puts "You're now driving #{@speed} mph."
	 	#return @speed
	end

	def decelerate(value)
		if @speed == 0
   			puts "Your car is not moving at all, no need to decelerate."
   		else
   			value.times do
   				@speed -= 5 
   			end 
   			puts "You're now driving #{@speed} mph."
 		end 
 		#return @speed
 	end 

 	def get_travel_distance
 		return @distance 
 	end

 	def get_delivery(pizza)
 		@compartment << pizza
 		puts "You now have a pizza '#{pizza.type}' in your compartment."
  	end

 	def deliver(pizza = @compartment.shift)
 		@compartment.delete(pizza)
 		return pizza.type
 		
 	end

end 


class Pizza
	attr_accessor :type

	def initialize(type)
		@type = type
	end
end 

=end


# 4. Refactored Solution


class Car 
	attr_accessor :model, :color
	attr_reader :speed, :distance, :compartment

	def initialize(model, color)
		@model = model
		@color = color
		@speed = 0
		@distance = 0 
		@compartment = []
	end 

	def distance_to_drive(miles) 
		@distance = @distance + miles
	end 
 
	def check_location
 		stop_and_right = 25.0
 		school_zone = 26.5
 		stop_and_left = 51.5
 		goal = 52.9

 		case @distance 		#using case statement
 		when stop_and_right
			puts "You reached a stop sign. Stop and then turn right."

		when school_zone
			puts "You reached a school zone and must reduce your speed to 15 mph."

		when stop_and_left
			puts "You reached a stop sign. Stop and then turn left."

		when goal
			puts "You reached your destination."
		end   
	end

	def make_turn(direction)
		puts "You took a left." if direction == "left" 		#one-line if
  		puts "You took a right" if direction == "right"
	end 


	def accelerate(value)
	 	value.times do 
	 		@speed += 5 
	 	end
		puts "You're now driving #{@speed} mph."
	 	return @speed
	end

	def decelerate(value)
		if @speed == 0
   			puts "Your car is not moving at all, no need to decelerate."
   		else
   			value.times do
   				@speed -= 5 
   			end 
   			puts "You're now driving #{@speed} mph."
 		end 
 		return @speed
 	end 

 	def get_travel_distance
 		return @distance 
 	end


 	def get_delivery(pizza)
 		@compartment << pizza
 		puts "You now have a pizza '#{pizza.type}' in your compartment."
  	end

 	def deliver(pizza = @compartment.shift)
 		@compartment.delete(pizza)
 		return pizza.type
 	end

 	def view_compartment 		#added #method
 		puts "Your compartment still holds the pizza(s): " 
 		@compartment.each {|pizza| puts "-" + pizza.type }
 	end 
end 


class Pizza
	attr_accessor :type

	def initialize(type)
		@type = type
	end
end 



# 1. DRIVER TESTS GO BELOW THIS LINE
car = Car.new("BMW", "darkgreen")
pizza1 = Pizza.new("Mozzarella")
pizza2 = Pizza.new("Verdura")
pizza3 = Pizza.new("Regina")

puts "Your car has been created! It is a #{car.model}, the color is #{car.color}"
puts ''
print "Get your delivery."
puts ''
car.get_delivery(pizza1)
car.get_delivery(pizza2)
car.get_delivery(pizza3)
puts ''
puts "You got the pizzas in order of delivery, that means the pizza '#{pizza1.type}' should be the first."
puts ''
puts "Accelerate your car by 6."
puts ''
car.accelerate(6)
puts ''
puts "You should now drive for 25 miles."
puts ''
car.distance_to_drive(25)
puts ''
puts "Check your speed: #{car.speed} mph - the tempo limit is 25 mph."
puts '' 
puts "In your case decelerating by 1 is appropriate."
puts ''
car.decelerate(1)
puts ''
puts "You drove 25 miles."
puts ''
car.check_location 
puts ''
puts "Your current speed is #{car.speed} and you must decelerate by 5 to stop."
puts ''
car.decelerate(5)
puts ''
car.make_turn("right")
puts ''
puts "You should now drive for 1.5 miles."
puts ''
car.distance_to_drive(1.5)
puts ''
puts "Check your speed - the tempo limit is 35 mph."
puts ''
puts "You just stopped and your speed is #{car.speed} mph. In your case accelerating by 7 is appropriate."
puts ''
car.accelerate(7)
puts ''
puts "You drove the 1.5 miles."
puts ''
car.check_location 
puts ''
puts "Check your speed: #{car.speed} mph. In your case decelerating by 4 is appropriate."
puts ''
car.decelerate(4)
puts ''
puts "Continue driving for another 25 miles."
puts ''
car.distance_to_drive(25)
puts ''
puts "Check your speed: #{car.speed} mph - the tempo limit is now 25 mph. In your case accelerating by 2 is appropriate."
puts ''
car.accelerate(2)
puts ''
puts "Nice, you drove another 25 miles."
puts''
car.check_location
puts ''
puts "Your current speed is #{car.speed} and you must decelerate by 5 to stop."
puts ''
car.decelerate(5)
puts ''
car.make_turn("left")
puts ''
puts "Now drive 1.4 miles to reach your destination."
puts ''
car.distance_to_drive(1.4)
puts ''
puts "Check your speed - the tempo limit is 35 mph. You just stopped and your speed is #{car.speed}. In your case accelerating by 7 is appropriate."
puts ''
car.accelerate(7)
puts ''
puts "You drove 1.5 miles."
car.check_location
puts ''
puts "Now take out pizza to be deliverd, that is #{car.deliver}."
puts ''
puts "You drove #{car.get_travel_distance} miles so far."
puts ''
car.view_compartment



# 5. Reflection 
=begin
What parts of your strategy worked? What problems did you face?
Defining the attributes and methods of the class Car went very well. Also writing the driver test code based on the
instructions worked out well, but it took me quiet some time to translate the whole story into reasonable tests.
I first had difficulties to understand how the tow classes (Car and Pizza), work together or better how and what
I need to define as an argument in my class Car and what to return in order to get the targeted output.


What questions did you have while coding? What resources did you find to help you answer them?
I went back to challenge number 2_Drawer_debugger. The methods (actions) are similiar and looking at that code 
helped me implement my solution. I understood that the instance car can work with an instance of Pizza but I have to
be carefull on how to use these Car #methods in the driver test codes and consider their RETURN VALUE.

What concepts are you having trouble with, or did you just figure something out? If so, what?
I have to consider all instance methods RETURN VALUE in order to write proper driver test codes:

- interpolation like #{car.delivery} works because I wrote the method (#delivery) so that it returns the value of
the instance of Pizza (pizza.type = 'string'). The return value can therefore be 'puts'

- calling a method directly, for instance car.view_content also returns all values of the instances of Pizza left in my compartment because I wrote
#view_compartement so that it returns each pizza.type (='strings'). The return value can therefore be 'puts'

=> the way I wrote Class Pizza, calling the type of each instance (pizza.type) returns a string and in this case it is
the only return value that I can use in a puts statement. The car class can work with the instance of Pizza itself (like car.get_delivery) but
the output (return value) - if it should be readable (puts) - has to be the instance's value (pizza.type) as this is a string.


How confident are you with each of the learning objectives? confident

=end