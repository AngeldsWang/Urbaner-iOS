//
//  LoginViewController.swift
//  Urbaner
//
//  Created by wang-zhenjun on 2017/05/15.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {
    @IBOutlet weak var loginBtnLabel: UrbanLabel!
    @IBOutlet weak var loginTitleLabel: UrbanLabel!
    @IBOutlet weak var forgetPasswordLabel: UrbanLabel!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(LoginViewController.backToLaunchScreenController))
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func backToLaunchScreenController() {
        self.performSegue(withIdentifier: "backToLaunchSegue", sender: self)
    }
    
    @IBAction func fackbookLoginBtnClicked(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login with Facebook")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                print("token: \(accessToken), \(grantedPermissions), \(declinedPermissions)")
                self.defaults.setValue("facebook", forKey: "loginMode")
                self.defaults.set(true, forKey: "loginStatus")
                self.performSegue(withIdentifier: "moveToMain", sender: self)
            }
        }
    }
}
