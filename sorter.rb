class Sorter
  def initialize
    @text = File.read('text.txt')
  end

  def sort
    clean_words = @text.gsub(/[".\,?;\n]/, ' ').split
    numbers = counting(clean_words)
    pairs = clean_words.zip(numbers).uniq
    sorted = sorting(pairs)
    final_answer = phrases(sorted)
    printer(final_answer)
  end

  def counting(clean_words)
    clean_words.map do |word|
       clean_words.count(word)
    end
  end

  def sorting(pairs)
    pairs.sort_by do |word, number|
      number
    end.reverse
  end

  def phrases(sorted)
    sorted.map do |word, number|
      "'#{word}' occurred #{number} #{pluralize(number)}."
    end
  end

  def printer(final_answer)
   File.open('new_info.md', 'w+') do |f|
     final_answer.each { |sentence| f.puts(sentence) }
   end
  end

  def pluralize(number)
    if number > 1
      "times"
    else
      "time"
    end
  end

end

sorter = Sorter.new
sorter.sort

# 'Generate a count of the occurrences of each word for the text in the text.txt file. Output to the console a list of words and counts in descending count order (word with highest count listed first).
#
# Bonus: Output to a file as an HTML table.'
