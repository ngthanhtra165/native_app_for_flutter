//
//  ChangeToFlutter.swift
//  iosNativeApp
//
//  Created by Macbook on 05/06/2023.
//

import UIKit
import Flutter

class ChangeToFlutter: UIViewController {
    private let notifitacionCenter = NotificationCenter.default
    var username : String?
    var password : String?
    var index : Int!
    @IBOutlet var usernameInput: UITextField!
    @IBOutlet var passwordInput: UITextField!
    @IBAction func touchUpInside(_ sender: Any) {
        username = usernameInput.text
        password = passwordInput.text
        
        notifitacionCenter.addObserver(self, selector: #selector(loginCallInputInfo(_:)), name: .loginCallInputInfo , object: nil)

        
        var flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngineDetailScreen
        flutterEngine.run(withEntrypoint: "runDetailScreen")
        let detailScreenController = DetailItemViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        detailScreenController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(detailScreenController, animated: true)
    }
    
    @objc func loginCallInputInfo(_ notification : Notification) {
        print("login Call InputInfo success")
        notifitacionCenter.post(name: .inputInfoCallLogin, object: ["username" : username! , "password" : password! ,"index" : index])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    // when tap to change screen button
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
