//
//  ViewController.swift
//  Login
//
//  Created by Oquba Khan on 7/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var forgotUsername: UIButton!
    
    @IBOutlet weak var forgotPassword: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot username"
        } else if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot password"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }
    @IBAction func forgotUsernameButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotUsernameOrPassword", sender: forgotUsername)
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgotUsernameOrPassword", sender: forgotPassword)
    }
    
    
    

}

