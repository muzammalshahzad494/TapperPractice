//
//  SafariViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 01/09/2022.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController, SFSafariViewControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UIApplication.shared.keyWindow?.sendEvent as Any)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openWebView(_ sender: Any) {
        guard let url = URL(string: "https://javatpoint.com") else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
        
    }
}

extension SafariViewController {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}


class TouchMock: UITouch {
    var y: CGFloat

    init(y: CGFloat) {
        self.y = y
        super.init()
    }

    override func location(in view: UIView?) -> CGPoint {
        return CGPoint(x: 10, y: y)
    }
}
