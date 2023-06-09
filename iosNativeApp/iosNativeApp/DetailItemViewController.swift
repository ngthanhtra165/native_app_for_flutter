//
//  DetailItemViewController.swift
//  iosNativeApp
//
//  Created by Macbook on 06/06/2023.
//

import UIKit
import Flutter

class DetailItemViewController: FlutterViewController {
    
    var index : Int!
    private var notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("input to detail screen")
        addMethodChannel()
        // Do any additional setup after loading the view.
        //addFlutterView()
    }
    
    func addMethodChannel() {
        let flutterMethodChannel = FlutterMethodChannel(name: "methodForDetailScreen", binaryMessenger: self.binaryMessenger)
        flutterMethodChannel.setMethodCallHandler({ [weak self](call : FlutterMethodCall , result : FlutterResult) -> Void in
            switch call.method {
            case "tapToBuyButton":
                var flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngineLoginScreen
                flutterEngine.run(withEntrypoint: "runLoginScreen")
                
                let args = call.arguments as? [String : Any]
                guard let value = args else { return}
                
                print("value is \(value["sl"]!)")
                
                var loginViewController = LoginViewController(engine: flutterEngine, nibName: nil, bundle: nil)
                loginViewController.modalPresentationStyle = .fullScreen
                loginViewController.sl = value["sl"] as! Int
                
                self?.navigationController?.pushViewController(loginViewController, animated: true)
            default:
                result(FlutterMethodNotImplemented)
                return
            }
        })
        
        // add observe to get index
        // let mainQueue = OperationQueue.main
        //notificationCenter.addObserver(forName: .tapProduct, object: self, queue: <#T##OperationQueue?#>, using: //<#T##(Notification) -> Void#>)
        
        print("method channel")
        
        // trigger method in home screen
        notificationCenter.addObserver(self, selector: #selector(homeCallDetail(_:)), name: .homeCallDetail, object: nil)
        notificationCenter.post(name: .detailCallHome, object: nil)
        
        print("after notification")
        
    }
    
    @objc func homeCallDetail(_ notification : Notification) {
        let flutterMethodChannel = FlutterMethodChannel(name: "methodForDetailScreen", binaryMessenger: self.binaryMessenger)
        print("home call detail")
      
        let args = notification.object as? [String : Any] ?? [:]
        index = args["index"] as? Int
        
        let new = index!
        print("index is \(new)")
        
        print("finish fuc 1")
        
        flutterMethodChannel.invokeMethod("notifyIndexToFlutter", arguments: new)
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
