# U2.W6: Refactoring for Code Readability


# I worked on this challenge [with: Chris Aubochon and Hunter Chapman].


#Pseudocode
#create class credit card
#def init
#def instance variable number
#make arguement error for if card number is not length 16
#def double
#the function will double the numbers with an odd index
#create a sum function
# sum will take the value from double and inject the values into a new array as to separate compound numbers
# def a method check_card 
# this method will return true or false 


# GROUP REFACTOR
class CreditCard
  def initialize(number)
    @arr_num = number.to_s.split(//)
    @doubled_value = double
    @number = number
    raise ArgumentError.new("That is not a vaild number") if @number.to_s.length != 16
  end

  def double
    cal = []
    @arr_num.each_with_index do |value, index|
      if index.even?
        value_doubled = value.to_i * 2
        value_doubled.to_s.split(//).each { |val| cal << val.to_i }
      else
        cal << value.to_i
      end
    end
    @doubled_value = cal.inject(:+)
  end
    
  def check_card
    return true if @doubled_value % 10 == 0
    false
  end
end


# CHRIS's Solution

# class CreditCard
# 	def initialize(number)
# 		@number = number# set number to instance variable
# 		if @number.to_s.bytesize != 16 #make sure card number is 16 length
# 			raise ArgumentError.new("Please enter a vaild length card number")#if not argument error
# 		end
# 	end

# 	def check_card #define check card
# 		sum = 0 #set sum to 0
# 		y = 0 #set an extra variable to 0
# 		holder = [] #set a holder array to 0
# 		que = [] #set que to 0
# 		@number.to_s.each_char{|x| holder << x} #set number to a string and then take each char and push it to holder
# 		holder.map!{|x| x.to_i}.reverse! #take the new array and map it to integers and then reverse it
# 		while y < holder.length #while y is less than the array length of holder
# 			holder[y + 1] = holder[y + 1] * 2 # for every holder[1,3,5.etc] multiply by 2
# 			y += 2 #y goes up by 2
# 		end
# 		holder.reverse!.join.to_i.to_s.each_char{|x| que << x} #take modified holder array reverse it join the array send it to int then to s then sep by each_char and push to que
# 		que.map!{|x| x.to_i}.each{|x| sum += x} #take q and map it to int and then sum each value 
# 		if sum % 10 == 0 #if sum % 10 is true 
# 			return true 
# 		else # if it is not
# 			return false
# 		end
# 	end
# end

        
# CHRISTIANE's Original

=begin
class CreditCard
  def initialize(num)
    @num = num
    @arr_num = num.to_s.split(//)
    if @arr_num.length != 16
      raise ArgumentError.new("Number must be 16 digits long")
    end
    @doubled = double
    @sum = sum
  end

  def double
    cal = Array.new
    @arr_num.each_with_index {|x, index|
      if index.even?
        cal.push(x.to_i * 2)
      else
        cal.push(x.to_i)
      end
    }
    return cal    #arr with 16 elements (integers)
  end

  def sum
    cal = Array.new
    @doubled = @doubled.map {|x| x.to_s.split('')}   #arr with 16 subarr whose elem are strings

    @doubled = @doubled.each {|x|
      if x.length == 2
        cal.push(x[0].to_i + x[1].to_i)
      else
        cal.push(x[0].to_i)
      end
    }

    result = cal.inject {|sum, x| sum += x}    #cal = arr of 16  integers
    return result # 70
  end

  def check_card
    if @sum % 10 
      return true
    else
      return false
    end
  end
end
=end

# HUNTER's Original

=begin
class CreditCard
	
	def initialize(num)
		raise ArgumentError.new("Invalid CC Number") if num.to_s.length != 16
		@num = num
	end

	def check_card
		cc = @num.to_s.split("")
		cc_doubles = []

		cc.each_with_index do |value, index|
			if index % 2 == 0
				value_x2 = value.to_i*2
				value_x2.to_s.split(//).each { |i| cc_doubles << i.to_i } 
			elsif index % 2 == 1
				cc_doubles << value.to_i
			end
		end

		cc_sum = cc_doubles.reduce(:+)

		return true if cc_sum % 10 == 0 
		false
	end
end
=end
        
# 1. DRIVER TESTS GO BELOW THIS LINE

def assert 
  raise "Assertion Failed!" unless yield
end

assert {test = CreditCard.new(4563960122001999)
        test.check_card == true}

assert { new_card = CreditCard.new(4408041234567892)
         new_card.check_card == false} 

assert { good_card = CreditCard.new(4408041234567893)
         good_card.check_card == true}



# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
    #  Our strategy was to use a better approach using the best practices described in the book "POODR".  These practices were
    # to make sure and have each method only doing a specific action.  We faced a few problems with the scope of instance variables.
# What questions did you have while coding? What resources did you find to help you answer them?
    # Why is our variable not getting the values from the other methods.  We used trial and error to solve.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
    #We were having trouble with the scope of instance variables, but we figured out how to define them correctly.  Also how to call 
    #methods from within our class, but this was also solved by giving our instance methods proper scope.
# Did you learn any new skills or tricks?
    #Yes!  We learned how to give our instance variables proper scope as to make them pass information to the other instance methods.
# How confident are you with each of the learning objectives?
    #We all feel much more confident with these objectives after refactoring from all of our code.
# Which parts of the challenge did you enjoy?
    #Getting the program to not return errors.
# Which parts of the challenge did you find tedious?
    #Getting the program to not return errors :)!