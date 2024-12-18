def binary(n)
  binary_counter = 0
  position_handler = []
  bits_answer = []

  bits = []

  while n != 0
    if n % 2 == 1
      binary_counter += 1
      bits.insert(1, 1)
    else
      bits.insert(1, 0)
    end
    n /= 2
  end
  
  bits.each_with_index do |value, index|
    if value == 1
      position_handler << index
    end
  end

  bits_answer << binary_counter
  bits_answer.concat(position_handler)
  return bits_answer
end

puts binary(161).inspect