# hangman game

words = ["hardware","keyboard","memory","disk","computer","display","software","error"]
@word = words.sample
@guesses = []
@word_display = "_"*@word.length
@guesses_remaining = 11

@visual = [" ", "          ", "          ", "          ", "          ",
   "          ", "          ", " "]

puts "Let's play a game of hangman"
puts "I'll pick the word"
puts "Word: #{@word_display}"

def guess
  puts "Please guess a letter"
  user_guess = gets.chomp.downcase

# Check if user input has not been guessed before, is a letter is and only 1 letter
  if @guesses.include?(user_guess)
    puts "You have already guessed '#{user_guess}' before"
    guess
  elsif user_guess.match?(/[a-z]/) && user_guess.size == 1
    guess_checker(user_guess)
  else
    puts "Invalid input. Please enter one letter only"
    guess
  end
end

def guess_checker(user_guess)
  if @word.include?(user_guess)
    puts "You got lucky, '#{user_guess}' is in my word"
    word_checker(user_guess)
  else
    puts "Sorry, '#{user_guess}' is not in my word"
    @guesses_remaining -= 1
  end

# visual[0] & [7] are blank spaces to keep the feedback more readable
  case @guesses_remaining
  when 10
    @visual[6] = "__________"
  when 9
    2.upto 6 do |x|
    @visual[x][1] = "|"
    end
  when 8
    @visual[1] = "__________"
  when 7
    @visual[2][4] = "/"
    @visual[3][3] = "/"
  when 6
    @visual[2][8] = "|"
  when 5
    @visual[3][8] = "Ω"
  when 4
    @visual[4][8] = "0"
  when 3
    @visual[4][7] = "¯"
  when 2
    @visual[4][9] = "¯"
  when 1
    @visual[5][7] = "/"
  when 0
    @visual[5][9] = "\\"
  end

  puts "Word: #{@word_display}"

  if @word_display == @word
    puts "Congratulations, you guessed my word!"
  elsif @guesses_remaining == 0
    puts @visual
    puts "Game over, I win!"
  else
    @guesses << user_guess
    puts "You've guessed: #{@guesses.join(' ')}"
    puts "Guesses remaining: #{@guesses_remaining}"
    puts @visual
    guess
  end
end

# checks for multiple instances of the guessed letter in the word
def word_checker(user_guess)
  i = -1
  instances = []
# Checks for the index of the first instance of user_guess AFTER index number i
# Stops when @word.index(user_guess,i+1) returns nil
  while i = @word.index(user_guess,i+1)
      instances << i
  end

# replace dashes in word display with the correctly guessed letters
    instances.each do |i| @word_display[i] = user_guess end
end

guess

# to do:
# let player pick the word
