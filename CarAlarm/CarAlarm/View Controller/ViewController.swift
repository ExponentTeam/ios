//
//  ViewController.swift
//  CarAlarm
//
//  Created by Володимир Височанський on 03.04.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "welcome")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        
       
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        
    }


}

