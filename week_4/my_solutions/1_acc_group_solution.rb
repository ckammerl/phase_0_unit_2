# U2.W4: 1_acc_group_solution

# I worked on this challenge [by myself].

# 2. Pseudocode
# Input:  array of strings

# Output: three individual units of sub-arrays of original array of strings; 
# => each sub-array containing min. 4 elements of original array if possible; 
# => total elements of all sub-arrays in each unit should equal total elements of original array

# Steps:
# 1. WRITE the method 'create_groups' which takes an array 'arr' as argument
# 2. CREATE a new instance of Array called 'group' 
# 3. SET a variable 'unit_1' equal to the result of sub-strings pushed into array 'group'
# => get the sub-strings by slicing 'arr' into sub-arrays
# => each sub-array should contain 4 elements of 'arr' if possible
# 4. SET a variable 'unit_2' equal to the result of sub-strings pushed into array 'group'
# => shuffle 'arr' first to get a new, shuffled 'arr'
# => get the sub-strings by slicing shuffled 'arr' into sub-arrays
# => each sub-array should contain 4 elements of 'arr' if possible
# 5. REPEAT step 4 for varialbe 'unit_3'
# 6. PUSH unit_1, unit_2 and unit_3 in a variable 'result'
# 7. RETURN 'result'


# 3. Initial Solution

def create_groups(arr)
	group = []
	unit_1 = arr.each_slice(4).to_a { |x| group.push(x) }
	unit_2 = arr.shuffle.each_slice(4).to_a { |x| group.push(x) }
	unit_3 = arr.shuffle.each_slice(4).to_a { |x| group.push(x) }
	
	result = []
	result = result.push(unit_1) 
	result = result.push(unit_2)
	result = result.push(unit_3)

	puts "Accountability groups - unit_1: #{unit_1.inspect}"
	puts ""
	puts "Accountability groups - unit_2: #{unit_2.inspect}"
	puts ""
	puts "Accountability groups - unit_3: #{unit_3.inspect}"

	return result
end 

create_groups(fence_lizards)


fence_lizards = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", "Andra Lally",
		"Andrew McDonald", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon", 
		"Clark Hinchcliff", "Devin Johnson", "Dominick Oddo", "Dong Kevin Kang", "Eiko Seino",
		"Eoin McMillan", "Eric Wehrli", "Hunter Chapman", "Jacob Persing", "Jon Pabico", 
		"Mary Huerster", "Parjam Davoody", "Samuel Davis", "Sebastian Belmar", "Shawn Seibert",
		"William Butler Bushyhead", "Yuzu Saijo", "Christiane Kammerl"]


# 4. Refactored Solution (different solution, discussed it with a friend)

=begin
def create_unit(arr, min_group_size)
	unit = []
	arr_shuffle = arr.shuffle

	num_group = arr_shuffle.length / min_group_size #6
	num_group.times do unit.push([]) end 
	
	for i in (0..arr_shuffle.length - 1)
		group_index = i % num_group
		person = arr_shuffle[i]
		unit[group_index].push(person)
	end 

	return unit
end

def create_multiple_units(arr, min_group_size, num_units)
	multiple_units = []
	x = 0
	num_units.times do 
		unit = create_unit(arr, min_group_size)
		multiple_units.push(unit) 
		x += 1
		puts "Accountability groups - unit_#{x}: #{unit.inspect}"
		puts ""
	end

	return multiple_units
end


create_multiple_units(fence_lizards, 6, 3)
=end

# 1. DRIVER TESTS GO BELOW THIS LINE

puts (create_groups(fence_lizards)).class == Array
puts ""
puts create_groups(fence_lizards).length == 3
puts ""
puts create_groups(fence_lizards).at(0) != create_groups(fence_lizards).at(1) && create_groups(fence_lizards).at(0) != create_groups(fence_lizards).at(2)
puts ""
puts create_groups(fence_lizards).at(1) != create_groups(fence_lizards).at(2) 


# 5. Reflection 
=begin
	
What parts of your strategy worked? What problems did you face?
I wasn't sure how to write the tests and I started with research on TDD. I found a couple of information on unit tests, 
studied them and got a feeling for them. In sum, it took my quite some time to write the tests prior to writing my initial solution.

What questions did you have while coding? What resources did you find to help you answer them?
I found it difficult this time to write my pseudocode and to describe each step in a 
good and clear way. The issue was how best to describe the chaining of methods. 

What concepts are you having trouble with, or did you just figure something out? If so, what?
TDD; found a couple of resources which describe more sophisticated TDD, but reading them helped me understand 
the whole concept much better:

TDD (unit tests):
http://mikeyhogarth.wordpress.com/2011/11/08/tdd-and-unittests-in-ruby/

http://ruby.about.com/od/testdrivendevelopment/a/tddcode.htm

http://ruby.learncodethehardway.org/book/ex47.html

http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing


Did you learn any new skills or tricks?
Got a much better feeling for TDD; found and used a couple of build-in methods I haven't used before:

Enumerable: .each_slice(size_of_slices) {code block}
Array: .shuffle() =>  if you use arr.shuffle() repeatedly, it won't return the same arr twice
Array: .sample()  =>  if you use arr.sample() repeatedly, it may take and return the same samples out of arr twice 


How confident are you with each of the learning objectives?
Break down problems into implementable pseudocode - as mentioned above, it wasn't that easy to find a nice way to describe chaining methods in my code
Use strings, integers, arrays, and/or hashes - confident
	
=end





