//
//  JavascriptViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 30/08/2022.
//

import UIKit
import JavaScriptCore

class JavascriptViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsSource = "var testFunct = function(message) { return \"Test Message: \" + message;}"
        
        let contex = JSContext()
        contex?.evaluateScript(jsSource)
        let testFunction = contex?.objectForKeyedSubscript("testFunct")
        let result = testFunction?.call(withArguments: ["the message"])
        
        
        print(result)
        print(testFunction)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
