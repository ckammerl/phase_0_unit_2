# U2.W4: homework_cheater


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: strings and integer
# Output: string (template)
# Steps:

# WRITE a method essay_writer which takes strings and integer as input; the input, i.e. arguments are title (string), subject (string), 
# 	 a year (4 digits, integer), a thesis_statement (string)

# IF year is not written like YYYY, put "The year should be an integer and written YYYY."
# END

# IF the length of the subject splited equals 2
# => set a var capitalize_subject equal to the result of spliting the subject and calling map on it with the code block .capitalize 
# 		=> make sure to define the capitalize_subject (i.e. the result of the preceding step) as one single string
# END

# GET the length of the thesis statement by splitting it

# IF the length of the thesis statement is greater than 20
# => set a var formated_thesis_statement equal to the result of slicing the split thesis_statement into slices of 10 elements and adding a newline after each slice
# 		=> make sure to define the formated_thesis_statement (i.e. the result of the preceding step) as one single string
# ELSE set formated_thesis_statement equal to thesis_statement
# END 

# SET a varialbe 'template' equal to a long string 
# => to CREATE this long string, start with the words 'Essay by me' and continue using interpolation to insert the values of all parameters 
# => make sure to use the variables (modified parameters) you created within the method when interpolating

# RETURN 'template' 



# 3. Initial Solution

def essay_writer(title, subject, year, thesis_statement)
	upcase_title = title.upcase

	if year.to_s.length != 4
		puts "The year should be an integer and written YYYY."
	end 

	if subject.split.length == 2
		capitalized_subject = subject.split.map { |y| y.capitalize }.join(" ")
	else 
		capitalized_subject = subject.capitalize 
	end 

	count_thesis_statement = thesis_statement.split(/ /)
	if count_thesis_statement.length > 20
		formated_thesis_statement = count_thesis_statement.each_slice(10).to_a { |x| x.push("\n") }.join(" ")  #code not working properly

	else
		sorted_thesis_statement = thesis_statement
	end 

	template = "Essay by me\n#{upcase_title}\n\nThe year #{year} is an important date when talking about #{capitalized_subject}.\s#{capitalized_subject}\s#{formated_thesis_statement}"

	return template
end


