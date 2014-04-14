# U2.W6: Testing Assert Statements


# I worked on this challenge [by myself].


# 2. Review the simple assert statement
=begin
def assert
  raise "Assertion failed!" unless yield
end
 
name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }
=end
# 2. Pseudocode what happens when the code above runs
# Method assert raises error unless the test (assert) is true - if true, the test (assert) will be yielded;
# first assert in line 14 returns true; no error raised
# second assert in line 15 is false and therefore the test (assert) will not be yielded to the error,
# i.e. the message "Asserton failed!"(RunTimeError) is raised



# 3. Copy your selected challenge here
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
=begin
test = CreditCard.new(4563960122001999)
p test.double_idx_even.class == Array
p test.sum.class == Fixnum
p CreditCard.new(4563960122001999).check_card == true

=end

# 4. Convert your driver test code from that challenge into Assert Statements
def assert
	raise "Assertion failed" unless yield
end 

def assert_instance_of
	raise "Assertion failed" unless yield
end 


test = CreditCard.new(4563960122001999)

assert { test.check_card == true }
assert_instance_of { test.double_idx_even.class == Array }
assert_instance_of { test.double_idx_even.class == String }
assert_instance_of { test.sum.class == Fixnum }



# 5. Reflection 
=begin
What questions did you have while coding? What resources did you find to help you answer them?
I did some research to get more information about possible assert methods; found a good overview
of possible /commonly used assertions here: http://ruby.about.com/od/testdrivendevelopment/qt/assertions.htm

Did you learn any new skills or tricks?
It was good to read the material you suggested and to repeat how yield is used and also to refresh
procs and lambdas at codeacademy

How confident are you with each of the learning objectives? good start with this challenge and confident more challenges
will help to memorixe assertions;

=end