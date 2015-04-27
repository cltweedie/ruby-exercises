# Programme to read and write files encrypted with a Caesar Cipher (simple alphabetical shift)

class Caesar

  def self.get_choice
    if ARGV.length != 2
      puts "You must provide two arguments:"
      puts "e to encrypt or d to decrypt,"
      puts "plus either the name of a '.txt' file to decrypt, or the name you want for the encrypted file."
      exit
    else
      ARGV.each do |arg|
        if arg.downcase == 'e' || arg.downcase == 'd'
          @choice = arg.downcase
          ARGV.delete(arg)
        else
          puts "Please include 'e' to encrypt or 'd' to decrypt."
          exit
        end
      end
    end
      if @choice.downcase == 'e'
        print "Enter the message to encrypt: "
        message = STDIN.gets.chomp
        print "Enter the key (integer): "
        key = STDIN.gets.chomp.to_i
        self.encrypt(message, key)
        puts "Your encrypted message has been output to the file #{ARGV[0]}"
      end
      if @choice.downcase == 'd'
        filename = ARGV[0]
        message = File.read(filename)
        print "Enter the key (integer): "
        key = STDIN.gets.chomp.to_i
        print "Your decrypted message is:\n\n"
        self.decrypt(message, key)
      end
  end

  def self.encrypt(message, key)
    encrypted_message = ""
    message.each_byte do |letter|
      if letter <= 64 || (letter >= 91 && letter <= 96) || (letter >= 123 && letter <= 126)
        encrypted_message += letter.chr
      elsif letter >= 65 && letter <= 90                  # IF the letter is capital...
        reference = letter - 65                           # subtract 65 to get a 0-25 alphabetical reference for the number
        encrypted_letter = (reference + key) % 26         # add the key, then modulus 26 to wrap around the alphabet
        encrypted_message += (encrypted_letter + 65).chr  # add letter to the message after adding 65 to get ASCII value
      else                                                # Otherwise (if it's lowercase)
        reference = letter - 97                           # subtract 97 to get a 0-25 alphabetical reference for the number
        encrypted_letter = (reference + key) % 26         # add the key, then modulus 26 to wrap around the alphabet
        encrypted_message += (encrypted_letter + 97).chr  # add letter to the message after adding 97 to get ASCII value
      end
    end
    doc = File.new(ARGV[0], 'w')
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