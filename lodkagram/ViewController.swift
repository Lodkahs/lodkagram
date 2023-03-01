//
//  ViewController.swift
//  lodkagram
//
//  Created by Andrew  on 2/28/23.
//
// He's my Instagram killer app

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("hello")
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
            }
            
        } else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password?")
        }
        
        
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    


}

