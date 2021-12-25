class Hangman

  def initialize
    @word = words.sample
    @lives = 7
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
      good_guess = @word.first.include? guess

      if guess == "exit"
        puts "thank you for playing"
      elsif good_guess
        puts "You are correct"

        print_teaser guess
          if @word.first == @word_teaser.split.join
            puts "CONGRATS you have won this round!"
          else
            make_guess
          end
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
    puts "to exit the game at any time type 'exit'"
    print_teaser
    puts "Clue: #{ @word.last }"
    make_guess
  end
end


# puts [1,2,3,55,66,23,6].sample

game = Hangman.new
game.begin