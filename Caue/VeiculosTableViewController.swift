import UIKit

class VeiculosTableViewController: UITableViewController {
    
    var dataSource: [Brand] = []
    var brand: Brand!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza o título da página
        
        navigationItem.title = brand.name
        
        // loadItems(brandId: brand.id)
    }
    
    func loadItems(brandId: Int) {
        
        print("brandId: \(brandId)")
        
        REST.loadBrands { (items: [Brand]?) in
            if let items = items {
                self.dataSource = items
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = dataSource[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }

}
