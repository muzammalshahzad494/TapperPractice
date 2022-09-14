//
//  IsomericStringViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 08/09/2022.
//

import UIKit

class IsomericStringViewController: UIViewController {
    var s = "egg"
    var t = "add"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isIsomorphic(s, t)
    }
    
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var stDict = [Character: Character](), tsDict = [Character: Character]()
        let s = Array(s), t = Array(t)
        for (i, sChar) in s.enumerated(){
            let tChar = t[i]
            if  stDict[sChar] == nil && tsDict[tChar] == nil{
                stDict[sChar] = tChar
                tsDict[tChar] = sChar
            }else if stDict[sChar] != tChar && tsDict[tChar] != sChar{
                return false
            }
        }
        return true
    }
    
}



