public class Product{
    
    private let name: String
    private var price: Double
    private var quantity: Int
    
    public init(name:String, price:Double){
        self.name = name
        self.price = price
        self.quantity = 1
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Double {
        return self.price
    }
    
    func getQuantity() -> Int {
        return self.quantity
    }
    
    func updateQuantity(_ quantity: Int) {
        self.quantity = quantity
    }
}
