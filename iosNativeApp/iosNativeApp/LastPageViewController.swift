//
//  LastPageViewController.swift
//  iosNativeApp
//
//  Created by Macbook on 09/06/2023.
//

import UIKit


class LastPageViewController: UIViewController {
    
    var sl : Int!
    var username : String!
    var password : String!
    var index : Int!
    
    @IBOutlet var areaText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        areaText.text = "you buy \(sl!) items of item \(index + 1)  with username is \(username!) and password is \(password!)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapOnBackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
