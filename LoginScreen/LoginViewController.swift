//
//  ViewController.swift
//  LoginScreen
//
//  Created by Gonzalo Caballero on 6/30/16.
//  Copyright © 2016 Gonzalo Caballero. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccount(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(userName.text!, password: passWord.text!, completion: {
            user, error in
            
            if error != nil {
                print("Error")
            } else {
                print("Cuenta Creada")
                var register = false
            }
            
        })
    }

}

