//
//  LoginViewController.swift
//  iosNativeApp
//
//  Created by Macbook on 09/06/2023.
//

import UIKit
import Flutter

class LoginViewController: FlutterViewController {
    
    let notificationCenter = NotificationCenter.default
    var usernameFromInfo : String!
    var passwordFromInfo : String!
    var index : Int!
    var sl : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: #selector(inputInfoCallLogin(_:)), name: .inputInfoCallLogin, object: nil)
        
        notificationCenter.post(name: .loginCallInputInfo, object: nil)
        // Do any additional setup after loading the view.]
        
        addMethodHandler()
    }
    
    
    @objc func inputInfoCallLogin(_ notification : Notification) {
        print("inputInfo call login success")
        
        // get data from notification
        let args = notification.object as? [String : Any] ?? [:]
        usernameFromInfo = (args["username"] as? String)
        passwordFromInfo = args["password"] as? String
        index = args["index"] as! Int
    }
    
    // set up handler
    func addMethodHandler() {
        let flutterChannel = FlutterMethodChannel(name: "LoginView", binaryMessenger: self.binaryMessenger)
        
        flutterChannel.setMethodCallHandler({
            [weak self](call : FlutterMethodCall , result : FlutterResult) -> Void in
            switch call.method {
            case "tapOnSubmit":
                
                print("tap on submit button")
                
                var args = call.arguments as? [String : Any]
                
                guard let argsNew = args else { return }

                // need to check with
                let username = argsNew["username"] as? String
                let password = argsNew["password"] as? String
               
                if(username == self?.usernameFromInfo && password == self?.passwordFromInfo) {
                    // login success
                    print("log in success")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)

                    let customViewController = storyboard.instantiateViewController(withIdentifier: "LastPageViewController") as! LastPageViewController
                    customViewController.username = username
                    customViewController.password = password
                    customViewController.index = self?.index
                    customViewController.sl = self?.sl
                    self?.navigationController?.pushViewController(customViewController, animated: true)
                    
                }
                else {
                    // fail
                    print("login fail")
                    
                    flutterChannel.invokeMethod("notifyToAleartDialog", arguments: [])
                    
                }
                
            default:
                result(FlutterMethodNotImplemented)
                return
            }
            
        })
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
