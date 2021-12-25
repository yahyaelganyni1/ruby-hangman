class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
  end

  def words
    [
    ["critcket", "A game played by gentelemen"],
    ["jogging", "we are not walking..."],
    ["celoebrate", "remebring special momoints"],
    ["continent", "there are 7 of those"],
    ["exotic", "NOt from around here"],
  ]
  end

  def print_teaser
    word_teaser = ""

    @word.first.size.times do
    word_teaser += "_ "
    end

    puts word_teaser
  end

  def make_guess
    puts "Enter a letter: "
    guess = gets.chomp
    # if letter is not part of the world then remove from letters array 
    good_guess = @word.first.include? guess

    if good_guess
      puts "Good guess!"
    else
      puts "Sorry...try again"
    end
  end

  def begin
    #ask user for letter
    puts "New game started... your word is #{@word.first.size} chracters long"
    print_teaser
    puts "Clue: #{ @word.last }"
    make_guess
  end
end


# puts [1,2,3,55,66,23,6].sample

game = Hangman.new
game.begin