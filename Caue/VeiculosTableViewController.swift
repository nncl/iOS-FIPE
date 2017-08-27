import UIKit

class VeiculosTableViewController: UITableViewController {
    
    var dataSource: [Car] = []
    var brand: Brand!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza o título da página
        navigationItem.title = brand.name
        
        // Carrega os carros da marca selecionada
        loadItems(brandId: brand.id)
    }
    
    func loadItems(brandId: Int) {
        REST.loadCars(brandId: brandId) { (items: [Car]?) in
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
