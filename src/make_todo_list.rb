# frozen_string_literal: true

require 'colorize'
require 'tty-box'

# the ToDoListApp class is for the method to make a todo list #
class ToDoListApp
  def initialize
    @date = ''
    @tasks = ARGV
  end

  def ask_date
    puts puts 'Please enter a date for your todo list (4th May, 5月23日 etc)'.colorize(background: :blue)
    @date = $stdin.gets.chomp
  rescue StandardError
    puts 'Errors occurred.'.colorize(:red)
  end

  def title_with_date
    puts '--------------------'
    puts "TODO DATE: #{@date}".colorize(background: :green)
    puts '--------------------'
  rescue StandardError
    puts 'Failed to read the date'.colorize(:red)
  end

  def tasks
    if @tasks.length >= 1
      begin
        @tasks.each_with_index do |task, index|
          puts "#{index + 1}: #{task}"
        end
      rescue StandardError
        puts 'Failed to get arguments from the terminal command line.'.colorize(:red)
      end
      puts ' '
    else
      puts 'No tasks!! Add tasks in the command line!'.colorize(:red)
      puts ' '
      exit!
    end
  end

  def feedback
    puts 'How many tasks have you completed? Answer as a number. e.g: 2'.colorize(background: :blue)
    num = 0

    loop do
      get_num = $stdin.gets.chomp
      num = get_num.to_i

      break if get_num =~ (/^[0-9]+$/) && num <= @tasks.length

      puts 'Please enter the right number'.colorize(:red)
    end

    left_tasks = @tasks.length - num

    if left_tasks.zero?
      print TTY::Box.frame 'Feedback: Completed all the tasks!', align: :center
    else
      print TTY::Box.frame "Feedback: You completed #{num} tasks, and have #{left_tasks} more tasks!", align: :center
    end
  end
end
