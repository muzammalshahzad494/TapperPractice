//
//  BadVerionViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 13/09/2022.
//

import UIKit

class BadVerionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
}


//func firstBadVersion(_ n: Int) -> Int {
//    var start = 1
//    var end = n
//
//    while (start < end) {
//                var num = (start + end) / 2
//                if (isBadVersion(num)) {
//                    end = num
//                } else {
//                    start = num + 1
//                }
//            }
//
//    return end
//}
