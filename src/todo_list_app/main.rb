require 'colorize'
require 'tty-prompt'
require_relative "./make_todo_list.rb"

main_menu = '
        _________   _________
   ____/    MAIN \ / MENU    \____
 /| ------------- |  ------------ |\
||| ------------- | ------------- |||
||| ------------- | ------------- |||
||| ------- ----- | ------------- |||
||| ------------- | ------------- |||
||| ------------- | ------------- |||
|||  ------------ | ----------    |||
||| ------------- |  ------------ |||
||| ------------- | ------------- |||
||| ------------- | ------ -----  |||
||| ------------  | ------------- |||
|||_____________  |  _____________|||
L/_____/--------\\_//W-------\_____\J

'
puts main_menu.colorize(:yellow)

prompt = TTY::Prompt.new

loop do
  option = prompt.select('What would you like to do?') do |menu|
    menu.choice 'Make a To-Do List'
    menu.choice 'View previous lists'
    menu.choice 'Delete previous lists'
    menu.choice 'Exit'
  end

    case option
    when 'Make a To-Do List'
        list = ToDoListApp.new
        list.ask_date
        list.title_with_date
        list.tasks
        list.feedback
        #save the data to the text file
        old_stdout = $stdout
        File.open('test.txt', 'a') do |fo|
        $stdout = fo
        # the data to be saved
        list.title_with_date
        list.tasks
        # ----
        end
        $stdout = old_stdout

    when 'View previous lists'
        file = File.open('test.txt') do |file|
            file.each_line do |list|
            puts list
            end
        end

    when 'Delete previous lists'
        answer = prompt.yes?("Are you sure to delete previous list?")
        if answer == true
            file = File.open('test.txt',"w")
            file.print("    ")
            puts 'Your previous list has been deleted'
        else
            nil
        end

    when 'Exit'
        exit!(0)
    end
end
