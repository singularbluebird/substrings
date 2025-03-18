def substrings(sentence, arr)
  keys = sentence.split
  pre_hash = []

  keys.each do |key|
    pre_hash << [[key, sentence.count(key)]]
  end
  hash = pre_hash.to_h
  return hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings('below', dictionary)

substrings("Howdy partner, sit down! How's it going?", dictionary)
