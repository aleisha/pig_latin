def convert_word_to_pig_latin(word)
  # pig => igpay
  # channel => annelchay
  # through => oughthray
  # eating => eatingway
  first_punc = word.match(/^.*?([':";\.,\?\!])*/).to_s
  last_punc = word.match(/([':";\.,\?\!])*$/i).to_s
  word.gsub!(/\W/, "")

  first_vowel = word.match(/^.*?([aeiou\W])/i).begin(1)
  first_cap = !!word.match(/\p{Upper}/)
  if first_vowel == 0
    if first_cap
      first_punc + word.capitalize + "way" + last_punc
    else
      first_punc + word + "way" + last_punc
    end
  else
    prefix = word[0..first_vowel - 1]
    rest_of_word = word[first_vowel..word.length - 1]
    final_word = rest_of_word + prefix.downcase + "ay"
    if first_cap
      final_word.capitalize!
    else
      final_word
    end
    final_word = first_punc + final_word + last_punc
  end
end

def translate_to_pig_latin(english_string)
  english_string.split(" ").map { |es| convert_word_to_pig_latin(es) }.join(" ")
end

puts translate_to_pig_latin("Lola’s \"fun\" friends 'twere laughing toward London,")

#:;.,?! If word ends with one of these the new word should end with it, but not have it buried
#Deal with capital letters.  If old word had a cap then now word has a cap on first letter
#McDonald => Onaldmcday