require 'colorize'
require 'tty-prompt'
require 'tty-box'
require 'tty-font'
require 'json'

class ToDoListApp
    attr_reader :date
       def initialize(date)
           @date = date
           @tasks = ARGV
       end
       
       def title_with_date
           puts "TODO DATE: #{@date}"
       end
   
       def tasks
           @tasks.each_with_index do |task,index|
           puts "#{index + 1}: #{task}"
           end
       end    
   
       def feedback
           puts "How many tasks did you completed? Answere as a number. e.g: 2"
           num_complete = $stdin.gets.chomp.to_i
           left_num_task = tasks.length - num_complete
       
           if num_complete == @tasks.length
               puts "Feedback: Completed all the tasks!".colorize(:yellow)
           elsif    1 <= left_num_task
               puts "Feedback: You completed #{num_complete} tasks, and have #{left_num_task} more tasks!".colorize(:green)
           else
               puts "Error".colorize(:red)
           end
       end
   end
   
   list = ToDoListApp.new("April 4th")
   list.title_with_date
   list.tasks
   
   
   
   
   
   list.feedback
   
   
   
   
           
   
   
   