//
//  BezierPathViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 01/09/2022.
//

import UIKit

class BezierPathViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let width: CGFloat = 200
        let height: CGFloat = 200
        
        let demoView = DemoPathView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                                  y: self.view.frame.size.height/2 - height/2,
                                                  width: width,
                                                  height: height))
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            demoView.transform = demoView.transform.rotated(by: 10)
            //        }
            self.view.addSubview(demoView)
        }
        
        
    }
}

class DemoPathView: UIView {
  
    var demoPath: UIBezierPath!
       
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        self.backgroundColor = UIColor.gray
    }
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        creatTriangle()
        UIColor.purple.setFill()
        demoPath.fill()
        UIColor.orange.setStroke()
        demoPath.stroke()
    }
    
    func creatTriangle(){
        demoPath = UIBezierPath()
        demoPath.move(to: CGPoint(x: self.frame.width/2, y: 0))
        demoPath.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        demoPath.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        demoPath.close()
    }
}
