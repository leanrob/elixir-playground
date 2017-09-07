# This is an *.exs file
# --> it is for scripting

defmodule PlaygroundModule do
    # Import any modules that we need to use like this
    # can include/exclude specific functions
    import IO, only: [puts: 1]

    # can import if we need a module named the same as one in Kernal
    # import Kernel, except: [inspect: 1]

    # Allows us to use the alias of the Math function in print_sum
    alias PlaygroundModule.Misc.Util.Math # as: NewMath -- add alias name

    # require allos using macros in your modules
    require Integer

    def say_here do
        puts "i'm here"
    end

    def inspect(param1) do
        puts "Starting output"
        puts param1
        puts "Ending output"
    end


    # must import other file in the project in iex
    # `import_file("misc_util_math.exs")`
    def print_sum do
        Math.add(1,2)
    end

    def print_is_even(num) do
        puts "Is #{num} even? #{Integer.is_even(num)}"
    end

end

# If this needs to be changed when running in iex already
# input `r(PlaygroundModule)` into the iex terminal to reload module
