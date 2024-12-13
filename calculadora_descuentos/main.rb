exit_keywords = ['salir', 'exit', 's', 'fin']

def calcular_descuento(precio, descuento)
  if descuento < 0 || descuento > 100
    return "El valor de descuento debe ser válido"
  end

  if precio < 0
    return "El precio introducido no es válido"
  end

  return precio - (precio * descuento / 100.0)
end

def es_numero?(valor)
  valor.match?(/^\d+(\.\d+)?$/)
end

def terminar?(input, exit_keywords)
  exit_keywords.each do |keyword|
    if keyword == input.downcase
      puts "Terminando instancia"
      sleep(2)
      puts "Terminado con éxito."
      sleep(0.8)
      exit
    end
  end
end

puts "Calculadora de descuentos"
puts "---------------------------"
while true
  puts "\nIngresa el precio del artículo"
  precio_input = gets.chomp
  if es_numero?(precio_input)
    precio = precio_input.to_f
  else
    terminar?(precio_input, exit_keywords)
    puts "El precio debe ser un número válido."
    sleep(1.2)
    puts "Reiniciando..."
    sleep(1)
    next
  end

  puts "Ingrese el descuento"
  descuento_input = gets.chomp
  if es_numero?(descuento_input)
    descuento = descuento_input.to_f
  else
    terminar?(descuento_input, exit_keywords)
    puts "El descuento debe ser un número válido"
    sleep(1.2)
    puts "Reiniciando..."
    sleep(1)
    next
  end

  precio_final = calcular_descuento(precio, descuento)

  if precio_final.is_a?(String)
    puts precio_final
  else
    puts "El precio final es: #{precio_final}"
  end
end

