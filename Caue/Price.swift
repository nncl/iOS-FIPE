import Foundation

class Price {
    var id: String
    var name: String
    var price: String
    var fuelType: String
    var year: String
    
    init (name: String, id: String, price: String, fuelType: String, year: String) {
        self.id = id;
        self.name = name;
        self.price = price;
        self.fuelType = fuelType;
        self.year = year;
    }
}
