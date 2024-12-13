module Conducible
  def conducir
    puts "Conduciendo el vehículo"
  end
end

module Navegable
  def navegar
    puts "Navegando el barco"
  end
end

class Auto
  include Conducible
end

class Barco
  include Navegable
end

class VehiculoHibrido
  include Conducible
  include Navegable
end


