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

# puts length_of_longest_substring('abcabcbb')
# puts length_of_longest_substring('bbbbb')
# puts length_of_longest_substring('pwwkew')
# puts length_of_longest_substring(' ')
# puts length_of_longest_substring('')

def length_of_longest_substring_2(s)
  return 0 if s.nil?

  first_character_index = 0
  last_character_index = -1
  longest_path = 0
  substring = {}
  index = 0;

  while(index < s.size) do
    cur_letter = s[index]

    if substring[cur_letter] &&
      (first_character_index..last_character_index).include?(substring[cur_letter])
      longest_path = [longest_path, (last_character_index - first_character_index + 1)].max
      first_character_index = substring[cur_letter] + 1
    end
    substring[cur_letter] = index
    last_character_index = index
    index += 1
  end
  [longest_path, (last_character_index - first_character_index + 1)].max
end

puts length_of_longest_substring_2('abcabcbb')
puts length_of_longest_substring_2('bbbbb')
puts length_of_longest_substring_2('pwwkew')
puts length_of_longest_substring_2(' ')
puts length_of_longest_substring_2('')