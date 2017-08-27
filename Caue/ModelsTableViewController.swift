import UIKit

class ModelsTableViewController: UITableViewController {
    
    var dataSource: [CarModel] = []
    var brand: Brand!
    var car: Car!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza o título da página
        navigationItem.title = car.name
        
        loadItems(carId: car.id, brandId: brand.id)
    }
    
    func loadItems(carId: String, brandId: Int) {
        REST.loadModels(carId: carId, brandId: brandId) { (items: [CarModel]?) in
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
