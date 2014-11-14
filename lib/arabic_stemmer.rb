require "arabic_stemmer/version"

module ArabicStemmer
  def self.to_arabic_stem(word)
    key_words = ["الله"]

    # 1. Remove non alpha numeric characters.
    word = word.strip.gsub(/[._,،\"\':;&?؟()]/, '')

    # 2. Remove diacratical marks ً َ ُ ٌ ٍ ِ ْ ّ
     word = word.gsub(/[\u064b\u064c\u064d\u064e\u064f\u0650\u0651\u0652]/, '')
    # word = word.gsub(/[\uFE77]/, '')

    # 3. Convert أآإ to ا
    word = word.gsub(/[\u0622\u0623\u0625]/, 'ا')

    # 4. check against some words that should not be stemmed
    return word if key_words.include? word or is_word_short(word)

    # 5. remove prefixes
    word = remove_suffix(word)

    return word if is_word_short(word)
    
    # 6. remove suffixes
    word = remove_prefix(word)
    
    return word
  end
  
   def self.remove_suffix(word)
    # Remove ات ان ون كم ين هم هن
    suffixes = ["هم", "ين", "ون", "ان", "كم", "ات", "هن"]
    letters = word[-2, 2]
    word.slice!(letters) if suffixes.include? letters
    return word
  end

  def self.remove_prefix(word)
    # Remove ال وال كال سي ست, al, wal, kal, saya, sata
    # check if the word is >= 5
    prefix_2 = ["ال", "سي", "ست", "لل"]
    letters = word[0..1]
    return word[2..-1] if prefix_2.include? letters

    prefix_3 = ["وال", "كال"]
    letters = word[0..2]
    return word[3..-1] if prefix_3.include? letters
    return word
  end

  def self.is_word_short(word)
    return word.size <= 3
  end
end
