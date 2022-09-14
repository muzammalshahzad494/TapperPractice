//
//  CGAffineViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 01/09/2022.
//

import UIKit

class CGAffineViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func clickedTranslateBtn(_ sender: Any) {
        //translation
//        self.myView.transform = myView.transform.translatedBy(x: 10, y: 10)
        
        //Scaled
//        self.myView.transform = myView.transform.scaledBy(x: 1.2, y: 1.5)
        
        //Rotation matrix
        self.myView.transform = myView.transform.rotated(by: 10)
    }
}
