import UIKit

class VeiculosTableViewController: UITableViewController {
    
    var brand: Brand!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(brand.name);
    }

}
