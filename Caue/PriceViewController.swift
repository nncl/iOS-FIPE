//
//  PriceViewController.swift
//  Caue
//
//  Created by Cauê Almeida on 8/27/17.
//  Copyright © 2017 Cauê Almeida. All rights reserved.
//

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
                self.lblName.text = item?.name
                self.lblPrice.text = item?.price
                self.lblFuelType.text = item?.fuelType
                self.lblYear.text = item?.year
            }
        }
    }


}
