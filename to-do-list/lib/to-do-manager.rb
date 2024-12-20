require_relative 'task'
require_relative '../config/settings'
class ToDoManager
  include Settings
  def initialize
    @tasks = {}
  end

  def add_new_task(name, desc)
    puts "Creating task..."
    
    id = rand(1000...10000)
    while @tasks.key?(id)
      id = rand(1000...10000)
    end
    @tasks[id] = Task.new(id, name, desc)
    sleep 1
    puts "Task '#{name}' created successfully!"
  end

  def mark_as_completed(name)
    find_task(name) do |status|
      status = TASK_STATUS[:done]
      puts "Task '#{name}' marked as completed"
    end
  end

  def mark_in_progress(name)
    find_task(name) do |status|
      status = TASK_STATUS[:in_progress]
      puts "Tarea '#{name}' marcada como en progreso"
    end
  end

  def find_task(name)
    task = @tasks.find { |id, task| task.name == name }
    if task
      yield task.status
    else
      puts OUTPUT_MESSAGES[:task_not_found] % name
    end
    
  end

  def view_tasks
    puts "== Lista de tareas =="
    @tasks.each do |id, task|
      puts "ID: #{id} - #{task.name} - #{task.desc} - #{task.status}"
    end
  end
end