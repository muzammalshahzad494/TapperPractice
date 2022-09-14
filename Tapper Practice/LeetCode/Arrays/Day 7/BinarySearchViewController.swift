//
//  BinarySearchViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 13/09/2022.
//

import UIKit

class BinarySearchViewController: UIViewController {
   
    let nums = [-1,0,3,5,9,12]
    var target = 9
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        search(nums, target)
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        // Sort Array
        let sortedArray = nums.sorted()
        var lowerIndex = 0
        var upperIndex = sortedArray.count
        
        while lowerIndex <= upperIndex {
            let currentIndex = (lowerIndex + upperIndex)/2
            if (sortedArray[currentIndex] == target){
                return currentIndex
            }else if (sortedArray[currentIndex] > upperIndex) {
                 upperIndex = currentIndex - 1
            }else {
                lowerIndex = currentIndex + 1
            }
        }
        return -1
    }
    
}

