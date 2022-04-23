# frozen_string_literal: true

require 'tty-font'
require 'tty-prompt'
require 'colorize'
require_relative './make_todo_list'

### main menu ###

font = TTY::Font.new(:doom)
puts font.write('MENU', letter_spacing: 1)

### ask the menu ###
prompt = TTY::Prompt.new
loop do
  option = prompt.select('What would you like to do?') do |menu|
    menu.choice 'Make a To-Do List'
    menu.choice 'View previous Lists'
    menu.choice 'Delete previous Lists'
    menu.choice 'Exit'
  end
  ### option ###
  case option
  when 'Make a To-Do List'
    list = ToDoListApp.new
    list.ask_date
    list.title_with_date
    list.tasks
    list.feedback
    # save the data to the text file
    begin
      old_stdout = $stdout
      File.open('todo.txt', 'a') do |fo|
        $stdout = fo
        # the data to be saved
        list.title_with_date
        list.tasks
        # ----
      end
      $stdout = old_stdout
    rescue StandardError
      puts 'Failed to save the data to the text file.'
    end

  when 'View previous Lists'
    begin
      File.open('todo.txt') do |file|
        file.each_line do |lists|
          puts lists
        end
      end
    rescue StandardError
      puts 'Failed to read the text file.'
    end

  when 'Delete previous Lists'
    answer = prompt.yes?('Are you sure to delete previous list?')

    if answer == true
      begin
        file_delete = File.open('todo.txt', 'w')
        file_delete.print('    ')
        puts 'Your previous list has been deleted'.colorize(:red)
      rescue StandardError
        puts 'Failed to delete data in text file.'
      end
    end

  when 'Exit'
    exit!
  end
end
