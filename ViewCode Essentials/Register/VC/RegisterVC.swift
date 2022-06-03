import UIKit

class RegisterVC: UIViewController {
    
    var register: RegisterScreen?
    
    override func loadView() {
        self.register = RegisterScreen()
        self.view = self.register
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
