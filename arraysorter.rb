# Programme to accept any number of words to add to an array then sort them alphabetically
# without using .sort

words = ["delta", "alpha", "foxtrot", "zulu", "mike", "yankee", "charlie"]
word = ""

def sortList(list)
  while true
    move = false
    (list.length-1).times do |word|
      if list[word] > list[word+1]
        list[word], list[word+1] = list[word+1], list[word]
        move = true
      end
    end
    if !move
      break
    end
  end
  puts list
end

while word != "q"
  print "Enter a word to add to the array (q to quit): "
  word = gets.chomp
  words.push(word)
  sortList(words)
end



