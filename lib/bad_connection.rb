class BadConnection

  attr_reader :ready_to_quit, :goodbye_count, :goodbyes,
  :all_input, :empty_input, :empty_input_count, :lowercase_questions,
  :lowercase_questions_count, :uppercase_questions, :uppercase_questions_count

  def initialize
    @ready_to_quit = false
    @goodbye_count = 0
    @all_input = []
    @empty_input = []
    @empty_input_count = 0
    @lowercase_questions = []
    @lowercase_questions_count = 0
    @uppercase_questions = []
    @uppercase_questions_count = 0
    @goodbyes = []
  end

  def empty_inputs
    @empty_input_count += 1
    @empty_input << @input
    puts "HELLO?"
  end

  def lowercase_question
    @lowercase_questions_count += 1
    @lowercase_questions << @input
    puts "I'M HAVING A HARD TIME HEARING YOU."
  end

  def uppercase_question
    @uppercase_questions_count += 1
    @uppercase_questions << @input
    puts "NO THIS IS NOT A PET STORE."
  end

  def first_goodbye
    @goodbyes << @input
    @goodbye_count += 1
    puts "ANYTHING ELSE I CAN HELP WITH?"
  end

  def second_goodbye
    @goodbyes << @input
    puts "THANK YOU FOR CALLING!"
    @ready_to_quit = true
  end

  def print_log
    puts "All input:\n #{@all_input}\n"
    puts "HELLO?\n #{@empty_input}\n output #{@empty_input_count} times"
    puts "I'M HAVING A HARD TIME HEARIGN YOU!\n #{@lowercase_questions}\n output #{@lowercase_questions_count} times"
    puts "NO THIS IS NOT A PET STORE. \n #{@uppercase_questions}\n output #{@uppercase_questions_count} times"
    puts "GOODBYE!\n #{@goodbyes}\n output #{@goodbye_count} times"
  end

  def start
    until @ready_to_quit == true
      @input = gets.chomp
      @all_input << @input
      if @input == ""
        empty_inputs
      elsif @input =~ /[a-z]/ && @input[-1] == "?"
        lowercase_question
      elsif @input == @input.upcase && @input.end_with?('?')
        uppercase_question
      elsif @input == "GOODBYE!" && @goodbye_count == 0
        first_goodbye
      elsif @input == "GOODBYE!" && @goodbye_count == 1
        second_goodbye
      elsif @input == "print log"
        print_log
      else
        @ready_to_quit = true
      end
    end
  end
end

connection = BadConnection.new
connection.start
