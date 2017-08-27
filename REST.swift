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
    
    static func loadItems(onComplete: @escaping ([Brand]?) -> Void) {
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
                        
                        let name = item["fipe_name"] as! String
                        let item = Brand(name: name)
                        items.append(item)
                    }
                    
                    onComplete(items)
                } else {
                    onComplete(nil)
                }
            }
            }.resume()
    }
}
