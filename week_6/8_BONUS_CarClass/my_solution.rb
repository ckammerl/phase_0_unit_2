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
class Car
	attr_accessor :model, :color
	attr_reader :speed, :distance

	def initialize(model, color)
		@model = model
		@color = color
		@speed = 0
		@distance = 0 
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
end 


class Pizza
end 


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
car = Car.new("BMW", "darkgreen")

puts "Your car has been created! It is a #{car.model}, the color is #{car.color}"
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
puts "You drove #{car.get_travel_distance} miles so far."





# 5. Reflection 