import Foundation

class REST {
    static let basePath = "https://fipeapi.appspot.com/api/1/"
    
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    static func loadBrands(onComplete: @escaping ([Brand]?) -> Void) {
        guard let url = URL(string: "\(basePath)/carros/marcas.json") else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    var items: [Brand] = []
                    for item in json {
                        
                        let id = item["id"] as! Int
                        let name = item["fipe_name"] as! String
                        let item = Brand(name: name, id: id)
                        items.append(item)
                    }
                    
                    onComplete(items)
                } else {
                    onComplete(nil)
                }
            }
            }.resume()
    }
    
    static func loadCars(brandId: Int, onComplete: @escaping ([Car]?) -> Void) {
        guard let url = URL(string: "\(basePath)/carros/veiculos/\(brandId).json") else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    var items: [Car] = []
                    for item in json {
                        let id = item["id"] as! String
                        let name = item["fipe_name"] as! String
                        let item = Car(name: name, id: id)
                        items.append(item)
                    }
                    
                    onComplete(items)
                } else {
                    onComplete(nil)
                }
            }
            }.resume()
    }
    
    static func loadModels(carId: String, brandId: Int, onComplete: @escaping ([CarModel]?) -> Void) {
        guard let url = URL(string: "\(basePath)/carros/veiculo/\(brandId)/\(carId).json") else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    var items: [CarModel] = []
                    for item in json {
                        let id = item["id"] as! String
                        let name = item["name"] as! String
                        let item = CarModel(name: name, id: id)
                        items.append(item)
                    }
                    
                    onComplete(items)
                } else {
                    onComplete(nil)
                }
            }
            }.resume()
    }
    
    static func loadPrice(modelId: String, carId: String, brandId: Int, onComplete: @escaping (Price?) -> Void) {
        guard let url = URL(string: "\(basePath)/carros/veiculo/\(brandId)/\(carId)/\(modelId).json") else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [String: Any]
                    
                    let id = json["id"] as! String
                    let name = json["name"] as! String
                    let price = json["preco"] as! String
                    let fuelType = json["combustivel"] as! String
                    let year = json["ano_modelo"] as! String
                    
                    let item = Price(name: name, id: id, price: price, fuelType: fuelType, year: year)
                    
                    onComplete(item)
                } else {
                    onComplete(nil)
                }
            }
            }.resume()
    }
}
