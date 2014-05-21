def encrypt_string(string, key)
  positions = string.unpack('C*')

  shifted_positions = positions.map do |pos|
    case pos
      when (65..90), (97..122)
        shifted = pos + (key % 26)
        if (shifted > 90 && shifted < 97) || (shifted > 122)
          shifted = shifted - 26
        end
        pos = shifted
      else
        pos
    end
  end

  results = shifted_positions.pack('C*')
  puts results
end

puts "Enter the string you want to encrypt:"
unencrypted_string = gets.chomp
puts "\nEnter a key:"
key = gets.chomp.to_i
puts "\nYour encrypted string:"
encrypt_string(unencrypted_string, key)
puts "\n"
