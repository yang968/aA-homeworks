require 'colorize'

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    puts "Hello and, again, welcome to the App Academy computer-aided enrichment center."
    system("say Hello and, again, welcome to the App Academy computer-aided enrichment center.")

    puts "Your specimen has been processed and we are now ready to begin the test proper."
    system("say Your specimen has been processed and we are now ready to begin the test proper.")

    puts "Before we start, however, keep in mind that although fun and learning are the primary goals of all enrichment center activities, serious injuries may occur."
    system("say Before we start, however, keep in mind that although fun and learning are the primary goals of all enrichment center activities, serious injuries may occur.")
    
    sleep(1.5)
    system("clear")

    puts "We are committed to the well being of all participants. Cake and grief counseling will be available at the conclusion of the test. Thank you for helping us help you help us all."
    system("say We are committed to the well being of all participants. Cake and grief counseling will be available at the conclusion of the test. Thank you for helping us help you help us all.")
    sleep(1.5)
    system("clear")

    puts "Stand back. The game will begin in three"
    system("say Stand back. The game will begin in three")
    sleep(1)
    puts "two"
    system("say two")
    sleep(1)
    puts "one"
    system("say one")
    sleep(1)
    system("clear")
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    if @sequence_length < 7
      puts "Here is your next test case"
      system("say Here is your next test case")
    else
      puts "The Enrichment Center regrets to inform you that this next test is impossible."
      system("say The Enrichment Center regrets to inform you that this next test is impossible.")
      puts "Make no attempt to solve it."
      system("say Make no attempt to solve it.")
      puts "Quit now and cake will be served immediately."
      system("say Quit now and cake will be served immediately.")
      puts "No one will blame you for giving up. In fact, quitting at this point is a perfectly reasonable response."
      system("say No one will blame you for giving up. In fact, quitting at this point is a perfectly reasonable response.")
    end

    @seq.each do |color|
      system("clear")
      puts "#{color}".colorize(color.to_sym)
      system("say #{color}")
      sleep(1)
    end
    system("clear")
  end

  def require_sequence
    puts "Enter the first letter of the colors you saw in order with no spaces"
    puts "For example: rgb"
    system("say Enter the first letter of the colors you saw in order with no spaces")
    input = gets.chomp.split('')

    if input.length != @seq.length
      @game_over = true
      return
    end
    input.each_index do |idx|
      @game_over = true if input[idx] != @seq[idx][0]
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    system("clear")
    case @sequence_length
    when 1
      puts "Good job! You can remember a color."
      system("say Good job! You can remember a color.")
    when 2
      puts "Excellent. Please proceed into the next test."
      system("say Excellent. Please proceed into the next test.")
    when 3
      puts "You are doing very well!"
      system("say You are doing very well!")
    when 4
      puts "Well done! Remember, App Academy Bring Your Daughter to Work Day is the perfect time to have her tested."
      system("say Well done! Remember, App Academy Bring Your Daughter to Work Day is the perfect time to have her tested.")
    when 5
      puts "Unbelievable! You, [Subject Name] Here, must be the pride of [Subject Hometown] Here."
      system("say Unbelievable! You, [Subject Name] Here, must be the pride of [Subject Hometown] Here.")
      puts "Let's move on to the next round"
      system("say Lets move on to the next round")
    when 6
      puts "Once again, excellent work."
      system("say Once again, excellent work.")
    when 7..100
      puts "Fantastic! You remained resolute and resourceful in an atmosphere of extreme pessimism."
      system("say Fantastic! You remained resolute and resourceful in an atmosphere of extreme pessimism.")
    end

  end

  def game_over_message
    system("clear")
    case @sequence_length
    when 1..3
      puts "The Player has been eliminated due to lack of intelligence."
      system("say The Player has been eliminated due to lack of intelligence.")
    when 4..6
      puts "Perhaps you can try again later, after you upgrade your brain."
      system("say Perhaps you can try again later, after you upgrade your brain.")
    when 7..100
      puts "You have made this far..."
      system("say You have made this far...")
      puts "It's quite impressive for your specimen"
      system("say Its quite impressive for your specimen")
      puts "But cake is only given to winners"
      system("say But cake is only given to winners")
    end
    puts "Goodbye"
    system("say Goodbye")
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  s.play
end
