# @param {Integer} x
# @return {Integer}
def reverse(x)
  num = x.abs
  new_num = 0
  while (num > 0)
    new_num = new_num * 10 + num % 10
    num /= 10
  end
  result = x.negative? ? -new_num : new_num
  (-2147483648..2147483647) === result ? result : 0
end