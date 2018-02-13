# help color and read code
require 'colorize'
require 'pry'

#class
class WordGuess

  attr_accessor :hard_array, :easy_array

  def initialize()
    @tally = 0
    @word_array
    @word_hash
    @hard_array = %w[axe countryside burninate]
    @easy_array = %w[knights archers peasants cottages swords shields]
    ascii
  end

  def split_array

  word_array.sample

  end

  def
    if user_input == @hard_array
      puts
  end

  def word_hash

    @word_hash

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
