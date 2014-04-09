# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: 
# Parjam Davoody


# Our Refactored Solution
def bakery_num(num_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  
  cookie_qty = 0
  quantity = 0

  if my_list.has_key?(fav_food) == false 
     raise ArgumentError.new("You can't make that food")
  else 
    fav_food_qty = my_list.values_at(fav_food)[0] 
      if num_people % fav_food_qty == 0 
        num_food = num_people / fav_food_qty
        return "You need to make #{num_food} #{fav_food}(s)."
      else 
        while num_people > 0
          if num_people / my_list.values_at(fav_food)[0] > 0 
             quantity = num_people / my_list.values_at(fav_food)[0]
             num_people = num_people % my_list.values_at(fav_food)[0] 
          else
              cookie_qty = num_people
              num_people = 0
          end
        end
        return "You need to make #{quantity} #{fav_food}(s), and #{cookie_qty} cookie(s)."
      end
  end
end

#NEW DRIVER CODE
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError
p bakery_num(41, "cake") == "You need to make 6 cake(s), and 5 cookie(s)."




#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!




#  Reflection 



