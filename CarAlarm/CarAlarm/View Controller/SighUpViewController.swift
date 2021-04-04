//
//  SighUpViewController.swift
//  CarAlarm
//
//  Created by Володимир Височанський on 03.04.2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SighUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var sighUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "welcome")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        setUpElements()
        
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
    
        // Hide the error label
        errorLabel.alpha = 0
    
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(sighUpButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func validateFields() -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
    
            
            return "Please fill in all fields"
        }
        
        return nil
    }
    
    @IBAction func sighUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
           showError(error!)
        }else{
            
            let name = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let surname = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    
                    self.showError("Error creating user")
                }else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name":name, "surname":surname, "uid":result!.user.uid]) { (error) in
                        if error != nil{
                            self.showError("blat...")
                        }
                    }
                    
                    
                    self.transitionToHome()
                }
                
            
            }
        }
        
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
}
