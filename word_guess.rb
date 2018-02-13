# help color and read code
require 'colorize'
require 'pry'

# Learning Goals:
# Create a complex program from start to finish
# Use at least one class to encapsulate game functionality
# Use methods to encapsulate repeated sections of code
# Use instance variables and local variables where appropriate
# Use arrays to store information where appropriate
# Use variables to allow the game to be played with different words

# The Rules:
# The word to guess is represented by a row of dashes, giving the number
# of letters. If the guess is a letter or number which occurs in the word,
# the word should be updated in all of the correct positions. If the suggested
# letter or number does not occur in the word, the game should draw or remove
# one element of the visual representation as a tally mark. The game is over
# when:
# The player completes the word, or guesses the whole word correctly
# The diagram representing the tally marks is complete



#class
class WordGuess

  attr_accessor :hard_array, :easy_array

  def initialize
    @tally = 0
    @word_array
    @word_hash
    @user_input = user_input
    @hard_array = %w[axe countryside burninate]
    @easy_array = %w[knights archers peasants cottages swords shields]
    ascii
  end

  def split_array
    word_array.sample
  end

  def user_input
    puts "Welcome to our Word Game!"
    puts "Please choose the difficulty level: easy or hard. >"
    user_input = gets.chomp
    if user_input == @hard_array
      puts split_array
    elsif user_input == @easy_array
      puts split_array
    end
  end

  def ascii
    case @tally
    when 0
      puts "Don't draw Trogdor!"
    when 1
      puts "Draw an S"
    when 2
      puts "Draw a more different S"
    when 3
      puts "Using consummate V's, give him teeth, spinities and angry eyebrows"
    when 4
      puts "You can add smoke or fire"
    when 5
      puts "And maybe add some wings, you know, if he's a wing-a-ling dragon."
    when 6
      puts "Put one of those beefy arms back on him for good measure."
    when 7
      puts "Add majestic lines... for majesty."
      puts "The word was: #{@current_word}"
    end
  end

end




  guess = WordGuess.new
  puts guess.hard_array.sample
  # if we ran this, the class is not here yet
