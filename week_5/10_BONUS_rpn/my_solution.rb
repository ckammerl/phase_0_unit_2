# U2.W5: Implement a Reverse Polish Notation Calculator

# I worked on this challenge [with: -].

# 2. Pseudocode

# Input: string of num and operators
# Output: integer
# Steps:


# 3. Initial Solution

=begin
class RPNCalculator
	def initialize
	end 
=end 

# method working for expression with three elements ['70', '10', +']
  def evaluate(rpn_expression)
  	input_arr = rpn_expression.split 
 	len = input_arr.length
 
	i = 2
  	if len == 3 

			if input_arr[i] == "+" 
  				sum = input_arr[i-2].to_i + input_arr[i-1].to_i   
  				result = sum

  			elsif input_arr[i] == "-" 
  				subtr = input_arr[i-2].to_i - input_arr[i-1].to_i
  				result = subtr
  			else
  				input_arr[i] == "*" 
  				mult = input_arr[i-2].to_i * input_arr[i-1].to_i
  				result = mult
  			end 


# tried to find a solution for expr with more than 3 elements, but implementation below failed. Working on it :)

=begin  

  	elsif
		while i < len 

  				if input_arr[i] == "+" 				   #true for ['70', '10', '4', '+', '5', '*', -]
  				sum = input_arr[i-2].to_i + input_arr[i-1].to_i   
  				delete_index = i - 2
  				input_arr.delete_at(delete_index) 
  				input_arr.delete_at(delete_index) 
  				input_arr.delete_at(delete_index) 
  				input_arr.push(sum)               # input_arr now ['70', '5', '*', '-', 14]
          ...                                  #going nowhere with this code implementation; 
                                               #way too complicated, besides not being DRY	
                                               #Working on another implementation with Array #pop and #push
                                      

  			elsif input_arr[i] == "-" 
  				subtr = input_arr[i-2].to_i - input_arr[i-1].to_i
  				delete_index = i - 2
  				input_arr.delete_at(delete_index) 
  				input_arr.delete_at(delete_index) 
  				input_arr.delete_at(delete_index) 
  				input_arr.push(subtr) 
  			else
  				input_arr[i] == "*" 
  				mult = input_arr[i-2].to_i * input_arr[i-1].to_i
  				delete_index = i - 2
  				input_arr.delete_at(delete_index) 
  				input_arr.delete_at(delete_index) 
  				input_arr.delete_at(delete_index) 
  				input_arr.push(mult) 
  			end 
  		i+=1
  		end 
  	end 
  	return result
  end 

=end 

#p evaluate('70 10 +')
#p evaluate('70 10 4 + 5 * -')

# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE






# 5. Reflection 
