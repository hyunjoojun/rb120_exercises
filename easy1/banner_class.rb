class Banner
  def initialize(message, width=nil)
    @message = message
    @size = width || message.size
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @size}-+"
  end

  def empty_line
    "| #{' ' * @size} |"
  end

  def message_line
    "| #{@message.center(@size)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
banner2 = Banner.new('Hello', 30)
puts banner2
