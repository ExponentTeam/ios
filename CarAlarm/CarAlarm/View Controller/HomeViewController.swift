import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var micButton: UIButton!
    
    @IBOutlet weak var lastButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
    }
    
    func setUpElements() {
        Utilities.styleFilledButton1(homeButton)
        Utilities.styleFilledButton1(cameraButton)
        Utilities.styleFilledButton1(micButton)
        Utilities.styleFilledButton1(lastButton)
    }

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
