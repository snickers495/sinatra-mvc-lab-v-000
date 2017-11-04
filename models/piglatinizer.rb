class PigLatinizer
  attr_accessor :phrase, :word
  def initialize
  end

  def piglatinize(word)
    @word = word
    if @word[0].match(/[aeiou|AEIOU]/)
      new_word = @word + "way"
    elsif !@word[0].match(/[aeiou|AEIOU]/) && !@word[1].match(/[aeiou]/) && !@word[2].match(/[aeiou]/)
      new_word = @word[3, @word.length] + @word[0, 3] + "ay"
    elsif !@word[0].match(/[aeiou|AEIOU]/) && !@word[1].match(/[aeiou]/)
      new_word = @word[2, @word.length] + @word[0, 2] + "ay"
    else
      new_word = @word[1, @word.length] + @word[0] + "ay"
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
