# Programme to read and write files encrypted with a Caesar Cipher (simple alphabetical shift)

class Caesar

  def self.get_choice
    choice = ''
    while choice.downcase != 'q'
      print "Would you like to encrypt (e) or decrypt (d)? (q to quit) "
      choice = gets.chomp
      if choice.downcase == 'e'
        print "Enter the message to encrypt: "
        message = gets.chomp
        print "Enter the key (integer): "
        key = gets.chomp.to_i
        self.encrypt(message, key)
        puts "Your encrypted message has been output to the file 'encrypted.txt'"
      end
      if choice.downcase == 'd'
        print "Enter the name of the file to decrypt: "
        filename = gets.chomp
        message = File.read(filename)
        print "Enter the key (integer): "
        key = gets.chomp.to_i
        print "Your decrypted message is: "
        self.decrypt(message, key)
      end
    end
  end

  def self.encrypt(message, key)
    encrypted_message = ""
    message.each_byte do |letter|
      if letter <= 64 || (letter >= 91 && letter <= 96) || (letter >= 123 && letter <= 126)
        encrypted_message += letter.chr
      elsif letter >= 65 && letter <= 90
        reference = letter - 65
        encrypted_letter = (reference + key) % 26
        encrypted_message += (encrypted_letter + 65).chr
      else
        reference = letter - 97                           # subtract 97 to get a 0-25 alphabetical reference for the number
        encrypted_letter = (reference + key) % 26         # add the key, then modulus 26 to wrap around the alphabet
        encrypted_message += (encrypted_letter + 97).chr  # add letter to the message after adding 97 to get ASCII value
      end
    end
    doc = File.new("encrypted.txt", 'w')
    doc.puts encrypted_message
    doc.close
  end

  def self.decrypt(message, key)
    message.each_byte do |letter|
      if letter <= 64 || (letter >= 91 && letter <= 96) || (letter >= 123 && letter <= 126)
        print letter.chr
      elsif letter >= 65 && letter <= 90
        reference = letter - 65
        letter = (reference - key) % 26
        print (letter + 65).chr
      else
        reference = letter - 97
        letter = (reference - key) % 26
        print (letter + 97).chr
      end
    end
    puts " "
  end

end



Caesar.get_choice