puts essay_writer("famous discoverer", "Christopher Columbus", 1492, "born between October 31, 1450 and October 30, 1451 – 20 May 1506)
was an Italian explorer, navigator, and colonizer, born in the Republic of Genoa (Italy). Under the auspices ofthe Catholic Monarchs of Spain,
he completed four voyages across the Atlantic Ocean that led to general European awareness of the American continents. Those voyages, and his
efforts to establish permanent settlements on the island of Hispaniola, initiated the Spanish colonization of the New World.")

puts ""

puts essay_writer("famous scientists", "marie curie", 1903, "was a Polish and naturalized-French physicist and chemist (7 November 1867 – 4 July 1934) 
who conducted pioneering research on radioactivity. She was the first woman to win a Nobel Prize in 1903. She was also the first woman to become a professor
at the University of Paris, and in 1995 became the first woman to be entombed on her own merits in the Panthéon in Paris.")


# 4. Refactored Solution

def essay_writer(title, subject, year, thesis_statement)
	upcase_title = title.upcase

	if year.to_s.length != 4
		puts "The year should be an integer and written YYYY."
	end 

	if subject.split.length == 2
		capitalized_subject = subject.split.map { |y| y.capitalize }.join(" ")
	else 
		capitalized_subject = subject.capitalize 
	end 

	count_thesis_statement = thesis_statement.split(/ /)
	if count_thesis_statement.length > 20
	    enum_with_array_of_10 = count_thesis_statement.each_slice(10) # step by step, code now working
	    array_with_array_of_10 = enum_with_array_of_10.to_a
	    array_with_array_of_10_with_nl = array_with_array_of_10.each { |x| x.push("\n") }
	    formated_thesis_statement = array_with_array_of_10_with_nl.join(" ")
	else
		formated_thesis_statement = thesis_statement
	end 

	template = "Essay by me\n#{upcase_title}\n\nThe year #{year} is an important date when talking about #{capitalized_subject}.\s#{capitalized_subject}\s#{formated_thesis_statement}"

	return template
end


# I looked up how to write multiple line strings using "TEXT"\
puts essay_writer("famous discoverer", "Christopher Columbus", 1492 "(born between October 31, 1450 and October 30, 1451 – 20 May 1506) was an Italian explorer, "\
                                                      "navigator, and colonizer, born in the Republic of Genoa (Italy). Under the auspices ofthe Catholic "\
                                                      "Monarchs of Spain, he completed four voyages across the Atlantic Ocean that led to general "\
                                                      "European awareness of the American continents. Those voyages, and his efforts to establish "\
                                                      "permanent settlements on the island of Hispaniola, initiated the Spanish colonization of the New World.")



# Different solution using a class Person; After re-reading the instructions, I thought writing a class AND the method should be the best
# solution. I wrote the code after watching the dedicated Ruby tutorial at Treehouse and discussing the class concept again with a friend

class Person
	def initialize(name, pronoun, year)  # pronoun = "He" oder "She" oder "It"
		@firstname = name.split.first.capitalize
		@lastname = name.split.last.capitalize
		@pronoun = pronoun
		@year = year
		if check_year(year) == false
			puts "The year should be an integer and written YYYY."
			exit
		end 
	end 

	def getname()
		name = @firstname+" "+@lastname
        return name
	end

	def getpronoun()
		return @pronoun
	end

	def get_year()
		return @year
	end 

	def check_year(year)
		if year.to_s.length != 4
			return false
		else 
			return true
		end 
	end 
end 

	
def essay_writer(title, subject, thesis_statement)
	upcase_title = title.upcase

	count_thesis_statement = thesis_statement.split(/ /)
	if count_thesis_statement.length > 20		
		# step by step
	    enum_with_array_of_10 = count_thesis_statement.each_slice(10)
	    array_with_array_of_10 = enum_with_array_of_10.to_a
	    array_with_array_of_10_with_nl = array_with_array_of_10.each { |x| x.push("\n") }
	    formated_thesis_statement = array_with_array_of_10_with_nl.join(" ")
	else
		formated_thesis_statement = thesis_statement
	end 

	template = "Essay by me\n#{upcase_title}\n\nThe year #{subject.get_year} is an important date when talking about #{subject.getname}.\n#{subject.getpronoun} #{formated_thesis_statement}"

	return template
end

person1 = Person.new("Christoph Columbus", "He", 1492)
person2 = Person.new("Marie Curie", "She", 1903)


puts essay_writer("famous scientists", person2, "was a Polish and naturalized-French physicist and chemist (7 November 1867 – 4 July 1934) who conducted pioneering "\
													  "research on radioactivity. She was the first woman to win a Nobel Prize in 1903. She was also the first woman to become "\
													  "a professor at the University of Paris, and in 1995 became the first woman to be entombed on her own merits in the Panthéon in Paris.")



# 1. DRIVER TESTS GO BELOW THIS LINE
#First, write your generic template (store in a variable)

#template = "Essay by me\n#{title.upcase}\n\nThe year #{date} is an important date when talking about #{person.capitalize}.\s#{person.capitalize}\s#{thesis_statement}"


#Then identify the three topics and write out your ideal paragraph using your generic template. Store these in variables. 
=begin

a = "Essay by me\nFAMOUS DISCOVERER\n\nThe year 1492 is an important date when talking about Christopher Columbus. Christopher Columbus (born between October 31, 1450 and 
	October 30, 1451 – 20 May 1506) was an Italian explorer, navigator, and colonizer, born in the Republic of Genoa (Italy). Under the auspices of the Catholic 
	Monarchs of Spain, he completed four voyages across the Atlantic Ocean that led to general European awareness of the American continents. Those voyages, 
	and his efforts to establish permanent settlements on the island of Hispaniola, initiated the Spanish colonization of the New World."

b = "Essay by me\nFAMOUS SCIENTISTS\n\nThe year 1903 is an important date when talking about Marie Curie. Marie Curie was a Polish and naturalized-French physicist and 
	chemist (7 November 1867 – 4 July 1934) who conducted pioneering research on radioactivity. She was the first woman to win a Nobel Prize in 1903. She was also the 
	first woman to become a professor at the University of Paris, and in 1995 became the first woman to be entombed on her own merits in the Panthéon in Paris."

c = "Essay by me\nFAMOUS AUTHORS\n\nThe year 1831 is an important year when talking about Victor Hugo. Victor Hugo (26 February 1802 – 22 May 1885) was a French poet, 
	novelist, and dramatist of the Romantic movement. He is considered one of the greatest and best known French writers. Outside France, one of his best-known work is 
	'Notre-Dame de Paris', 1831 (known in English as The Hunchback of Notre-Dame). Though a committed royalist when he was young, Hugo's views changed as the decades passed, 
	and he became a passionate supporter of republicanism; his work touches upon most of the political and social issues and artistic trends of his time."

TEST
# p template == a || template == b || template == c

=end


# 5. Reflection 

=begin
What parts of your strategy worked? What problems did you face?
After reading the directions, especially the lines: 
"Identify and pass in a person/place/topic into the template" and
"Use the appropriate pronoun for a person (male or female), place, or thing (HINT: this may be a good place to try creating an object...)"
my first thought was, I should use a class to solve this challenge. But I also know me and that I sometimes tend to concentrate too much
and too long on details in the instructions and then end up thinking too complicated. Therefore, I first wrote the initial solution. I 
started with diver test. I am not sure I understood the driver code instructions correctly
but I wrote them the way they made sense to me. I defined the desired output first and stored it in the var template, then I 
worte 3 vars and set each equal to the result of calling the method essay_writer on these vars. The test actually follows all these steps. I have some trouble with coming up with good
driver code and in this case, I was not 100% clear on the instructions.

What questions did you have while coding? What resources did you find to help you answer them?

String: "Text"\ = how to write a multi-line string: http://stackoverflow.com/questions/2337510/ruby-can-i-write-multi-line-string-with-no-concatenation
Array: I went back to ruby-doc.org and re-read about .slice() {} - I will need further reading (using the method) to fully understand
		the return value which is Enumerator and how to use that class
String: "string".split.map {} = split string to get an array and then do sth to all its element: http://stackoverflow.com/questions/13520162/ruby-capitalize-every-word-first-letter

What concepts are you having trouble with, or did you just figure something out? If so, what?
I wanted to write a second solution and to use a class Person together with my method essay_writer; to understand the concept better, I watched:
Video Tutorial: Objects, Classes, Variables http://teamtreehouse.com/library/ruby-foundations#ruby-basics


Did you learn any new skills or tricks?
Absolutely! I invested some time to get a better understanding of building and using a class! The video tutorial helped, it was a good
refresher, and then I started writing the class Person. However, I needed to discuss how to use the instances of the class in my method with a 
friend who explained it to me. I don't think I will write my next solution using a class without facing any trouble, but 
I feel much better about how to build and use classes.

How confident are you with each of the learning objectives?
Translate a user story into driver code and solutions - I am not sure I understood the driver code instructions correctly
but I wrote them the way they made sense to me. 

Create methods that take arguments to modify the output - confident
Use if/else statements, string methods, while/until loops, Enumerable#each methods - confident
Differentiate between and produce destructive and non-destructive methods - confident


Which parts of the challenge did you find tedious?
I found the instructions/ given directions not to be completely clear.

=end
