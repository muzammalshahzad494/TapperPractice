//
//  ZigZagViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 07/09/2022.
//

import UIKit

class ZigZagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        convert("PAHNAPLSIIGYIR", 3)
        // Do any additional setup after loading the view.
    }
    

    //Find ZigZag Pattern
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1{
            return s
        }
        
        var result = [Character]()
        let maxColumn = ceil(Double(s.count * 2) / Double(numRows + max(numRows - 2, 0)))
        print(maxColumn)
        return String(result)
    }

}
