class Caesar
  # @key = 3

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
        print "Your encrypted message is: "
        self.encrypt(message, key)
      end
      if choice.downcase == 'd'
        print "Enter the message to decrypt: "
        message = gets.chomp
        print "Enter the key (integer): "
        key = gets.chomp.to_i
        print "Your decrypted message is: "
        self.decrypt(message, key)
      end
    end
  end

  def self.encrypt(message, key)
    message.each_byte do |letter|
      if letter >= 32 && letter <= 64
        print letter.chr
      else
        letter += key
        print letter.chr
      end
    end
    puts " "
  end

  def self.decrypt(message, key)
    message.each_byte do |letter|
      if letter >= 32 && letter <= 64
        print letter.chr
      else
        letter -= key
        print letter.chr
      end
    end
    puts " "
  end

end



Caesar.get_choice