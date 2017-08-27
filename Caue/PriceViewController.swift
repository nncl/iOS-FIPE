//
//  PriceViewController.swift
//  Caue
//
//  Created by Cauê Almeida on 8/27/17.
//  Copyright © 2017 Cauê Almeida. All rights reserved.
//

import UIKit

class PriceViewController: UIViewController {
    
    var car: Car!
    var carModel: CarModel!
    var brand: Brand!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // marca/veiculo/ano
        print("Marca: \(brand.id)")
        print("Veículo: \(car.id)")
        print("Modelo: \(carModel.id)")
        
        // Atualiza o título da página
        navigationItem.title = carModel.name
        
    }

}
