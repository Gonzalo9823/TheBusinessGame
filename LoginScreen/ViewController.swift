//
//  ViewController.swift
//  LoginScreen
//
//  Created by Gonzalo Caballero on 6/30/16.
//  Copyright © 2016 Gonzalo Caballero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func crear(sender: AnyObject) {
        
        
        print("FUNCIONA")
        let vc = storyboard?.instantiateViewControllerWithIdentifier("Login") as! LoginViewController
        presentViewController(vc, animated: true, completion: nil)
 
    }
    


    
//    @IBAction func createAccount(sender: AnyObject) {
//        print("FUNCIONA")
//        let vc = storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
//        
//        presentViewController(vc, animated: true, completion: nil)
//    }
    

}
