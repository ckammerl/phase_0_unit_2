# U2.W4: Cipher Challenge

=begin
1. Run the code to see what the expected output is.
2. Write tests using driver test code. What can you rely on? What can't you rely on?
3. Copy the initial code and identify what each line of code is doing. Write comments next to or above each line with an explanation.
Really focus on breaking each step down. You want to understand every line.
4. [Refactor (by rewriting) the initial solution](../references/refactoring.md)
  - Clean up the variable names. 
  - The original code used a hard-coded hash to do the encryption. Can you create a simple algorithm instead? The original 
    shift was by 4 characters. What would happen if it was changed to 10? 
5. [Reflect](../references/reflection_guidelines.md)
6. Sync your changes (push your solution) to Github, then email your code to your accountability group.
7. [Review](../references/review.md) the other solutions in your accountability groups. Were the solutions different? What
   did the others do well or better than you? What did you do well? Comment on each solution. Arrange a half hour discussion
   on the weekend to discuss your different approaches.  
=end 


# pairing session
# Jon Pabico
# Christiane Kammerl


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.

def north_korean_cipher(coded_message)
  # set a new var called input equal to calling .downcase and .split on the
  # input (coded_message) to return an array of strings of individual characters
  input = coded_message.downcase.split("") 

  decoded_sentence = [] # define a new empty array called decoded_sentence

  # write a hash called cipher with a key-value pair; the inidiviual keys are the elements of 
  # the input as array of strings; the resp. values are letters of the alphabet;
  # keys are shifted 4 letters of the alphabet from the values (e => a)
  cipher = {"e" => "a",   
            "f" => "b",   
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # each element (individual string character) of the input array is going to do the following...

# the purpose of the variable found_match being set equal to false is to make sure that the deciphering actually occurs
    found_match = false  

    cipher.each_key do |y| # each key of the hash cipher is going to do the following...

# it is checking if it is true that each key of the hash cipher is equal to each element of the input array (which is at the same time the value in the hash)
      if x == y  
        #if true 
        puts "I am comparing x and y. X is #{x} and Y is #{y}." #prints out the string values of x and y as a string

    decoded_sentence << cipher[y] # the value of the hash cipher (the decoded letter) defined by the key y is pushed into the array decoded_sentence 
        found_match = true
        break  # when condition equals true, break and do not continue comparing this key but go back to cipher.each_key do |y| and check the next key in your hash

       # if x as element (individual string character) of the input array  is one of the following signs, replace it with a space and push it into the array decoded_sentence 
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        decoded_sentence << " "
        found_match = true
        break

      # if x as element (individual string character) of the input array is an integer within the range from 0 to 9, push the integer into the array decoded_sentence 
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # no deciphering of x needed; x as element (individual string character) of the input array will be pushed into the array decoded_sentence 
      decoded_sentence << x
    end
  end
  # merges all elements in the array decoded_sentence into one single string and makes decoded_sentence an object of String
  decoded_sentence = decoded_sentence.join("") 
                                                
 
  # create a copy of the string stored in var decoded_sentence and then look at each letter of the string to see if it is a digit;
  # any digit you find in the copied string, make it an integer and then divide it by 100; then return the adjusted copied string (destructive method)
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  return decoded_sentence # returns an object of String, namely the adjusted copy of the string stored in var decoded_sentence, i.e. its digits .to_i and divided by 100      
end



# Your Refactored Solution

def north_korean_cipher(coded_message)
  input_as_arr_of_letters = coded_message.downcase.split("") # changed var name 
  decoded_sentence = []
  
  decipher_array_key1 = ("e".."z").to_a # changed var names 
  decipher_array_value1 = ("a".."v").to_a 
  decipher_array_key2 = ("a".."d").to_a 
  decipher_array_value2 = ("w".."z").to_a 
  
 
  cipher = {}
  for i in 0...decipher_array_key1.length
    cipher[decipher_array_key1[i]] = decipher_array_value1[i]
  end
  
  for i in 0...decipher_array_key2.length
    cipher[decipher_array_key2[i]] = decipher_array_value2[i]
  end
 
            
  input_as_arr_of_letters.each do |x| 
    found_match = false  
    cipher.each_key do |y| 
      if x == y  
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        decoded_sentence << " "
        found_match = true
        break
      elsif (0..9).to_a.include?(x) 
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")
 
  if decoded_sentence.match(/\d+/) 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence      
end


# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!").class == String
p north_korean_cipher("m^aerx%e&gsoi!") != north_korean_cipher("m^aerx%e&gsoi!").capitalize
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"


# Reflection

=begin

What parts of your strategy worked? What problems did you face?
The first task was to write additional driver tests; we quickly managed to identify the returned output of the various calls and to use for additional
driver code; we also had a couple of ideas of what else we could test but we both agreed that although the test are valid, they are not very sophisticated :)
Finding a better and faster way to decipher and using the known key-value pairs to build up arrays, looping, i.e. iterating through them in order to 
define the matching key-value pairs worked right away. However we looked up ruby-doc.org to confirm that we can build a range of strings


What questions did you have while coding? What resources did you find to help you answer them?
We looked up ruby-doc.org to confirm that we can build a range of strings:
- Range: http://www.ruby-doc.org/core-2.1.1/Range.html


What concepts are you having trouble with, or did you just figure something out? If so, what?
This exercise helped me to understand some methods and commands much better:

- calling the method .join() on an array of strings not only merges the elements into a single string but RETURNS a string
- if statements: setting a varialbe to false first in order to ensure that some actions will actually be taken
- if statement: use 'break' to ensure that a test which looks a each element of an array stops right after the condition becomes 
  true (or false if that is the state to be reached)

How confident are you with each of the learning objectives?
Identify and explain what code is doing - confident; discussing the code helped me understand some code parts much faster, like the purpose of setting
found_match equal to false!

Automate repetitive tasks using loops - confident

Decompose a problem into smaller, easier to solve components - confident

Identify and rewrite repetitive code - confident; doing that in a pairing session and to discuss different approaches before starting to refactor makes it not
only more fun but actually improves refactoring. I think that as a team, we found a good solution faster compared to tackle that alone.

Which parts of the challenge did you enjoy?
I very much enjoyed this challenge as we worked as a perfect team.
  
=end
 
