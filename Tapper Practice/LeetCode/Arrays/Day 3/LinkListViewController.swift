//
//  LinkListViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 09/09/2022.
//

import UIKit

class LinkListViewController: UIViewController {

    var lists = [[1,4,5],[1,3,4],[2,6]]
    override func viewDidLoad() {
        super.viewDidLoad()
//        var list = LinkedList<String>()
//        list.append ("hello")
//        list.append("Print")
//        list.append("Fooo")
        
//        Linklist.printLinklist()
       
    }
}



class Nodess<Item> {
    var value : Item
    var next : Nodess?
    
    init(value: Item) {
        self.value = value
        self.next = nil
    }
}

class Linklist<Item>{
    
    // Properties
    var head : Nodess<Item>?
    var tail : Nodess<Item>?
    
    //Head
    var first : Nodess<Item>?{
        return head
    }
    // Tail
    var last : Nodess<Item>?{
        return tail
    }
    
    //Empty node check
    var isEmpty: Bool{
        head == nil
    }
    
    // Count to show how many nodes we have
    var count : Int{
        var currentNode = head
        var counter = 0
        
        while currentNode != nil{
            counter += 1
            currentNode = currentNode?.next
        }
        return counter
    }
    
    func append(value : Item){
        let newnode = Nodess(value: value)
        if let tail = tail {
            tail.next = tail
        }else{
            head = newnode
        }
        tail = newnode
    }
    
    func insert(value : Item){
        if self.head?.value == nil{
            self.head?.value = value
        }else{
            var lastNode = self.head
            while lastNode?.next != nil{
                lastNode = lastNode?.next
            }
            let newNode = Nodess()
            newNode.value = value
            lastNode?.next = newNode
        }
        
       
    }
    
    func nodeAt(index : Int) -> Item? {
        assert(index >= 0, "Index")
        
        var currentNode = head
        var i = index
        
        while currentNode != nil {
            if i == 0{
                return currentNode?.value
            }
            i -= 1
            currentNode = currentNode?.value as! Nodess<Item>
        }
        return nil
    }

}


extension Linklist: CustomStringConvertible{
    var description:String{
        let start = "Link List [Head]"
        var element : [String] = []
        var currentNode = head
        
        while currentNode != nil {
            element.append(String(describing: currentNode?.value))
            currentNode = currentNode?.value as! Nodess<Item>
        }
        
        let output = element.joined(separator: "->")
        return start + output
    }
    
    func printLinklist(){
        print(description)
    }
}









//
//
//extension LinkListViewController{
//    //MARK: - Dealing with Node
//
//    func creatingNode(){
//        let node1 = Nodes(value: 2)
//        let node2 = Nodes(value: 3)
//        let node3 = Nodes(value: 4)
//        let node4 = Nodes(value: 5)
//        let node5 = Nodes(value: 6)
//        let node6 = Nodes(value: 7)
//
//        node1.next = node2
//        node2.next = node3
//        node3.next = node4
//        node4.next = node5
//        node5.next = node6
//
//        print(node1)
//    }
//
//    //MARK: - Dealing with Append LinkList
//    func AppendtoLinklist(){
//        var list = LinkedList<Int>()
//        list.append(3)
//        list.append(2)
//        list.append(1)
//
//        print(list)
//    }
//
//    //MARK: - Dealing with Push LinkList
//    func pushtoLinklist(){
//        var list = LinkedList<Int>()
//        list.push(3)
//        list.push(2)
//        list.push(1)
//
//        print(list)
//    }
//}
//
//
//public class Nodes<Value>{
//    public var value : Value
//    public var next : Nodes?
//
//    init(value: Value, next: Nodes? = nil){
//        self.value = value
//        self.next = next
//    }
//}
//
//extension Nodes: CustomStringConvertible{
//    public var description: String {
//        guard let next =  next else{
//            return "\(Value.self)"
//        }
//        return "\(value) -> " + String(describing: next) + " "
//    }
//}
//
//
//public struct LinkedList<Value> {
//
//    public var head: Nodes<Value>?
//    public var tail: Nodes<Value>?
//
//    public init() {}
//
//    public var isEmpty: Bool {
//        head == nil
//    }
//
//    public mutating func push(_ value : Value){
//        //      1
//        guard !isEmpty else{
//            push(value)
//            return
//        }
//        //       2
//        tail?.next = Nodes(value: value)
//
//        //        3
//        tail = tail?.next
//    }
//
//    public mutating func append(_ value : Value){
//        head = Nodes(value: value, next: head)
//        if tail == nil{
//            tail = head
//        }
//    }
//
//    public func node(at index: Int) -> Nodes<Value>? {
//      // 1
//      var currentNode = head
//      var currentIndex = 0
//
//      // 2
//      while currentNode != nil && currentIndex < index {
//        currentNode = currentNode!.next
//        currentIndex += 1
//      }
//
//      return currentNode
//    }
//}
//
//extension LinkedList: CustomStringConvertible{
//    public var description: String {
//        guard let head = head else {
//            return "Empty List"
//        }
//        return String(describing: head)
//    }
//}
