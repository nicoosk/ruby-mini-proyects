require_relative 'to-do-manager'

to_do_list = ToDoManager.new()

to_do_list.add_new_task("Presentación", "Tengo que hacer esta presentación")

to_do_list.view_tasks