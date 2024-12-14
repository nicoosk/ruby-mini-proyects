require_relative '../config/settings'

module Validator
  def valid_phone_number?(number)
    number.match?(/^\d{9}$/) 
  end

  def add_prefix(number)
    return Settings::PHONE_PREFIX + number
  end

  def exit_program?(input)
    Settings::EXIT_KEYWORDS.each do |keyword|
      if keyword == input
        puts "Exiting program..."
        sleep(1)
        puts "Done."
        sleep(0.1)
        exit
      end
    end
  end
end