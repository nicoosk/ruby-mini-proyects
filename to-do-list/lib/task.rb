require_relative '../config/settings'
class Task
  include Settings
  attr_accessor :id, :name, :desc, :status

  def initialize(id, name, desc)
    @id = id
    @name = name
    @desc = desc
    @status = TASK_STATUS[:new]
  end
end