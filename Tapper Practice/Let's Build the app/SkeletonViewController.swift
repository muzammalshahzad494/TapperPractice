//
//  SkeletonViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 06/09/2022.
//

import UIKit
import UIView_Shimmer

class SkeletonViewController: UIViewController {

    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var headerView: UIView!
    
    var shimmeringAnimatedItems: [UIView] {
            [
                headerView,
                view1,
                view2,
                view3,
                view4,
                view5
            ]
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.setTemplateWithSubviews(true)
        
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        let darkTextLable = UILabel()
        darkTextLable.text = "Shimmer"
        darkTextLable.textColor = UIColor(white: 1, alpha: 0.1)
        darkTextLable.font = UIFont.boldSystemFont(ofSize: 80)
        darkTextLable.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        darkTextLable.textAlignment = .center
        view.addSubview(darkTextLable)
        
        let shinnyTextLable = UILabel()
        shinnyTextLable.text = "Shimmer"
        shinnyTextLable.textColor = .white
        shinnyTextLable.font = UIFont.boldSystemFont(ofSize: 80)
        shinnyTextLable.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        shinnyTextLable.textAlignment = .center
        view.addSubview(shinnyTextLable)
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinnyTextLable.frame
        
        
        //Angle
        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        //Animations
        let animation = CABasicAnimation()
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity

        gradientLayer.add(animation, forKey: "Just key")
//         Do any additional setup after loading the view.
    }
    

}
