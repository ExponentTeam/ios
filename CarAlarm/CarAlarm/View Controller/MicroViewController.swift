import UIKit

class MicroViewController: UIViewController {
    
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var lastButton: UIButton!
    
    @IBOutlet weak var microButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
    }
    
    func setUpElements() {
        Utilities.styleFilledButton1(homeButton)
        Utilities.styleFilledButton1(cameraButton)
        Utilities.styleFilledButton1(microButton)
        Utilities.styleFilledButton1(lastButton)
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        let cameraViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.cameraViewController) as? CameraViewController
        
        self.view.window?.rootViewController = cameraViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func lastTapped(_ sender: Any) {
        let lastViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.lastViewController) as? LastViewController
        
        self.view.window?.rootViewController = lastViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    
}
