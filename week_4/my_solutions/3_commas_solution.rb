# U2.W4: 3_commas_solution.rb


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: integer
# Output: integer comma-separted returned as string
# Steps:
=begin
WRITE a method seperate_comma which takes an num (integer) as input
SET num_as_string equal to calling to_s on num
SET num_as_arr_of_strings equal to calling split(//) on num_as_string
SET num_len equal to calling .length on num_as_string

WHEN num_len < 3
	set result equal to num_as_string

WHEN num_len equal 4
	set var a equal to inserting a comma as string to num_as_arr_of_strings at index 0
	set result equal to calling the method join on var a 

WHEN num_len equal 5
	set var b equal to inserting a comma as string to num_as_arr_of_strings at index 1
	set result equal to calling the method join on var b

WHEN num_len equal 6
	set var c equal to inserting a comma as string to num_as_arr_of_strings at index 2
	set result equal to calling the method join on var c

WHEN num_len iequal 7
	reuse var a
	set var d equal to inserting a comma as string to var a at index 5
	set result equal to calling the method join on var d
END

RETURN result
=end


# 3. Initial Solution
def seperate_comma(num)
	num_as_string = num.to_s
	num_as_arr_of_strings = num_as_string.split(//)
	num_len = num_as_string.length

	case num_len
	when 0...4
		result = num_as_string
	when 4
		a = num_as_arr_of_strings.insert(1, ",")
		result = a.join(" ")
	when 5
		b = num_as_arr_of_strings.insert(2, ",")
		result = b.join(" ") 
	when 6
		c = num_as_arr_of_strings.insert(3, ",")
		result = c.join(" ")
	when 7
		a = num_as_arr_of_strings.insert(1, ",")
		d = a.insert(5, ",")
		result = d.join(" ")
	end

	return result
end 

# 4. Refactored Solution

def seperate_comma(num)
  num_as_string = num.to_s
  num_as_arr_of_strings = num_as_string.split(//) #["1", "2" "3"]
  num_len = num_as_string.length

      if (0..3).include?(num_len)
        result = num_as_string
      elsif
         (4..6).include?(num_len)
       	i = num_len - 3
        a = num_as_arr_of_strings.insert(i, ",")
        result = a.join("")
      else
      	b = num_as_arr_of_strings.insert(1, ",")
		c = b.insert(5, ",")
		result = c.join("")
       end
    return result
 end

p seperate_comma(0)
p seperate_comma(100)
p seperate_comma(1000) 
p seperate_comma(400444) 
p seperate_comma(9999111) 



# 1. DRIVER TESTS GO BELOW THIS LINE

p seperate_comma(100).class == String
p seperate_comma(100) == "100"
p seperate_comma(1000) == "1,000"
p seperate_comma(40000) == "40,000"
p seperate_comma(400444) == "400,444"
p seperate_comma(9999111) == "9,999,111"  


# 5. Reflection 
=begin
What parts of your strategy worked? What problems did you face?
I didn't face any problems in this challenge. After I solved the problem using a case statement, I 
saw the how the num_len is linked to the index num to insert the comma. I was able to shorten the code and to 
automate parts of the  process in the refactored solution.

What questions did you have while coding? What resources did you find to help you answer them?
I looked up ruby-doc.org in order to find a build-in method that helps me to insert the comma at specific index num:

- Array: .insert(index, obj) => arr http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-insert

How confident are you with each of the learning objectives? - confident

Which parts of the challenge did you enjoy?
all of it

=end

