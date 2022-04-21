require 'colorize'
require 'tty-box'
require 'tty-font'


class ToDoListApp

    def initialize
        @date = ""
        @tasks = ARGV
    end
       
    def ask_date
        puts "Enter the date what you want to execute the ToDo list. (e.g: 4th Apr, 23/5, 03/04, ...)"
        @date = $stdin.gets.chomp
    end
       
    def title_with_date
        puts "--------------------"
        puts "TODO DATE: #{@date}".colorize(:background => :blue)
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
        puts "How many tasks have you completed? Answer as a number. e.g: 2"
        num_complete = $stdin.gets.chomp.to_i
        left_num_task = @tasks.length - num_complete
       
        if num_complete == @tasks.length
           
            puts "Feedback: Completed all the tasks!".colorize(:yellow)
            
            puts " "
        elsif    1 <= left_num_task
            
            puts "Feedback: You completed #{num_complete} tasks, and have #{left_num_task} more tasks!".colorize(:light_blue)
            
            puts " "
        else
            
            puts "Error".colorize(:red)
            
            puts " "
        end
    end

end
   

   
   
   
           
   
   
   