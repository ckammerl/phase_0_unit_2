# U2.W5: Virus Predictor

# I worked on this challenge [by myself].

# EXPLANATION OF require_relative
# 'require' is a build-in method of Ruby; calling 'require' gives me access to files
# or Ruby libraries which are NOT stored in the same directory as the file which is
# calling 'require'; 
# 'require_relative' gives me access to a file and its information (classes, methods, database)
# which are stored relativly close to the file calling 'require_relative';
# both, require and require_relative, are followed by the filename as string without the
# files ending (like .rb)
#

require_relative 'state_data'

class VirusPredictor

# initializes new instances of the class with 5 parameters;
# each parameter is set eql to an instance variable in order to 
# a) set the state of each new instance; instance variables are things each new instance "knows" as it is created but 
#    the instance variable's value can differ for each instance
# b) allow all instance methods to access/use them
  
  attr_reader :population #creates method population which returns @population

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

# virus_effects is the only instance method of the class VirusPredictor that can be accessed by object outside the class
# virus_effects calls 2 other instance methods of the class; it can read the values of the other two method's parameters as they are
# given as instance variables and therefore accessed by each method of the class
# virus_effect returns one string build out of two different strings each individually returned by one of the instance method it has called

  def virus_effects  
    predicted_deaths #no arguments needed (@population_density, @population, @state) as method predicted_death works with instance variables
    speed_of_spread #no arguments needed (@population_density, @state) as method predicted_death works with instance variables
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
  # => ALL following methods are private which means they can't be accessed from outside the class, ie. instance of the class
  # cannot call the following methods
  # => If private would include the method virus_effect, this method too woudn't be accessible by instance of the class 
  # and this class would not provide any functionality to its instances


# instance method calculating the individual num of death for each state
# takes 3 parameters whose values were defined when the new instance of the class was initialized 
# returns a string when called
# cannot be accessed from outside the class; called only within class by method virus_effect

def predicted_deaths #no parameters needed (population_density, population, state) as method working with instance variables
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  end


#instance method calculating the speed of the disease spread for the state 
# takes 2 parameters whose values were defined when the new instance of the class was initialized 
# returns a string when called
# cannot be accessed from outside the class; called only within class by method virus_effect
   def speed_of_spread #in months #no parameters needed (population_density, state) as method predicted_death works with instance variables; state not even used.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end
end



#Refactored Solution

require_relative 'state_data'

class VirusPredictor
  
  attr_reader :population #creates method population which returns @population

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects  
    predicted_deaths #no arguments needed (@population_density, @population, @state) as method predicted_death works with instance variables
    speed_of_spread #no arguments needed (@population_density, @state) as method predicted_death works with instance variables
  end

  private  

  def predicted_deaths #no parameters needed (population_density, population, state) as method working with instance variables
      i = 50
      j = 0.1
      if @population_density >= i
        while @population_density >= i && i <= 200
          number_of_deaths = (@population * j).floor
          i += 50
          j += 0.1
        end
      else
        number_of_deaths = (@population * 0.05).floor
      end
      print "#{@state} will lose #{number_of_deaths} people in this outbreak"
    end


   def speed_of_spread #in months #no parameters needed (population_density, state) as method predicted_death works with instance variables; state not even used.
    speed = 0.0
    i = 50
    j = 2
    if @population_density >= i
      while @population_density >= i && i <= 200
        speed = j
        i += 50
        j -= 0.5
      end
    else
      speed = 2.5
    end
    puts " and will spread across the state in #{speed} months.\n\n"
  end
end


#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

def report(data)
  data.each {|k,v| 
    state = k 
    population_density = data[k][:population_density]
    population = data[k][:population]
    region = data[k][:region]
    regional_spread = data[k][:regional_spread]
    state_report = VirusPredictor.new(state, population_density, population, region, regional_spread)
    state_report.virus_effects
  }
end

report(STATE_DATA)

alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects
puts alabama.population

=begin

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects

=end