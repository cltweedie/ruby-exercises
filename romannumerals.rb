# Programme to accept a number as an input, and output the number converted to roman numerals
# This version uses old-school roman numerals - where VIIII is nine rather than IX

class Numerals
  def self.convert_integer(int)
    numeral_string = ""                   # set the string as empty to start with
    if int >= 1000                        # if the number is more than or equal 100 we need some Ms
      for thousands in 1..int/1000        # so for each thousand in the nunber
        int -= 1000                       # subtract it
        numeral_string += "M"             # and add an 'M' to the string
      end
    end
    if int >= 500                         # do the same for 500s
      for fivehundreds in 1..int/500
        int -= 500
        numeral_string += "D"
      end
    end
    if int >= 100                         # ...and 100s
      for hundreds in 1..int/100
        int -= 100
        numeral_string += "C"
      end
    end
    if int >= 50                          # ...50s
      for fifties in 1..int/50
        int -= 50
        numeral_string += "L"
      end
    end
    if int >= 10                          # ...10s
      for tens in 1..int/10
        int -= 10
        numeral_string += "X"
      end
    end
    if int >= 5                           # ...5s
      for fives in 1..int/5
        int -= 5
        numeral_string += "V"
      end
    end
    if int >= 1                           # ...and 1s
      for ones in 1..int
        int -= 1
        numeral_string += "I"
      end
    end
    puts numeral_string                   # then puts the string of numerals that represent the number
  end
end

Numerals.convert_integer(3447)