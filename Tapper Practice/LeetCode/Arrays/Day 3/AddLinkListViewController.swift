//
//  AddLinkListViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 09/09/2022.
//

import UIKit

class AddLinkListViewController: UIViewController {
    
   var list1 = [1,2,4], list2 = [1,3,4]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mergeTwoLists(list1, list1)
        // Do any additional setup after loading the view.
    }
    

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        var head : ListNode = ListNode(0)
        var temp = head
        
        while list1 != nil && list2 != nil{
            let v1 = list1!.val
            let v2 = list2!.val
            
            if v1 > v2 {
                temp.next = list2!
                list2 = list2?.next
            }else{
                temp.next = list1!
                list1 = list1?.next
            }
            temp = temp.next!
        }
        temp.next = list1 ?? list2
        return head.next
    }
    
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
