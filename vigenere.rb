# Programme to read and write files encrypted with a Vigenere Cipher (polyalphabetic shift)
# Uses a word as the key, each letter respresenting an alphabetical index denoting the shift

class Vigenere

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
        print "Enter the keyword: "
        key = STDIN.gets.chomp
        self.encrypt(message, key)
        puts "Your encrypted message has been output to the file #{ARGV[0]}"
      end
      if @choice.downcase == 'd'
        filename = ARGV[0]
        message = File.read(filename)
        print "Enter the keyword: "
        key = STDIN.gets.chomp
        print "Your decrypted message is:\n\n"
        self.decrypt(message, key)
      end
  end

  def self.encrypt(message, keyword)
    encrypted_message = ""
    keyword_array = keyword.split("")
    keyword_index = 0
    message.each_byte do |letter|
      if letter <= 64 || (letter >= 91 && letter <= 96) || (letter >= 123 && letter <= 126)
        encrypted_message += letter.chr
      elsif letter >= 65 && letter <= 90                  
        reference = letter - 65
        encrypted_letter = (reference + keyword_array[keyword_index].downcase.ord - 97) % 26      
        encrypted_message += (encrypted_letter + 65).chr
        keyword_index = (keyword_index + 1) % keyword_array.length
      else                                                
        reference = letter - 97                           
        encrypted_letter = (reference + keyword_array[keyword_index].downcase.ord - 97) % 26         
        encrypted_message += (encrypted_letter + 97).chr
        keyword_index = (keyword_index + 1) % keyword_array.length
      end
    end
    doc = File.new(ARGV[0], 'w')
    doc.puts encrypted_message
    doc.close
  end

  def self.decrypt(message, keyword)
    keyword_array = keyword.split("")
    keyword_index = 0
    message.each_byte do |letter|
      if letter <= 64 || (letter >= 91 && letter <= 96) || (letter >= 123 && letter <= 126)
        print letter.chr
      elsif letter >= 65 && letter <= 90
        reference = letter - 65
        key = keyword_array[keyword_index].downcase.ord - 97
        letter = (reference - key) % 26
        print (letter + 65).chr
        keyword_index = (keyword_index + 1) % keyword_array.length
      else
        reference = letter - 97
        key = keyword_array[keyword_index].downcase.ord - 97
        letter = (reference - key) % 26
        print (letter + 97).chr
        keyword_index = (keyword_index + 1) % keyword_array.length
      end
    end
    puts " "
  end

end

Vigenere.get_choice