class GuessingGame
  attr_accessor :number_of_guesses, :guessed_num

  def initialize(min, max)
    @range = min..max
    @winning_number = @range.to_a.sample
    @number_of_guesses = calculate_max_number
  end

  def calculate_max_number
    size_of_range = @range.to_a.size
    Math.log2(size_of_range).to_i + 1
  end

  def display_number_of_guesses
    puts "You have #{@number_of_guesses} guesses remaining."
  end

  def ask_user_to_guess
    loop do
      puts "Enter a number between #{@range.first} and #{@range.last}:"
      @guessed_num = gets.chomp.to_i
      break if @range.to_a.include?(@guessed_num)

      puts 'Invalid guess.'
    end
    @guessed_num
  end

  def give_hint
    if @guessed_num > @winning_number
      puts 'Your guess is too high.'
    elsif @winning_number > @guessed_num
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
      @guessed_num = ask_user_to_guess
      give_hint
      @number_of_guesses -= 1
      break if @number_of_guesses.zero? || @guessed_num == @winning_number
    end
    you_lost if @guessed_num != @winning_number
  end
end

game = GuessingGame.new(501, 1500)
game.play
