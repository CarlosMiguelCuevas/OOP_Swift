class ShoppingCartSingleton {
    nonisolated(unsafe) static var sharedInstance: ShoppingCartSingleton?
    var productList: [Product] = []

    public class func getInstance() -> ShoppingCartSingleton {
        if(sharedInstance == nil){
            sharedInstance = ShoppingCartSingleton()
        }
        return sharedInstance!
    }
    
    func addProductToCart(_ product: Product) {
        productList.append(product)
    }
    
    func removeProductFromCart(_ product: Product) {
        if let index = productList.firstIndex(where: { $0.name == product.name }) {
            productList.remove(at: index)
        }
    }
}
