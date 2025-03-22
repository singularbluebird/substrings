require 'pry-byebug'

def substrings(word, possible_substrings)
  word.downcase!
  pre_hash = []

  possible_substrings.each do |sub|
    substring = ""
    counter = 0
    i = 0
    word.each_char do |chr|
      if chr == sub[i]
        substring += chr 
        i += 1
        if substring == sub
          counter += 1
          pre_hash << [sub, counter]
        end
      elsif i != 0 && substring != ""
        substring = ""
        i = 0
      end    
    end
  end

  return pre_hash.to_h
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
d1 = substrings('below', dictionary)
d2 = substrings("Howdy partner, sit down! How's it going?", dictionary)

puts d1
puts d2
expected_d2 = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
expected_d1 = {"below" => 1, "low" => 1}
test = (expected_d2.eql?(d2) && expected_d1.eql?(d1))
puts "All cases match the exptected output: #{test}"
