class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  def initialize
    @number_of_guesses = MAX_GUESSES
    @winning_num = RANGE.to_a.sample
    @guessed_num = nil
  end

  def play
    loop do
      display_number_of_guesses
      guess_number
      evaluate_number
      break if game_over? || won?
    end
    puts you_lost if game_over? && !won?
  end

  private

  attr_reader :number_of_guesses, :guessed_num, :winning_num

  def you_won
    "That's the number! You won!"
  end

  def you_lost
    'You have no more guesses. You lost!'
  end

  def game_over?
    number_of_guesses.zero?
  end

  def won?
    guessed_num == winning_num
  end

  def display_number_of_guesses
    puts "You have #{number_of_guesses} guesses remaining."
  end

  def guess_number
    loop do
      puts 'Enter a number between 1 and 100:'
      num = gets.chomp.to_i
      if RANGE.include?(num)
        @guessed_num = num
        @number_of_guesses -= 1
        break
      end
      puts 'Invalid guess.'
    end
  end

  def evaluate_number
    if guessed_num > winning_num
      puts 'Your guess is too high'
    elsif guessed_num < winning_num
      puts 'Your guess is too low'
    else
      puts you_won
    end
  end
end

game = GuessingGame.new
game.play
