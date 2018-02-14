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

  attr_accessor :word_array, :guess_ui

  def initialize
    @play_again = "yes"
    while @play_again == "yes"
    new_word = WordMechanics.new
    guess_ui = GuessMechanics.new(new_word)
    guess_ui.guess_letter
    puts "\nDo you want to play again?"
    @play_again = gets.chomp.downcase

  end
  end


end

class WordMechanics
  attr_accessor :word_array, :current_word, :letter_holders
  def initialize
    @hard_array = %w[axe countryside burninate flame smoke spinities majesty majestic consume destroy consummate]
    @easy_array = %w[knights archers peasants cottages swords shields arms lines eyebrows teeth scales]
    @word_array = select_difficulty
    @current_word = @word_array.sample.split(//)
    @letter_holders = guess_letters
  end # ends WordMechanics initialize

  def select_difficulty
    puts "=" * 100
    puts "  _________  ____  ________  ____  ___    _      ______  ___  ___    _______  ______________"
    puts " /_  __/ _ \\/ __ \\/ ___/ _ \\/ __ \\/ _ \\  | | /| / / __ \\/ _ \\/ _ \\  / ___/ / / / __/ __/ __/"
    puts "  / / / , _/ /_/ / (_ / // / /_/ / , _/  | |/ |/ / /_/ / , _/ // / / (_ / /_/ / _/_\\ \\_\\ \\"
    puts " /_/ /_/|_|\\____/\\___/____/\\____/_/|_|   |__/|__/\\____/_/|_/____/  \\___/\\____/___/___/___/\n\n"
    puts "=" * 100
    puts "Your quest to burninate the countryside starts right now!\n\n"
    puts "Please choose the difficulty level: easy or hard."
    user_input = gets.chomp.downcase

    # force user to select valid input
    until user_input == "easy" || user_input == "hard"
      puts "Please select easy or hard."
      user_input = gets.chomp.downcase
    end

    # select difficulty of word list
    if user_input == "hard"
      @word_array = @hard_array
    elsif user_input == "easy"
      @word_array = @easy_array
    end
    return @word_array
  end # ends select_difficulty

  # create an array of underscores that mirrors the length of the current word
  def guess_letters
    guess_array = []
    @current_word.each do
      guess_array << "_"
    end
    return guess_array
  end

end

class GuessMechanics

  attr_accessor :current_word, :letter_holders

  def initialize(word_object)
    @tally = 0
    @current_word = word_object.current_word
    @letter_holders = word_object.letter_holders
    @guess_array = []
  end

  def ascii
    case @tally
    when 0
      puts "Don't draw Trogdor!"
    when 1
      puts "Draw an S"
      puts "\n                  ,_.._____  ._._._."
      puts "                _/                  `-._____   "
      puts "              /"
      puts "             ;"
      puts "            ;"
      puts "          ,|"
      puts "           |"
      puts "           \\"
      puts "            \\"
      puts "               `._"
      puts "                  `._"
      puts "                    ``-._"
      puts "                         `-._ "
      puts "                             `."
      puts "                               )"
      puts "                              /"
      puts "                            ,'"
      puts "                   _._.,-  `"

    when 2
      puts "Draw a more different S"
      puts "\n                  ,_.._____  ._._._."
      puts "                _/                  `-._____   "
      puts "              /"
      puts "             ;"
      puts "            ;            ..._"
      puts "          ,|           '     '."
      puts "           |         ,'        `'--...____"
      puts "           \\        |"
      puts "            \\        `-._"
      puts "               `._        `-."
      puts "                  `._        `._"
      puts "                    ``-._      `."
      puts "                         `-._    `."
      puts "                             `.    \\"
      puts "                               )   ;"
      puts "                              /   /"
      puts "                            ,'   /"
      puts "                   _._.,-  `   ,'"
      puts "                   `--..,_ _,-'"

    when 3
      puts "Using consummate V's, give him teeth, spinities and angry eyebrows"
      puts "\n                                    \\  /"
      puts "                   ,,-.__ ._.,._`._ .\\/."
      puts "                __ `.                  `-._____m"
      puts "              /   `. `                        _,"
      puts "             ;'                 ,  ___________/"
      puts "            ;            ...__ `.`._    V V V"
      puts "          ,|      UuUu '     '.   `-.__A_A_"
      puts "           :    uUuUu,'        `'--...____/"
      puts "           \\   UuUu:"
      puts "            \\   UuUu`-._"
      puts "               `._  uUuUu `-."
      puts "                  `._  uUu   `._"
      puts "                    ``-._      `."
      puts "                         `-._    `."
      puts "                             `.    \\"
      puts "                               )   ;"
      puts "                              /   /"
      puts "               `.        |\\ ,'   /"
      puts "                 ``,_A_/\\-| `   ,'"
      puts "                   `--..,_ _,-'"
    when 4
      puts "You can add smoke or fire"
      puts "\n                                                :::"
      puts "                                             :: :::."
      puts "                                             .:::::"
      puts "                                              :::888"
      puts "                                             ::88888"
      puts "                                                  ::88"
      puts "                                                .:8888"
      puts "                                                :::888"
      puts "                                    \\  /       :88"
      puts "                   ,,-.__ ._.,._`._ .\\/.       :8"
      puts "                __ `.                  `-._____m"
      puts "              /   `. `                        _,"
      puts "             ;'                 ,  ___________/ _,-_,'```/__,-."
      puts "            ;            ...__ `.`._    V V V       -=-'``#==-._"
      puts "          ,|      UuUu '     '.   `-.__A_A_ -. ._ ,--._ ``,`` `-"
      puts "           :    uUuUu,'        `'--...____/   `` ``.   `"
      puts "           \\   UuUu:"
      puts "            \\   UuUu`-._"
      puts "               `._  uUuUu `-."
      puts "                  `._  uUu   `._"
      puts "                    ``-._      `."
      puts "                         `-._    `."
      puts "                             `.    \\"
      puts "                               )   ;"
      puts "                              /   /"
      puts "               `.        |\\ ,'   /"
      puts "                 ``,_A_/\\-| `   ,'"
      puts "                   `--..,_ _,-'"
    when 5
      puts "And maybe add some wings, you know, if he's a wing-a-ling dragon."
      puts "\n                                                :::"
      puts "                                             :: :::."
      puts "                     \\/,                    .:::::"
      puts "           \\),        \\`-._                 :::888"
      puts "           /\\          \\   `-.             ::88888"
      puts "          /  \\          \\     `-.               ::88"
      puts "         /,.  \\          | .( ''               .:8888"
      puts "            ), \\         ; ( `                 :::888"
      puts "             /_  \\        / ;``    \\  /       :88"
      puts "             `. ,`..-'__/_(  ._`._ .\\/.       :8"
      puts "               )__ `.                  `-._____m"
      puts "              /   `. `                        _,"
      puts "             ;'                 ,  ___________/ _,-_,'```/__,-."
      puts "            ;            ...__ `.`._    V V V       -=-'``#==-._"
      puts "          ,|      UuUu '     '.   `-.__A_A_ -. ._ ,--._ ``,`` `-"
      puts "           :    uUuUu,'        `'--...____/   `` ``.   `"
      puts "           \\   UuUu:"
      puts "            \\   UuUu`-._"
      puts "               `._  uUuUu `-."
      puts "                  `._  uUu   `._"
      puts "                    ``-._      `."
      puts "                         `-._    `."
      puts "                             `.    \\"
      puts "                               )   ;"
      puts "                              /   /"
      puts "               `.        |\\ ,'   /"
      puts "                 ``,_A_/\\-| `   ,'"
      puts "                   `--..,_ _,-'"

    when 6
      puts "Put one of those beefy arms back on him for good measure."
      puts "\n                                                :::"
      puts "                                             :: :::."
      puts "                     \\/,                    .:::::"
      puts "           \\),        \\`-._                 :::888"
      puts "           /\\          \\   `-.             ::88888"
      puts "          /  \\          \\     `-.               ::88"
      puts "         /,.  \\          | .( ''               .:8888"
      puts "            ), \\         ; ( `                 :::888"
      puts "             /_  \\        / ;``    \\  /       :88"
      puts "             `. ,`..-'__/_(  ._`._ .\\/.       :8"
      puts "               )__ `.                  `-._____m"
      puts "              /   `. `                        _,"
      puts "  ,-=====-.-;'                 ,  ___________/ _,-_,'```/__,-."
      puts "C   =--   ;            ...__ `.`._    V V V       -=-'``#==-._"
      puts ":,  \\     ,|      UuUu '     '.   `-.__A_A_ -. ._ ,--._ ``,`` `-"
      puts "||  |`---' :    uUuUu,'        `'--...____/   `` ``.   `"
      puts "|`  :      \\   UuUu:"
      puts ":  /        \\   UuUu`-._"
      puts " \\(_          `._  uUuUu `-."
      puts " (_3             `._  uUu   `._"
      puts "                    ``-._      `."
      puts "                         `-._    `."
      puts "                             `.    \\"
      puts "                               )   ;"
      puts "                              /   /"
      puts "               `.        |\\ ,'   /"
      puts "                 ``,_A_/\\-| `   ,'"
      puts "                   `--..,_|_,-'\\"
      puts "                          |     \\"
      puts "                          |      \\__"
      puts "                          |__"

    when 7
      puts "Add majestic lines... for majesty."
      puts "\n                                                :::"
      puts "                                             :: :::."
      puts "                     \\/,                    .:::::"
      puts "           \\),        \\`-._                 :::888            /"
      puts "           /\\          \\   `-.             ::88888           /"
      puts "          /  \\          \\     `-.               ::88        /"
      puts "         /,.  \\          | .( ''               .:8888"
      puts " \\          ), \\         ; ( `                 :::888"
      puts "  \\         /_  \\        / ;``      \\  /       :88"
      puts "   \\          `. ,`..-'__/_(  ._`._ .\\/.       :8"
      puts "               )__ `.                  `-._____m               _,-_,'\\'`/__,-."
      puts "              /   `. `                        _,     _,-_,'\\'`/__,-.\\'"
      puts "  ,-=====-.-;'                 ,  ___________/ _,-_,''/__,-.  _,-_,''`/__,-.,-"
      puts "C   =--   ;            ...__ `.`._    V V V       -=-''#==-._"
      puts ":,  \\     ,|      UuUu '     '.   `-.__A_A_ -. ._ ,--._ ``,`` `--=-'``#==-._"
      puts "||  |`---' :    uUuUu,'        `'--...____/   `` ``.   `-=-'``#==-._"
      puts "|`  :      \\   UuUu:                                -. ._ ,--._ '',`` `-"
      puts ":  /        \\   UuUu`-._                              `` ``.   `"
      puts " \\(_          `._  uUuUu `-."
      puts " (_3             `._  uUu   `._"
      puts "                    ``-._      `."
      puts "         /               `-._    `."
      puts "        /                    `.    \\            \\"
      puts "       /                       )   ;             \\"
      puts "                              /   /               \\"
      puts "               `.        |\\ ,'   /"
      puts "                 ``,_A_/\\-| `   ,'"
      puts "                   `--..,_|_,-'\\"
      puts "                          |     \\"
      puts "                          |      \\__"
      puts "                          |__"
      puts "*********TROGDOR the BURNINATOR**********".red.on_yellow.blink
    end
  end

  def guess_letter
      while @tally < 7 && @current_word != @letter_holders
        puts "\nSelect a letter at your peril!\n"
        if @tally > 0
          puts "\nAlready guessed letters: #{@guess_array.join(' ')}"
        end

        user_guess = gets.chomp.downcase
        alphabet = ("a".."z").to_a

        until alphabet.include?(user_guess) #begin guess_letter user entry validation
          puts "Please guess a single letter, no numbers or characters"
          user_guess = gets.chomp.downcase
        end

        # Guess array will include all the guessed letters
        @guess_array << user_guess

        # Checking to see if the user guessed letter is included in the current word
        # replacing the correct guessed letter with the underscores in letter holder
        if @current_word.include?(user_guess)
          puts "\nCongrats! You guessed correctly"
          @current_word.each_index do |letter_index|
            if @current_word[letter_index] == user_guess
              @letter_holders[letter_index] = user_guess
            end # if @current_word[letter_index]
          end #@current_word.each_index do
          print @letter_holders.join(' ')
        else
          puts "Oooh, that sucks. You entered the wrong letter. Draw more TROGDOR!"

          @tally += 1
          ascii
        end #@current_word.include?

      end # end while loop

      if @tally < 7 && @letter_holders = @current_word
        puts "\n    __   _______ _   _   _    _ _____ _   _   _ _ _"
        puts "    \\ \\ / |  _  | | | | | |  | |_   _| \\ | | | | | |"
        puts "     \\ V /| | | | | | | | |  | | | | |  \\| | | | | |"
        puts "      \\ / | | | | | | | | |/\\| | | | | . ` | | | | |"
        puts "      | | \\ \\_/ | |_| | \\  /\\  /_| |_| |\\  | |_|_|_|"
        puts "      \\_/  \\___/ \\___/   \\/  \\/ \\___/\\_| \\_/ (_(_(_)"

      else
        puts "The word was: #{@current_word}"
      end # end the win condition

    end # end the until loop
  end # ends GuessMechanics class


dabomb = WordGuess.new
binding.pry
