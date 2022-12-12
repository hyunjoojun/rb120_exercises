class GuessingGame
  def initialize(min_num, max_num)
    @range = (min_num..max_num).to_a
    @number_of_guesses = calculate_max_number
  end

  def play
    reset
    loop do
      display_number_of_guesses
      guess_number
      evaluate_number
      break if game_over? || won?
    end
    puts lose_message if game_over? && !won?
  end

  private

  attr_reader :number_of_guesses, :current_guess, :winning_num, :range

  def calculate_max_number
    size_of_range = @range.size
    Math.log2(size_of_range).to_i + 1
  end

  def reset
    @winning_num = @range.sample
    @number_of_guesses = calculate_max_number
    @current_guess = nil
  end

  def win_message
    "That's the number! You won!"
  end

  def lose_message
    'You have no more guesses. You lost!'
  end

  def game_over?
    number_of_guesses.zero?
  end

  def won?
    current_guess == winning_num
  end

  def display_number_of_guesses
    if number_of_guesses == 1
      puts 'You have only 1 guess remaining!!'
    else
      puts "You have #{number_of_guesses} guesses remaining."
    end
  end

  def guess_number
    loop do
      puts "Enter a number between #{range.first} and #{range.last}:"
      num = gets.chomp.to_i
      if @range.include?(num)
        @current_guess = num
        @number_of_guesses -= 1
        break
      end
      puts 'Invalid guess.'
    end
  end

  def evaluate_number
    if current_guess > winning_num
      puts 'Your guess is too high'
    elsif current_guess < winning_num
      puts 'Your guess is too low'
    else
      puts win_message
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
game.play

game2 = GuessingGame.new(50, 2000)
game2.play
