//
//  HomeViewController.swift
//  CarAlarm
//
//  Created by Володимир Височанський on 03.04.2021.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var micButton: UIButton!
    
    @IBOutlet weak var lastButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        
        // Hide the error label

        
        // Style the elements

        Utilities.styleFilledButton1(homeButton)
        Utilities.styleFilledButton1(cameraButton)
        Utilities.styleFilledButton1(micButton)
        Utilities.styleFilledButton1(lastButton)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cameraTapped(_ sender: Any) {
        let cameraViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.cameraViewController) as? CameraViewController
        
        self.view.window?.rootViewController = cameraViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func micTapped(_ sender: Any) {
        let microViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.microViewController) as? MicroViewController
        
        self.view.window?.rootViewController = microViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    
    @IBAction func lastTapped(_ sender: Any) {
        let lastViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.lastViewController) as? LastViewController
        
        self.view.window?.rootViewController = lastViewController
        self.view.window?.makeKeyAndVisible()
    }
}
