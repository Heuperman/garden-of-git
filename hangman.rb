# hangman game

words = ["hardware","keyboard","memory","disk","computer","display","software","error"]
@word = words.sample
@guesses = []
@word_display = "_"*@word.length
@guesses_remaining = 10

puts "Let's play a game of hangman"
puts "I'll pick the word"
puts "Word: #{@word_display}"

def guess
    puts "Please guess a letter"
    user_guess = gets.chomp.downcase

# Check if user input is a letter and only 1 letter
    if user_guess.match?(/[a-z]/) && user_guess.size == 1
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
        puts "Word: #{@word_display}"
    else
        puts "Sorry, '#{user_guess}' is not in my word"
        puts "Word: #{@word_display}"
    end

    @guesses << user_guess
    puts "You've guessed: #{@guesses.join(' ')}"
    @guesses_remaining -= 1
    puts "Guesses remaining: #{@guesses_remaining}"

    if @word_display == @word
        puts "Congratulations, you guessed my word!"
    elsif @guesses_remaining == 0
        puts "Game over, I win!"
    else
        guess
    end
end

def word_checker(user_guess)
    i = -1
    all = []
    while i = @word.index(user_guess,i+1)
        all << i
    end

    all.each do |x| @word_display[x] = user_guess end

end
guess

# to do:
# don't allow of multiple entries of same character
# make it so the final  message does not include guesses or guesses_remaining
# add visual of gallows
# let player pick the word
