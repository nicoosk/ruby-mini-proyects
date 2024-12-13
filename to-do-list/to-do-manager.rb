require_relative 'task'

class ToDoManager
  def initialize
    @tasks = {}
  end

  def add_new_task(name, desc)
    id = rand(1000...10000)
    while @tasks.key?(id)
      id = rand(1000...10000)
    end
    @tasks = Task.new(id, name, desc)
    puts "Tarea '#{name}' creada con el id: #{id}"
  end

  def view_tasks
    puts "== Lista de tareas =="
    @tasks.each_value do |task|
      puts "Titulo: #{task.name}\nDescripción: #{task.desc}\nEstado: #{task.status}"
    end
  end
end