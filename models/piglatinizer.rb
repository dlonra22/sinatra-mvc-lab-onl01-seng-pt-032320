class PigLatinizer
  attr_reader :user_phrase
  
  def piglatinize(words)
    wrd_array = words.split(" ")
    piglatin = nil
    if wrd_array.count > 1
      piglatin = wrd_array.collect do |w|
                  self.class.latinize(w)
                end
      piglatin.join(" ")
    elsif wrd_array.count < 2
      piglatin = self.class.latinize(wrd_array.first)
    end
    @user_phrase = piglatin
  end
    
  def self.latinize(word)
      w = word.gsub('/[^a-Z]/','')
      newword = ""
      vowels = "aeiouAEIOU"
      frst_char = w.split.first
      if vowels.include?(frst_char)
        newword = w + "way"
      else 
        iscons = true
        count = -1
        w.split.each do |c|
          unless vowels.include?(c)
            if iscons
              count +=1
            end
          else
            iscons = false
          end
        end
        i=count+1
        pst = w[0..count]
      midword = w[i..-1]
      newword = midword + pst + "ay"
      end
      newword
  end
      
end