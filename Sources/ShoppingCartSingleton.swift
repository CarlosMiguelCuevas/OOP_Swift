class ShoppingCartSingleton {
    nonisolated(unsafe) static var sharedInstance: ShoppingCartSingleton?
    var productList: [Product] = []

    public class func getInstance() -> ShoppingCartSingleton {
        if(sharedInstance == nil){
            sharedInstance = ShoppingCartSingleton()
        }
        return sharedInstance!
    }
    
    func addProduct(_ product: Product, quantity: Int = 1) {
        if let index = findProductIndex(product.getName()) {
            productList[index].updateQuantity(productList[index].getQuantity() + quantity)
        } else {
            productList.append(product)
        }
    }
    
    func totallyRemoveProductFromCart(_ product: Product) {
        if let index = findProductIndex(product.getName()) {
            productList.remove(at: index)
        }
    }
    
    func removeProductFromCart(_ product: Product, quantity: Int = 1) {
        if let index = findProductIndex(product.getName()) {
            if productList[index].getQuantity() <= quantity {
                totallyRemoveProductFromCart(product)
            }else{
                productList[index].updateQuantity(productList[index].getQuantity() - quantity)
            }
            
        }
    }
    
    func clearCart() {
        productList.removeAll()
    }
    
    func getTotalPrice() -> Double {
        var total: Double = 0
        for product in productList {
            total = product.getPrice() * Double(product.getQuantity())
        }
        return total
    }
    
    private func findProductIndex(_ productName: String) -> Int? {
        return productList.firstIndex(where: { $0.getName() == productName})
    }
}
