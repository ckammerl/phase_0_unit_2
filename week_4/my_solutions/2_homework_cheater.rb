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
		formated_thesis_statement = count_thesis_statement.each_slice(10).to_a { |x| x.push("\n") }.join(" ")

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


#TBD	




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

#TBD



