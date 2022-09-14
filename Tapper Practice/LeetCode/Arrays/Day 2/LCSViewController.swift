//
//  LCSViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 08/09/2022.
//

import UIKit

class LCSViewController: UIViewController {
    
    let p = "PAHNAPLSIIGYIR"
    let s = "axb"
    let t = "ahbgdc"
    override func viewDidLoad() {
        super.viewDidLoad()
//        isSubsequence(s, t)
//        p.utf8
        
    }
    
//    func convert(_ s: String, _ numRows: Int) -> String {
//            var arr = Array<String>(repeating: String(), count: numRows)
//            var i = 0
//            let charArr = s.randomElement()
//
//        let len = charArr.debugDescription.count
//            while i < len {
//                var index = 0
//                while index < numRows && i < len {
//                    arr[index] = charArr[i]
//                    i += 1
//                    index += 1
//                }
//                index = numRows - 2
//                while index > 0 && i < len {
//                    arr[index].append(charArr[i])
//                    i += 1
//                    index -= 1
//                }
//            }
//            var res = String()
//            for i in 0 ..< numRows {
//                res += arr[i]
//            }
//            return res
//        }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sub = Array(s.utf8)
        let string = Array(t.utf8)
        
        var subIndex = 0
        var stringIndex = 0
        
        print(sub)
        print(string)
        while stringIndex < string.count, subIndex < sub.count {
            if string[stringIndex] == sub[subIndex]{
                subIndex += 1
            }
            stringIndex += 1
        }
        return subIndex == sub.count
    }
}


class Solution {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2

        let head: ListNode = ListNode(0)
        var tmp = head
        while list1 != nil && list2 != nil {
            let v1 = list1!.val
            let v2 = list2!.val

            if v1 > v2 {
                tmp.next = list2!
                list2 = list2?.next
            } else {
                tmp.next = list1!
                list1 = list1?.next
            }
            tmp = tmp.next!
        }
        tmp.next = list1 ?? list2
        return head.next
    }
}
