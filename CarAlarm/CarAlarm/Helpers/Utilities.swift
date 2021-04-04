

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        textfield.layer.cornerRadius = 8.0
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.purple
        button.layer.cornerRadius = 12.0
        button.tintColor = UIColor.white
    }
    
    
    
}
