class PigLatinizer
  attr_accessor :phrase, :word
  def initialize
  end

  def piglatinize(word)
    @word = word
    if @word[0].match(/[aeiou|AEIOU]/)
      new_word = @word + "way"
    else
      index = @word.index(/[aeiou]/)
      new_word = @word[index, @word.length] + @word[0, index ] + "ay"
    end
    new_word
  end

  def to_pig_latin(phrase)
    @phrase = phrase
    phrase_array = @phrase.split(" ")
    new_phrase = ""
    phrase_array.each do |word|
      new_word = self.piglatinize(word)
      new_phrase += new_word
      new_phrase += " "
    end
    new_phrase[0, (new_phrase.length - 1)]
  end
end
