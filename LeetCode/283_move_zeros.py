# https://leetcode.com/problems/move-zeroes

# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

# For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].

# Note:
#   You must do this in-place without making a copy of the array.
#   Minimize the total number of operations.

class Solution:
  def moveZeros(self, nums):
    indexZero = -1
    indexNonZero = -1
    for i in range(len(nums)):
      if indexZero == -1 and nums[i] == 0:
        indexZero = i

      if nums[i] != 0:
        indexNonZero = i

      if indexNonZero > indexZero and indexZero != -1:
        nums[indexZero], nums[indexNonZero] = nums[indexNonZero], nums[indexZero]
        indexZero += 1
        indexNonZero = -1

    print(nums)


s = Solution()
s.moveZeros([0, 1, 0, 3, 12])
s.moveZeros([1, 0, 0, 3, 12])
s.moveZeros([0, 0, 1, 3, 12])
s.moveZeros([1, 3, 12, 0, 0])
s.moveZeros([1, 3, 12, 4, 5])
s.moveZeros([1, 3, 0, 4, 5])
s.moveZeros([4,2,4,0,0,3,0,5,1,0])