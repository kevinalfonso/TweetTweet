//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by Kevin Alfonso on 2/22/17.
//  Copyright © 2017 Kevin Alfonso. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLoginButton(_ sender: UIButton) {
        
        TwitterClient.sharedInstance.login(success: { 
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }) { (error: Error) in
            print("error : \(error.localizedDescription)")
        }
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


