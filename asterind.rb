require "colorize"

COLORS = {
    "red" => "RED".red,
    "blue" => "BLUE".blue,
    "green" => "GREEN".green,
    "white" => "WHITE".white,
    "aqua" => "AQUA".light_blue,
    "yellow" => "YELLOW".yellow,
    "cyan" => "CYAN".cyan,
    "purple" => "PURPLE".magenta
} 

puts "Availiable Colors: ", COLORS.values

secret_sequence = COLORS.keys.sample(6)

12.times {|turn|
    puts "\n[#{turn + 1}] Your Guess: "
    white = red = 0
    guess = gets.chomp.split
    guess = ("white " * 6).strip.split if guess.include? "debug"
    blacklist = []
    guess.each_with_index{|color, index| 
        red += 1 if color == secret_sequence[index]
        white += 1 if secret_sequence.include?(color) and !blacklist.include?(color) 
        blacklist.push(color) # to prevent white picking up duplicates
    }

    if red == 6
        print("Congratulations, you've solved the sequence!")
        break
    end

    white -= red # if color is in the right place, is also in the sequence
    print "[]".red * red + "[]".light_green * white + "[]" * (6 - red - white) + "\n"

}

puts "Unfortunately, you've run out of turns ;("
puts "The sequence was: " + secret_sequence.join
