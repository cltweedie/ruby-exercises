# Programme to accept a number as an input, and output the number converted to roman numerals
# This version uses modern roman numerals - where IX is nine rather than VIIII

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
      if int >= 800                         # if the number is equal or more than 800
        numeral_string.chomp("M")             # remove an M
        if int >= 800 && int < 900            # if the number is between 800 and 899
          numeral_string += "CCM"               # add CCM
          int -= 800                            # and subtract 800 from the number
        else
          numeral_string += "CM"            # otherwise, add CM
          int -= 900                          # and subtract 900
        end
      end
      for fivehundreds in 1..int/500
        int -= 500
        numeral_string += "D"
      end
    end
    if int >= 100                         # ...and 100s
      if int >= 300                         # if the number is equal or more than 300
        numeral_string.chomp("D")             # remove a D
        if int >= 300 && int < 400            # if the number is between 300 and 400
          numeral_string += "CCD"               # add CCD
          int -= 300                            # and subtract 300 from the number
        else
          numeral_string += "CD"            # otherwise, add CD
          int -= 400                          # and subtract 400
        end
      end
      for hundreds in 1..int/100
        int -= 100
        numeral_string += "C"
      end
    end
    if int >= 50                          # ...50s
      if int >= 80                         # if the number is equal or more than 80
        numeral_string.chomp("C")             # remove a C
        if int >= 80 && int < 90              # if the number is between 80 and 89
          numeral_string += "XXC"               # add XXC
          int -= 80                             # and subtract 80 from the number
        else
          numeral_string += "XC"            # otherwise, add XC
          int -= 90                          # and subtract 90
        end
      end
      for fifties in 1..int/50
        int -= 50
        numeral_string += "L"
      end
    end
    if int >= 10                          # ...10s
      if int >= 30                         # if the number is equal or more than 30
        numeral_string.chomp("L")             # remove an L
        if int >= 30 && int < 40              # if the number is between 30 and 39
          numeral_string += "XXL"               # add XXL
          int -= 30                             # and subtract 30 from the number
        else
          numeral_string += "XL"            # otherwise, add XL
          int -= 40                          # and subtract 40
        end
      end
      for tens in 1..int/10
        int -= 10
        numeral_string += "X"
      end
    end
    if int >= 5                           # ...5s
      if int >= 8                         # if the number is equal or more than 8
        numeral_string.chomp("X")           # remove an X
        if int == 8                         # if the number is 8
          numeral_string += "IIX"             # add IIX
          int -= 8                            # and subtract 8 from the number
        else
          numeral_string += "IX"            # otherwise, add IX
          int -= 9                          # and subtract 9
        end
      end
      for fives in 1..int/5
        int -= 5
        numeral_string += "V"
      end
    end
    if int >= 1                           # ...and 1s
      if int >= 3                         # if there are more than 3 1s
        numeral_string.chomp("V")           # remove a V
        if int == 3                         # if there are exactly 3 1s
          numeral_string += "IIV"             # add IIV
          int -= 3                            # and subtract 3 from the number
        else
          numeral_string += "IV"            # otherwise, add IV
          int -= 4                          # and subtract 4
        end
      end
      for ones in 1..int
        int -= 1
        numeral_string += "I"
      end
    end
    puts numeral_string                   # then puts the string of numerals that represent the number
  end
end

Numerals.convert_integer(1945)