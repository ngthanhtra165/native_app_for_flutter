//
//  ViewController.swift
//  iosNativeApp
//
//  Created by Macbook on 04/06/2023.
//

import UIKit
import Flutter

extension Notification.Name {
    static var homeCallDetail: Notification.Name {
        return .init("tap.Successful")
    }
    static var detailCallHome: Notification.Name {
        return .init("huhu")
    }
    static var inputInfoCallLogin : Notification.Name {
        return .init("..")
    }
    static var loginCallInputInfo : Notification.Name {
        return .init("...")
    }
}
class ViewController: FlutterViewController {
    
    var flutterEngineHomeScreen : FlutterEngine!
    private let notifitacionCenter = NotificationCenter.default
    var value : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        addSetMethodHandler()
        addFlutterView()
    }
    
    func addSetMethodHandler() {
        // create the flutter channel
        let flutterChannel = FlutterMethodChannel(name: "com.thanhtra.iosNativeApp", binaryMessenger: self.binaryMessenger)
        
        flutterChannel.setMethodCallHandler({[weak self](call: FlutterMethodCall , result: FlutterResult) -> Void in
            switch call.method {
                // the task is move the next screen of native
            case "moveToNextPageWithIndex":
                print("tap tap tap")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                let customViewController = storyboard.instantiateViewController(withIdentifier: "ChangeToFlutter") as! ChangeToFlutter
                
                guard let args = call.arguments as? [String : Any] else {return}
                self?.value = args["index"] as? Int
                
                print("value in viewcontroller is \(self?.value!)")
                self?.notifitacionCenter.addObserver(self!, selector: #selector(self?.detailCallHome(_:)),name: .detailCallHome, object: nil)
                // move to next
                customViewController.index = self?.value!
                self?.navigationController?.pushViewController(customViewController, animated: true)
            default: // fail to request
                result(FlutterMethodNotImplemented)
                return
            }
        })
        
    }
    @objc func detailCallHome(_ notification : Notification) {
        print("detail Call home")
        notifitacionCenter.post(name: .homeCallDetail, object: ["index" : value!])
    }
    // display the flutter screen for first screen of app
    func addFlutterView()  {
        flutterEngineHomeScreen = (UIApplication.shared.delegate as! AppDelegate).flutterEngineHomeScreen
        let myFlutterView = FlutterViewController(engine: flutterEngineHomeScreen, nibName: nil, bundle: nil)
        view.addSubview(myFlutterView.view)
       }

}

