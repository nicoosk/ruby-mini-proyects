require_relative '../lib/to-do-manager'
require_relative '../config/settings'

class Main
  def initialize
    @to_do_manager = ToDoManager.new
  end
  
  include Settings

  def run
    loop do
      puts MENU_OPTIONS[:add_task]
      puts MENU_OPTIONS[:mark_completed]
      puts MENU_OPTIONS[:mark_in_progress]
      puts MENU_OPTIONS[:view_tasks]
      puts MENU_OPTIONS[:exit]
      print "Opción: "
      option = gets.chomp.to_i
      case option
      when 1
        print "Task name: "
        name = gets.chomp
        print "Task description: "
        desc = gets.chomp
        @to_do_manager.add_new_task(name, desc)
      when 2
        print "Task name: "
        name = gets.chomp
        @to_do_manager.mark_as_completed(name)
      when 3
        print "Task name: "
        name = gets.chomp
        @to_do_manager.mark_in_progress(name)
      when 4
        @to_do_manager.view_tasks
      when 5
        break
      else
        puts OUTPUT_MESSAGES[:invalid_option]
      end
    end
  end
end

Main.new.run