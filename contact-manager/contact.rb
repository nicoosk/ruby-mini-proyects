class Contact
  attr_accessor :id, :name, :number, :city
  def initialize(id, name, number, city)
    @id = id
    @name = name
    @number = number
    @city = city
  end
  
end