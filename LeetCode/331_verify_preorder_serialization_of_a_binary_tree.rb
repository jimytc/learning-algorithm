# https://leetcode.com/problems/verify-preorder-serialization-of-a-binary-tree/

test_set = [
  {
    string: '9,3,4,#,#,1,#,#,2,#,6,#,#',
    expect: true
  },
  {
    string: '1,#',
    expect: false
  },
  {
    string: '9,#,#,1',
    expect: false
  },
  {
    string: '1,#,#,#,#',
    expect: false
  },
  {
    string: '#,#,1,2,3',
    expect: false
  },
  {
    string: '#',
    expect: true
  },
  {
    string: '2,#,#,6,9,9,#,7,#,#,#',
    expect: false
  }
]

#
# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
  sum = 0
  words = preorder.split(',')
  preorder_length = words.length
  words.each_with_index do |letter, i|
    if letter == '#'
      sum += -1
    else
      sum += 1
    end
    if sum == -1 && i < (preorder_length - 1)
      return false
    end
  end
  return sum == -1
end

test_set.each do |t|
  result = is_valid_serialization(t[:string])
  puts "Test: %s\n\tExpect: %s\n\tActual: %s" % [ t[:string], t[:expect], result ]
end
