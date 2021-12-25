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

  def begin
    #ask user for letter
    puts "New game started... your word is #{@word.first.size} chracters long"
    puts "your clue is: #{ @word.last }"
    puts "Enter a letter: "
    guess = gets.chomp
    puts "you guessed #{guess}"
  end
end


# puts [1,2,3,55,66,23,6].sample

game = Hangman.new
game.begin