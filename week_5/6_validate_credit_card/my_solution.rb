# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: an integer which is 16 digits long
# Output: 
# method #double returns an arr; 
# method #sum returns an integer
# method #check_card return bolean value
# Steps:
=begin

WRITE a class CreditCard which will be initialized with one arg called num
=> num is a 16 digit long integer
=> instance var @arr_num = num.to_s.split(//) to get an array whose 
    elements are the 16 digits (input) as single strings
=> IF @arr_num.length is less or greater than 16, raise an Argument Error
=> instance var @doubled = double
=> instance var @sum = sum

WRITE #double
=> SET a var cal eql to empty arr
=> ITERATE through @arr_num using #each_with_index
	IF the element's index num is odd?
		push element into arr cal
	ELSE double the value of this element
		push doubled element into arr cal
	END
=> return @doubled = cal

WRITE #sum
=> SET a var cal eql to empty arr
=> ITERATE through @doubled with map and call methods #to_s and #split(//) on each element; set the result eql to @double
=> ITERATE through @doubled using each to check the length of each subarray in @double
	IF subarray length is eql 2, then push the sum of the value of the 
	subarray's elem at index.first.to_i and elem at index.last.to_i into cal
   set the result eql to @doubled
=> SET @sum eql to the result of calling inject on cal which gives you the sum of all elements of cal as one integer
=> return @sum 

WRITE #check_card
=> IF @sum modulo 10 eql 0 
	return true
   ELSE
    return false
    END
=end


# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
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

test = CreditCard.new(4563960122001999)
puts test.check_card



# 4. Refactored Solution

class CreditCard
  def initialize(num)
    @num = num
    @arr_num = num.to_s.split(//)
    if @arr_num.length != 16
      raise ArgumentError.new("Number must be 16 digits long")
    end
    @doubled = double_idx_even  
    @sum = sum
  end

  def double_idx_even  #changed method name
    cal = Array.new
    @arr_num.each_with_index {|x, index|
      if index.even?
        cal.push(x.to_i * 2)
      else
        cal.push(x.to_i)
      end
    }
  
    return cal   #arr with 16 elements (integers)
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
    return result #70
  end

  def check_card
    if @sum % 10 
      return true
    else
      return false
    end
  end
end


# 1. DRIVER TESTS GO BELOW THIS LINE
p test.double.class == Array
p test.sum.class == Fixnum
p CreditCard.new(4563960122001999).check_card == true


# 5. Reflection 
=begin
What parts of your strategy worked? What problems did you face?
Writing a good guiding pseudocode worked very well. I only did minor changes to it to adjust it after
I wrote the initital solution. 

What questions did you have while coding? What resources did you find to help you answer them?
I remembered #each_with_index and looked it up again to confirm I'll use it correctly in my solution.
I also went back to look at the code block in #inject

- ENUMERABLE #inject   http://www.ruby-doc.org/core-2.1.1/Enumerable.html#method-i-inject
- ENUMERABLE #each_with_index   http://www.ruby-doc.org/core-2.1.1/Enumerable.html#method-i-each_with_index

Did you learn any new skills or tricks?
I was very glad to see that my understanding of and my skills of writing classes, using instance variables
as well as iterating through nested arrays worked out so well. It was very helpful to work on a couple of challenges 
this week. That really help me to improve!

How confident are you with each of the learning objectives? confident

Which parts of the challenge did you enjoy?
I really liked all challlenges this week as they had interesting stories and real life examples!
It's great to have examples that help you understand why and when to use classes!
=end  


