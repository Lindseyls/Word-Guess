
#class
class WordGuess

  attr_accessor :hard_array, :easy_array

  def initialize()
    tally = 0
    @word_array
    @word_hash
    @hard_array = %w[axe countryside burninate]
    @easy_array = %w[knights archers peasants cottages swords shields]
  end

  def word_array
    @word_array
    @hard_array
    @easy_array
  end

  def split_array

  word_array.sample

  end


  def word_hash

    @word_hash

  end

  def first_wrong_guess

    # "first S of trogdor"

  end

  def second_wrong_guess

    # "second S of trogdor"

  end

  def third_wrong_guess

    # "head and eyes of trogdor"

  end

  def fourth_wrong_guess

    # "teeth and scales of trogdor"

  end

  def fifth_wrong_guess

    # "eyebrows and wings of trogdor"

  end

  def sixth_wrong_guess

    # "arm and legs of trogdor"

  end


end





guess = WordGuess.new
puts guess.hard_array.sample
# if we ran this, the class is not here yet
