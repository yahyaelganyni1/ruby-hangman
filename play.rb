class Hangman

  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
    @lives = 7
    @correct_guesses = []
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
    end
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

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess 
    new_teaser = @word_teaser.split
    #replace blank values with letter if maches letter in word
    new_teaser.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_guess
      new_teaser[index] = last_guess
      end
    end
    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts "Enter a letter: "
      guess = gets.chomp
      # if letter is not part of the world then remove from letters array 
      good_guess = @word.first.include? guess

      if good_guess
        puts "You are correct"

        @correct_guesses << guess

        #remove correct letter from the alphabet
        @letters.delete guess

        print_teaser guess
        make_guess
      else
        puts "Sorry...try again"
        @lives -= 1
        puts "you have #{@lives} lives left. try again!"
        make_guess
      end
    else
      puts "Game over!... Better luck next time!"
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