# Simon Says game in Ruby

# Define an array of valid Simon Says commands
SIMON_SAYS_COMMANDS = ["simon says", "Simon says", "SIMON SAYS"]

# Define the game function
def play_simon_says(num_rounds)
  puts "Welcome to Simon Says!"

  # Loop through the specified number of rounds
  num_rounds.times do |round|
    puts "Round #{round+1} - Listen carefully!"

    # Generate a random Simon Says command
    command = ""
    if rand(2) == 0
      command += "Simon says "
    end
    command += ["jump", "clap", "spin", "stomp"].sample

    # Output the Simon Says command
    puts command

    # Get user input and check if it matches the Simon Says command
    input = gets.chomp.downcase
    if command.downcase == input || SIMON_SAYS_COMMANDS.include?(input)
      puts "Correct!"
    else
      puts "Incorrect. Game over!"
      return
    end
  end

  puts "Congratulations, you win!"
end

# Main program
puts "How many rounds would you like to play?"
num_rounds = gets.chomp.to_i

play_simon_says(num_rounds)
