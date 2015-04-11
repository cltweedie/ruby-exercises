# Programme to accept a number as an input, and output the number converted to roman numerals
# This version uses old-school roman numerals - where VIIII is nine rather than IX

class Numerals
  def self.convert_integer(int)
    numeral_string = ""                   #  set the string as empty to start with
    if int >= 1000
      for thousands in 1..int/1000
        int -= 1000
        numeral_string += "M"
      end
    end
    if int >= 500
      for fivehundreds in 1..int/500
        int -= 500
        numeral_string += "D"
      end
    end
    if int >= 100
      for hundreds in 1..int/100
        int -= 100
        numeral_string += "C"
      end
    end
    if int >= 50
      for fifties in 1..int/50
        int -= 50
        numeral_string += "L"
      end
    end
    if int >= 10
      for tens in 1..int/10
        int -= 10
        numeral_string += "X"
      end
    end
    if int >= 5
      for fives in 1..int/5
        int -= 5
        numeral_string += "V"
      end
    end
    if int >= 1
      for ones in 1..int
        int -= 50
        numeral_string += "I"
      end
    end
    puts numeral_string
  end
end

Numerals.convert_integer(3447)