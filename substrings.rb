# Implement a method 'substrings' that takes a word as the first
# argument and then an array of valid substrings (your dictionary) as the second
# argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
  subs_hash = {}
  word_array = word.split(" ")
  dictionary.each do |dictionary_word|
    word_array.each do |w|
      if w.include?(dictionary_word)
        if subs_hash.has_key?(dictionary_word)
          subs_hash[dictionary_word] += 1
        else
          subs_hash[dictionary_word] = 1
        end
      end
    end
  end
  subs_hash
end

# test

puts substrings("below down down partner it it it", dictionary)
