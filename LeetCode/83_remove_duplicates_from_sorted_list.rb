# https://leetcode.com/problems/remove-duplicates-from-sorted-list/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  return nil unless head
  tail = head
  cur_value = tail.val

  ptr = head.next
  while ptr
    while ptr && cur_value == ptr.val
      ptr = ptr.next
    end

    if ptr
      cur_value = ptr.val
      tail.next = ptr
      tail = ptr
    end
  end
  tail.next = nil
  head
end
