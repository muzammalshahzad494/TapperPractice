//
//  SearchBarViewController.swift
//  Tapper Practice
//
//  Created by Emblem Technologies on 01/09/2022.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController {

    let messageButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMessageButton()
        // Do any additional setup after loading the view.
    }
    

    func setUpMessageButton(){
          view.addSubview(messageButton)
          messageButton.backgroundColor = .systemBlue
          messageButton.addTarget(self, action: #selector(showMailUI), for: .touchUpInside)
          messageButton.setTitle(NSLocalizedString("Send Email", comment: ""), for: .normal)
          messageButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    
    
          messageButton.translatesAutoresizingMaskIntoConstraints = false
          messageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          messageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          messageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
          messageButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
      }
        
      @objc func showMailUI(){
          guard MFMailComposeViewController.canSendMail() else {
                   return
               }
               let mailComposer = MFMailComposeViewController()
               mailComposer.mailComposeDelegate = self
               mailComposer.setToRecipients(["muzammalshahzad494@gmail.com"])
               mailComposer.setSubject("Hey david!")
               mailComposer.setMessageBody("Hi, how's you ", isHTML: false)
               present(mailComposer, animated: true)
      }

}

extension EmailViewController : MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil{
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled, .failed, .saved, .sent:
            break
        default:
            debugPrint("default")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
