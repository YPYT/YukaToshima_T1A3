require 'colorize'
require 'tty-box'
require 'tty-font'


class ToDoListApp

    def initialize
        @date = ""
        @tasks = ARGV
    end
       
    def ask_date
        puts "Enter the date what you want to execute the ToDo list. (e.g: 4th Apr, 23/5, 03/04, ...)".colorize(:background => :blue)
        @date = $stdin.gets.chomp
    end
       
    def title_with_date
        puts "--------------------"
        puts "TODO DATE: #{@date}".colorize(:background => :yellow)
        puts "--------------------"
    end

   
    def tasks
        if @tasks.length >= 1
            @tasks.each_with_index do |task,index|
            puts "#{index + 1}: #{task}"
            end
            puts " "
        else
            puts "No tasks!! Add tasks in the command line!".colorize(:red)
            puts " "
            exit!
        end
    end   
   
    def feedback
        puts 'How many tasks have you completed? Answer as a number. e.g: 2'
        num = 0
          
        loop do
        get_num = $stdin.gets.chomp
        num = get_num.to_i
        
        break if get_num =~ (/^[0-9]+$/) && num <= @tasks.length
        puts "please enter the right number"
        end
    
        left_tasks = @tasks.length - num
    
        if left_tasks == 0
        puts "Feedback: Completed all the tasks!"
        else
        puts "Feedback: You completed #{num} tasks, and have #{left_tasks} more tasks!"
        end
      end

end
   

   
   
   
           
   
   
   