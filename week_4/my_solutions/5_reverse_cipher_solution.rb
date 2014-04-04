# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 


def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a # write the range of the letters 'a' to 'z' as array of strings; each letter 
                               # will be an element in the array 
    
    # calling Enum#.zip on the object alphabet with the argument alphabet.rotate(4):
    # => alphabet.zip returns an array of arrays; each array in the array of arrays will: 
    # => start with one element of the array alphabet merged with the element at the corresponding index num from 
    #    the (each) argument(s), in our case the first and second array of arrays include: 
    # => [[alphabet[0], alphabet_rotated_by_for[0]], [[alphabet[1], alphabet_rotated_by_four[1]] etc ]
    # => the arguemnt of alphabet.zip is (alphabet.rotate(4)) which returns an array by rotating 
    #    the object alphabet itself; the first element of the new array will be the element at 
    #    the index num defined by the given arguement, in this case index num 4 so that our alphabet_rotated_by_four[0] is 'e'
    # => alphabet_rotated_by_four = ('e..d').to_a
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] 
    # cipher is a new hash that takes a single argument which is an array of arrays and therefore key-value pairs:
    # => cipher = {alphabet[0] => alphabet_rotated_by_for[0], alphabet[1], alphabet_rotated_by_four[1] etc }
    # =>              key             values                        key                 value

    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    original_sentence = sentence.downcase
    encoded_sentence = []
    original_sentence.each_char do |element| # each_char passes the given block to each character (letter or space) of the string
      if cipher.include?(element) # checks if element is key in cipher
        encoded_sentence << cipher[element] #push the value of the key cipher[element] into array encoded_sentence
      elsif element == ' '
        encoded_sentence << spaces.sample # push one randon element of the array spaces
      else 
        encoded_sentence << element
      end
     end
    
    return encoded_sentence.join # convert array encoded_sentence into one string
end



#Refactored solution
def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] 
    spaces = ["@", "#", "$", "%", "^", "&", "*"] 
    
    original_sentence = sentence.downcase
    encoded_sentence = []
    original_sentence.each_char do |element| 
      if cipher.include?(element)             
        encoded_sentence << cipher[element] 
      else 
        encoded_sentence << spaces.sample       # deleting elsif statement; as the keys of the hash cipher are
                                                # actually the full alphabet, element of original_string will always 
                                                # be a key of cipher; only if the element is a space, we will push a 
                                                # random element of the array space into the array encoded sentence
      end
    end 
    return encoded_sentence.join # convert array encoded_sentence into one string
end



# Questions:
# 1. What is the .to_a method doing?
# write the range of the letters 'a' to 'z' as array of strings; each letter 
# will be an element in the array 

# 2. How does the rotate method work? What does it work on?
# the arguemnt of alphabet.zip is (alphabet.rotate(4)) which returns an array by rotating 
# the object alphabet itself; the first element of the new array will be the element at 
# the index num defined by the given arguement, in this case index num 4 so that our alphabet_rotated_by_four[0] is 'e'
    # => alphabet_rotated_by_four = ('e..d').to_a

# 3. What is `each_char` doing?
# "string".each_char {block} passes the given block to each character (letter) of the string

# 4. What does `sample` do?
#  array.sample = pick one randon element of the array 

# 5. Are there any other methods you want to understand better?
# array.zip(arg) 
# => calling Enum#.zip on the object alphabet with the argument alphabet.rotate(4):
    # => alphabet.zip returns an array of arrays; each array in the array of arrays will: 
    # => start with one element of the array alphabet merged with the element at the corresponding index num from 
    #    (each) given argument(s); in our case the first and second array of arrays include: 
    # => [[alphabet[0], alphabet_rotated_by_for[0]], [[alphabet[1], alphabet_rotated_by_four[1]] etc ]

# var = Hash[[],[]]
# => creates a new hash 
# => in this form, it takes a single argument which is an array of arrays and therefore key-value pairs

# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
=begin
REFACTORED solution of the GROUP CIPHER challenge:

decipher_array_key1 = ("e".."z").to_a 
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

Our solution is reconstructing a hash cipher, which is actually the result of calling .invert on 
this challenge's hash cipher, using a for loop and by iterating through arrays of keys.
You could also write it as array of arrays and therefore as hash of key-value pairs like so:

decipher_array = [ [[decipher_array_key1], [decipher_array_value1]], [[decipher_array_key2], [decipher_array_value2]] []
which is equal to 
decipher_hash = Hash[ [[decipher_array_key1], [decipher_array_value1]], [[decipher_array_key2], [decipher_array_value2]] ]

=> we have to use two arrays within decipher_array as our input are two different alphabetically sorted ranges of char (letters).
What's worse about our solution: if were to change how the keys are shifted, for instance
10 letters instead of 4 letters of the alphabet, we coudn't easily do it. 
=end  

# 7. Is this good code? What makes it good? What makes it bad?
=begin
  
It is good and the way the code created the key-value pairs of the hash cipher is fast and clean. The code only uses one
if statement (refactored solution) and in sum, the whole method is DRY.
The method translate_to_cipher writes the hash cipher in only one line  -- cipher = Hash[alphabet.zip(alphabet.rotate(4))] 
and that is much faster than what our group solution did. We could have written the same variable (i.e. cipher) and 
only called .invert on it to get the new hash cipher.

The method translate_to_cipher can also easily be adjusted and create new cipher hashes by changing only the argument of
alphabet.rotate(10) in order to shift the keys 10 letters instead of 4 letters of the alphabet.

Without the elsif statement, there is no unnessary code in my opinion. 

What I don't like is that the returned output will always be .downcase.
=end


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
=begin
The corresponding values of each key in cipher never change, therefore: 

original_sentence.each_char do |element| 
      if cipher.include?(element)             
        encoded_sentence << cipher[element]  

if true - will always, at each call, push the same value into the array encoded_sentence and
only the symbols, pushed into the array encoded_sentence - if condition is not true -  are changing due to .sample
=end

p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 
=begin
Did you learn any new skills or tricks?
It's always very helpful to review code and to be forced to look at each line in order to leave a comment. I learned a couple of new
methods in this challenge and the need to describe what they do in my own words definitly ensured I understand them.

-Array: .zip   http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-zip
-Array: .rotate()   http://www.ruby-doc.org/core-2.1.1/Array.html#method-i-rotate
-Hash: Hash[[]]  http://www.ruby-doc.org/core-2.1.1/Hash.html#method-c-5B-5D
-Hash: .include?() checking keys
-Hash: .invert like array.reverse  http://www.ruby-doc.org/core-2.1.1/Hash.html#method-i-invert
-String: .char   http://ruby-doc.org/core-1.9.3/String.html#method-i-each_char

How confident are you with each of the learning objectives?
Identify and explain what code is doing - confident
Research and explain how methods work- confident
Determine whether code follows good practices - confident, but definitly room for improvement

=end