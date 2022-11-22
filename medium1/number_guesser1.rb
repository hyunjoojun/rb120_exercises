class GuessingGame
  attr_accessor :number_of_guesses
  MAX_GUESSES = 7
  RANGE = 1..100

  def initialize
    @winning_number = RANGE.to_a.sample
    @number_of_guesses = MAX_GUESSES
  end

  def display_number_of_guesses
    puts "You have #{@number_of_guesses} guesses remaining."
  end

  def ask_user_to_guess
    guessed_num = 0
    loop do
      puts 'Enter a number between 1 and 100:'
      guessed_num = gets.chomp.to_i
      break if RANGE.to_a.include?(guessed_num)

      puts 'Invalid guess.'
    end
    guessed_num
  end

  def give_hint(guessed_num)
    if guessed_num > @winning_number
      puts 'Your guess is too high.'
    elsif @winning_number > guessed_num
      puts 'Your guess is too low.'
    else
      you_won
    end
  end

  def you_won
    puts "That's the number! You won!"
  end

  def you_lost
    puts 'You have no more guesses. You lost!'
  end

  def play
    loop do
      display_number_of_guesses
      guessed_num = ask_user_to_guess
      give_hint(guessed_num)
      @number_of_guesses -= 1
      break if @number_of_guesses.zero? || guessed_num == @winning_number
    end
    you_lost if @number_of_guesses.zero?
  end
end

game = GuessingGame.new
game.play
