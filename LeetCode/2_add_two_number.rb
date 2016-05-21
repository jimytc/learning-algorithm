# https://leetcode.com/problems/add-two-numbers/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  if l1.nil? && l2.nil?
    return ListNode.new(0)
  end
  if l1.nil? ^ l2.nil?
    return l1 if !l1.nil?
    return l2 if !l2.nil?
  end

  answer = ListNode.new(0)
  ptr1 = l1
  ptr2 = l2
  node = answer
  node_adv = nil

  while !ptr1.nil? || !ptr2.nil?
    node.next = ListNode.new(0)
    node = node.next

    if ptr1.nil?
      node.val = ptr2.val
    elsif ptr2.nil?
      node.val = ptr1.val
    else
      node.val = ptr1.val + ptr2.val
    end

    node.val += node_adv.val unless node_adv.nil?

    adv = node.val / 10
    node.val %= 10
    if adv != 0
      node_adv = ListNode.new(adv)
    else
      node_adv = nil
    end

    ptr1 = ptr1.next if !ptr1.nil?
    ptr2 = ptr2.next if !ptr2.nil?
  end

  if !node_adv.nil?
    node.next = node_adv
  end

  node = answer
  answer = answer.next
  node.next = nil
  answer
end
