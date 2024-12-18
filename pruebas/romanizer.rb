def romanize(numbers)
  roman_pairs = [
    [1000, 'M'],
    [900, 'CM'],
    [500, 'D'],
    [400, 'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40, 'XL'],
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I']
  ]

  result = []
  numbers.each do |number|
    roman = ""
    puts number
    roman_pairs.each do |value, symbol|
      while number >= value
        puts value
        number -= value
        roman += symbol
        puts number
        puts value
      end
    end
    result << roman
  end
  result
end

puts romanize([1]).inspect