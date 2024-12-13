class Task

  attr_accessor :id, :name, :desc, :status

  def initialize(id, name, desc)
    @id = id
    @name = name
    @desc = desc
    @status = 'uncompleted'
  end
end