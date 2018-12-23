
def length_of_longest_substring(s)
  return 0 if s.nil?

  longest_path = 0
  substring = []
  (0..s.length-1).each do |i|
    cur_letter = s[i]
    
    if occurred_index = substring.index(cur_letter)
      longest_path = [longest_path, substring.size].max
      substring = substring[(occurred_index + 1)..-1] + [cur_letter]
    else
      substring << cur_letter
    end
  end
  [longest_path, substring.size].max
end

puts length_of_longest_substring('abcabcbb')
puts length_of_longest_substring('bbbbb')
puts length_of_longest_substring('pwwkew')
puts length_of_longest_substring(' ')
puts length_of_longest_substring('')