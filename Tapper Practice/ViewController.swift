//
//  ViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 27/08/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var glassView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        glassView.addInteraction(<#T##interaction: UIInteraction##UIInteraction#>)
        // Do any additional setup after loading the view.
        guard let url = URL(string: "https://developer.apple.com/documentation/webkit/wkwebview") else { return }
        let request = URLRequest(url: url)
        webView = WKWebView(frame: glassView.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.load(request)
        self.glassView.addSubview(webView)
        
//        self.webView.delegate = self
//        let url = NSURL (string: "http://www.tiscali.it");
//        let requestObj = NSURLRequest(url: url! as URL)
//        self.webView.loadRequest(requestObj as URLRequest)
//        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
////        webView = WKWebView(frame: glassView.bounds, configuration: WKWebViewConfiguration())
////        webView.allowsBackForwardNavigationGestures = true
//        self.view.isUserInteractionEnabled = true
    }
    
    // UIWebViewDelegate
    func webViewDidStartLoad(_ webView: WKWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: WKWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        if self.webView.isLoading {
               return
           } else {
               simulateTap()
           }
       }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    
    func simulateTap() {
        let pointOnTheScreen = CGPoint(x: 156.0, y: 506.6)
        self.glassView.hitTest(pointOnTheScreen, with: nil)
        self.glassView.overlapHitTest(point: pointOnTheScreen, withEvent: nil)
             print("tap on screen")
        }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchs = touch.location(in: self.view)
            print("point touched: \(touchs)")
        }
        super.touchesBegan(touches, with:event)
    }
}

extension UIView {
    func overlapHitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
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






