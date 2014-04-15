# U2.W6: Drawer Debugger


# I worked on this challenge with Jon Pabico.

## Directions
=begin 
1. Format the code to indent it properly
2. Debug the program
Run the code from the console. You should encounter 5 errors before it will run completely (excluding the bonus - uncomment the line to work on it). Read each error carefully and fix it. 
3. Ensure each method is working as expected. You may need to create or modify methods to make the program run properly.
4. Write tests using [Driver Test Code](../../references/driver_code.md) or `assert` statements (make sure you have your assert method defined!)
5. Interact with the code by writing at least three more different method calls. Did they return what you expected?
6. [Reflect](../../references/reflection_guidelines.md)
7. Sync your changes (push your solution) to Github
=end

# 2. Original Code




class Drawer

    attr_reader :contents

# Are there any more methods needed in this class?

    def initialize
        @contents = []
        @open = true
    end

    def open
        @open = true
    end

    def close
        @open = false
    end 

    def add_item(item)
        @contents << item
    end

    def remove_item(item = @contents.pop) #what is `#pop` doing?
        @contents.delete(item)
    end

    def dump  # what should this method return?
       puts "Your drawer is empty."
    end

    def view_contents
        puts "The drawer contains:"
        @contents.each {|silverware| puts "- " + silverware.type }
    end
end

class Silverware
    attr_reader :type

# Are there any more methods needed in this class?

    def initialize(type)
        @type = type
        @clean = true 
    end

    def eat
        puts "eating with the #{@type}"
        @clean = false
    end
    
    def clean_silverware
        @clean = true
    end

end


knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?

removed_fork = silverware_drawer.remove_item("fork") 
removed_fork.eat 


=begin
	
silverware_drawer = Drawer.new

#fork
fork = Silverware.new("fork") 
silverware_drawer.add_item(fork)
silverware_drawer.remove_item(fork)
fork.eat
fork.clean_silverware
silverware_drawer.add_item(fork)
silverware_drawer.view_contents

#knife
knife1 = Silverware.new("knife")
silverware_drawer.add_item(knife1) 
silverware_drawer.view_contents

#spoon
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.view_contents


#sharp_knife
sharp_knife = Silverware.new("sharp_knife")
silverware_drawer.add_item(sharp_knife)

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 
silverware_drawer.view_contents


silverware_drawer.remove_item #?

silverware_drawer.dump #?not sure when to call that
	
=end