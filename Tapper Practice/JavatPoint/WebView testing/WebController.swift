import UIKit
import WebKit

class WebController: UIViewController, WKNavigationDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var glassView: WKWebView!
    @IBOutlet weak var ref: UILabel!
    @IBOutlet weak var onClickBtn: UIButton!
    
    var yOffSet = 0
    var link = "https://stackoverflow.com/questions/38075699/swift-programmatically-click-on-point-in-screen/38124175"
    var linksArray = ["https://stackoverflow.com/questions/4961386/event-handling-for-ios-how-hittestwithevent-and-pointinsidewithevent-are-r/4961484#4961484","https://www.javatpoint.com/ios-managed-object-model", "https://www.youtube.com/watch?v=wO4XBQyUq9E","https://codewithchris.com/swift-tutorial/", "https://www.youtube.com/watch?v=wO4XBQyUq9E","https://codewithchris.com/swift-tutorial/"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load Webview
        let myURL = URL(string: link)
        let myRequest = URLRequest(url: myURL!)
        glassView.load(myRequest)
        self.view.isUserInteractionEnabled = true
        
        
        // For WebView Coordinates
        let webViewTapped = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        webViewTapped.delegate = self
        view.addGestureRecognizer(webViewTapped)
        
        //Function Call
//        webViewDidFinishLoad(webView: glassView)
        
        
        //Repeaters Scrolling
        //        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        
        //Touch Events
//                Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(webViewDidFinishLoad(webView:)), userInfo: nil, repeats: true)
        
        
        //XC Touch Testing
        //        let app = XCUIApplication()
        //        let webView = app.webViews.element
        //        let coordinate = webView.coordinateWithNormalizedOffset(CGVector(dx: 10, dy: 10))
        //        coordinate.tap()
    }
    
    
    
    
    //Testing Fucntions
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let point  = sender?.location(in: glassView.scrollView)
        ref.text = "x: \(point!.x) y: \(point!.y)"
        print("Coordinates x: \(point!.x) y: \(point!.y)")
    }
    //Ends
    
    
    
    //Repeaters Scrolling Functions
    @objc func timerAction() {
        yOffSet += 10;
        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.glassView.scrollView.contentOffset.y = CGFloat(self.yOffSet)
        },
                       completion: nil)
    }
    
    
    //Touch events Implementations
    @objc func touchActions() {
        print("hh")
    }
    
    
    
    //WebView Detections
    //    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
    //
    //        switch navigationAction.navigationType {
    //        case .linkActivated:
    //            if navigationAction.targetFrame == nil {
    //                self.webView?.load(navigationAction.request)// It will load that link in same WKWebView
    //            }
    //        default:
    //            break
    //        }
    //
    //        if let url = navigationAction.request.url {
    //            print(url.absoluteString) // It will give the selected link URL
    //
    //        }
    //        decisionHandler(.allow)
    //    }
    //
   
    @IBAction func clickMe(_ sender: Any) {
//        for url in linksArray.randomElement()!{
//            self.link = linksArray[url]
//        }
        
        if let randomElement = linksArray.randomElement() {
            self.link = randomElement
            print(randomElement)
        }
       
    }
    
    @objc func webViewDidFinishLoad(webView: WKWebView) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 5) {
            if self.glassView.isLoading {
                return
            } else {
                self.simulateTap()
            }
        }
    }
    
    
    
    func simulateTap() {
        onClickBtn.sendActions(for: .touchUpInside)
        let pointOnTheScreen = CGPoint(x: 0, y: 200)
        self.glassView.hitTest(pointOnTheScreen, with: nil)
//        self.glassView.overlapHitTest(point: pointOnTheScreen, withEvent: nil)
        self.glassView.point(inside: pointOnTheScreen, with: nil)
        print("tap on screen")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self.view)
            print("point touched: \(touchLocation)")
        }
        super.touchesBegan(touches, with:event)
    }
    
    
}

extension UIView {
    func overlapHitTest(point: CGPoint, with event: UIEvent?) -> UIView? {
        // 1
        if !self.isUserInteractionEnabled || self.isHidden || self.alpha == 0 {
            return nil
        }
        //2
        var hitView: UIView? = self
        if !self.point(inside: point, with: event) {
            if self.clipsToBounds {
                return nil
            } else {
                hitView = nil
            }
        }
        //3
        for subview in self.subviews.reversed() {
            let insideSubview = self.convert(point, to: subview)
            if let sview = subview.overlapHitTest(point: insideSubview, withEvent: event) {
                return sview
            }
        }
        return hitView
    }
}
