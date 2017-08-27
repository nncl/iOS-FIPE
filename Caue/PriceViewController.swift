import UIKit

class PriceViewController: UIViewController {
    
    var dataSource: [Price] = []
    var car: Car!
    var carModel: CarModel!
    var brand: Brand!
    var price: Price!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblFuelType: UILabel!
    @IBOutlet weak var lblYear: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza o título da página
        navigationItem.title = carModel.name
        
        // Retrieve de dados na API
        loadPrice(modelId: carModel.id, carId: car.id, brandId: brand.id)
    }
    
    func loadPrice(modelId: String, carId: String, brandId: Int) {
        REST.loadPrice(modelId: modelId, carId: carId, brandId: brandId) { (item: Price?) in
            
            DispatchQueue.main.async {
                self.lblName.text = item!.name
                self.lblPrice.text = "Preço: \(item!.price)"
                self.lblFuelType.text = "Tipo de Combustível: \(item!.fuelType)"
                self.lblYear.text = "Ano Modelo: \(item!.year)"
            }
        }
    }


}
