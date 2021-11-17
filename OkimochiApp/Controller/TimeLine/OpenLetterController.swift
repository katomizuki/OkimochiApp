
import UIKit

class OpenLetterController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    @IBAction func prepareForUnwind(segue :UIStoryboardSegue) {
        print(#function)
        performSegue(withIdentifier: "exit", sender: nil)
    }
    
    
    

}
